# Sonic the Fighters - Decompilation

This repository will contain buildable code using GCC-esque tools to compile the executable binaries necessary to run the data of Sonic the Fighters on a Model2b arcade board. It is an accumulation of many years of work to better understand the inner workings of AM2's arcade engine from the early to mid-1990s.

##### Credits and attribution:

- [Tim Ritiau | egregiousguy](https://x.com/egregiousguy) - For collaboration, direct research, and dedication in their own Model2 journey.
- [SteveBlockhead](https://forums.sonicretro.org/index.php?posts/924406/) - For originally and accidentally discovering debug mode, which allowed documenting the code much easier.
- [Ryou of Sudden Desu](https://bsky.app/profile/suddendesu.bsky.social) - For their constant, independent digital archaeology efforts which led to the discovery of how Debug Mode was truly activated, as well as efforts to improve and implement new inputs in MAME's code.
- [Joshua Scoggins | DrItanium](https://github.com/DrItanium) - For their in-depth professional knowledge of the 80960 architecture, as well as improving and documenting the original disassembly.
- [brouhaha](https://mastodon.social/@brouhaha) - For being a hardware and software [rubber duck debugger](https://en.wikipedia.org/wiki/Rubber_duck_debugging) with expansive embedded systems knowledge.

##### With special thanks to:

- The decompilation/disassembly teams behind Mario 64, Zelda 64, Star Fox 64, Paper Mario 64, Dinosaur Planet, Pokémon GS Spaceworld Protos
- Founders and maintainers of [The Cutting Room Floor Wiki](https://tcrf.net)
- [Sappharad](https://github.com/Sappharad) - For kickstarting Sonic the Fighters research by discovering Honey in Sonic Gems Collection [two decades ago](https://archive.is/mcAuj).

##### Donors towards research efforts:

- [Brady Hartel](https://x.com/BradyHartel)

## Compiling the program ROMs (DSP and sound executable decomps coming soon)

   - While the code is almost entirely still in assembly language, the way it is built will mostly remain the same as this repo evolves.
   - It's recommended to install CTOOLS 6.0 from this [archive.org mirror](https://archive.org/details/iq-80960-rxk-5-2). For Linux users, CTOOLS should be WINE compatible, but you can try prebuilds of [i960-elf-gcc-3.4.6](https://archive.org/details/i960-elf-gcc-3.4.6.tar) or [i960-coff-gcc-3.4.6](https://archive.org/details/i960-coff-gcc-3.4.6.tar). You can also attempt to build your own with instructions to get you started with binutils 2.16 I've provided [here](https://github.com/biggestsonicfan/stfdisasm/tree/master/GNU).
   - Ensure the `bin` folder of your GCC tools is in your path or edit the Makefile to point to the correct directories. (TODO: Create automake file which verifies GCC versions and assigns paths)
   - Put `schamp.zip` (`MD5 4826E870E5652811DE149C2EC89E3A20`) and `sfight.zip` (`MD5 E801C222C174E45E091E361DE83503F0`) in the `rom` directory for asset extraction. (Currently used for DSP binaries but will be used for sound, texture, and model extraction sometime in the future)
   - Further dependencies (`make`, `python`, `md5sum`) will vary by platform, but I highly recommend Windows users open the repo's folder with VSCode to recognize the `Makefile` to ensure the environment will be correct.
   - In a terminal window (PowerShell is recommended for Windows users), navigate to the repo and run `make`. The Makefile should produce a binary in the `bin` folder with presplit ROMs for use in emulators in the `split` folder.
   - #### TL;DR: Use CTOOLS, put the ROMs in the rom folder, and run the Makefile.

## Assets

No assets for the game will be provided in this repository, however, you will be able to extract them all using the various scripts and binaries in this repo.
- Using the `data_extract.py` script you can extract various assets:
	- Run with `--all` to extract all currently supported asset extractions (they will be listed below)
	- Run with `--rom` to extract all interleaved ROM data from the `schamp` and `sfight` archives located in the `rom` folder.
	- Run with `--cpres` to extract and process DSP coprocessor executables from `rom_code1.bin` into 80960 compliant `.S` preprocessor files. (This will become deprecated when the coprocessors become decompiled)
		- More to come... (Models, textures, sounds, music samples, music arrangements)

## What this decompilation is:

This decompilation is an analysis of a game and all its components. These components have been stripped down to human-readable code to define the logic of the game in a way that can be rebuilt into its original form.

## What this decompilation _is not_:

This decompilation is not open source. Just like its predecessor, [stfdisasm](https://github.com/biggestsonicfan/stfdisasm), it is source-available. This code is [not licensed](https://choosealicense.com/no-permission/), and as such, all rights are reserved. GitHub's terms of service [allow users to view and fork the repository within the GitHub site](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository#choosing-the-right-license), and this allows for pull requests. The code may become licensed someday, but for now it will remain source-available for research purposes.