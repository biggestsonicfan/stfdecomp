import argparse, sys, array, os, struct, pathlib, hashlib, zipfile, json, time, decimal
from io import BytesIO
from functools import partial
from shutil import move

parser = argparse.ArgumentParser(description='Automated tool for extracting and processing Sonic the Fighters game assets.')
parser.add_argument('--all', dest='all', action='store_true', help='Extract and process all assets')
parser.add_argument('--rom', dest='rom', action='store_true', help='Extract and process ROM data')
parser.add_argument('--cpres', dest='cpres', action='store_true' ,help='Extract and prepare DSP coprocessor data for use in a decompilation')


rom_data_path = os.path.join(sys.path[0],'..', 'rom')

def extract_rom_data():
    print('Extracting ROM data...')
    with open(os.path.join(sys.path[0],'sfight_data.json'), 'r') as json_data:
        rom_info = json.load(json_data)
        if checksum_check(rom_info, rom_data_path ) == True:
            print('All files accounted for. Proceeding with extraction.')
            create_data(rom_info, rom_data_path)
        else:
            print('ERROR: Romset or checksum failure: Cannot proceed!')

def checksum_check(rom_info, rom_data_path):
    #First, make sure we have all romsets
    romset_list = []
    for rom_file in rom_info.keys():
        for file_info in rom_info[rom_file]:
            for file_name in file_info.keys():
                if file_info[file_name]['romset'] not in romset_list:
                    romset_list.append(file_info[file_name]['romset'])
    for romset in romset_list:
        if os.path.exists(os.path.join(rom_data_path, f'{romset}.zip')) == False:
            print(f'Romset: {romset} not found!')
            return False
        else:
            print(f'Romset: {romset} found!')
    #Okay, all romsets are found. Now we need to verify checksums.
    for rom_file in rom_info.keys():
        for file_info in rom_info[rom_file]:
            for file_name in file_info.keys():
                json_checksum = file_info[file_name]['checksum']
                romset = file_info[file_name]['romset']
                with zipfile.ZipFile(os.path.join(rom_data_path, f'{romset}.zip')) as romset_zip:
                    zip_checksum = hex(romset_zip.getinfo(file_name).CRC)
                    if str(f'0x{json_checksum}') == zip_checksum:
                        print(f'Checksum correct for file: {file_name}')
                    else:
                        print(f'Checksum failed for file: {file_name}! Expected: 0x{json_checksum} - Found: {zip_checksum}')
                        return False
    return True

def interleave_roms(rom1, rom2):
    rom_data_path = os.path.join(sys.path[0],'..', 'rom')
    rom1_filename = list(rom1.keys())[0]
    rom1_zip = zipfile.ZipFile(os.path.join(rom_data_path, f'{rom1[rom1_filename]['romset']}.zip'))
    rom2_filename = list(rom2.keys())[0]
    rom2_zip = zipfile.ZipFile(os.path.join(rom_data_path, f'{rom1[rom1_filename]['romset']}.zip'))
    combined = BytesIO()
    with rom1_zip.open(rom1_filename, 'r') as rom1_data, rom2_zip.open(rom2_filename, 'r') as rom2_data:
        for chunk1 in iter(partial(rom1_data.read, 2), b''):
            combined.write(chunk1)
            for chunk2 in iter(partial(rom2_data.read, 2), b''):
                combined.write(chunk2)
                break
    return combined

def write_rom(rom_type, rom_data, rom_data_path):
    output_rom = os.path.join(rom_data_path, f'{rom_type}')
    rom_paths = rom_data[rom_type]
    rom = range(0, len(rom_paths), 2)
    #Check if the output file already exists
    if os.path.exists(os.path.join(sys.path[0], '..', 'temp', output_rom)) == False:
        with BytesIO() as rom_data:
            for i in rom:
                temp = interleave_roms(rom_paths[i], rom_paths[i+1])
                temp.seek(0)
                rom_data.write(temp.read())
            with open(os.path.join(sys.path[0], '..', 'temp', output_rom), 'wb') as f:
                f.write(rom_data.getbuffer())
        print(f'Created file: {output_rom}')


def create_data(rom_data, rom_data_path):
    #Substitute for TGP_LoadDATA, TGP_LoadPOLYGON, TGP_LoadTEXTURE)
    for key in rom_data.keys():
        write_rom(key, rom_data, rom_data_path)

def write_assembly_data(bytes_obj, symbol_name='binary_data', output_file='output.S', bytes_per_line=16):
    '''
    Write a .S file with an array of bytes formatted for 80960 assembly.

    :param bytes_obj: A bytes-like object containing binary data.
    :param symbol_name: The label name to be used in assembly.
    :param output_file: Path to the output .S file.
    :param bytes_per_line: Number of bytes per line in output.
    '''
    with open(output_file, 'w') as f:
        f.write('\t.data\n')
        f.write(f'\t.global {symbol_name}\n')
        f.write(f'{symbol_name}:\n')

        for i in range(0, len(bytes_obj), bytes_per_line):
            chunk = bytes_obj[i:i + bytes_per_line]
            hex_bytes = ', '.join(f'0x{b:02x}' for b in chunk)
            f.write(f'\t.byte {hex_bytes}\n')

def check_extracted(rom_type):
    #Check if the output file already exists
    if os.path.exists(os.path.join(rom_data_path, rom_type)) == False:
        print(f'ERROR: {rom_type} not found!')
        return False
    else:
        print(f'Found: {rom_type}')
        return True

def extract_cpres_data():
    print('Extracting DSP coprocessor data...')
    rom_type = 'rom_code1.bin'
    if check_extracted(rom_type) == False:
        return
    _cpres1_offset = int('0xB6318',base=16)
    _cpres1_length = int('0x741C',base=16)
    _cpres2_offset = int('0xBD748 ',base=16)
    _cpres2_length = int('0x490E',base=16)
    with open(os.path.join(rom_data_path, rom_type), 'rb') as rom_code1:

        rom_code1.seek(_cpres1_offset)
        cpres1 = rom_code1.read(_cpres1_length)
        cpres1_output = os.path.join(sys.path[0], '..', 'src', 'include', 'cpres1.S')
        write_assembly_data(cpres1, symbol_name='_cpres_data', output_file=cpres1_output, bytes_per_line=16)
        print(f'Extracted DSP coprocessor data from rom_code1.bin: {cpres1_output}')

        rom_code1.seek(_cpres2_offset)
        cpres2 = rom_code1.read(_cpres2_length)
        cpres2_output = os.path.join(sys.path[0], '..', 'src', 'include', 'cpres2.S')
        write_assembly_data(cpres2, symbol_name='_cpres_data2', output_file=cpres2_output, bytes_per_line=16)
        print(f'Extracted DSP coprocessor data from rom_code1.bin: {cpres2_output}')

def main():
    args = parser.parse_args()
    if args.all:
        print('Extracting all assets...')

        #Extracting ROM data
        extract_rom_data()

        #DSP coprocessor data extraction
        extract_cpres_data()

    elif args.cpres:
        extract_rom_data()
    elif args.cpres:
        extract_cpres_data()
    else:
        print('No valid arguments provided. Use -h for help.')


if __name__ == '__main__':
    main()
