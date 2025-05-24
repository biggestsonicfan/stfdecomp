// This tells gcc960 that "print_mes" is an external symbol (in ASM)
extern void print_mes(void);

void call_print_mes_from_c(void) {
    // Local message
    static char msg[] = "Hello";

    // Inline assembly to move the args into g0 and g9
    __asm__ volatile (
        "mov %0, g0\n\t"
        "mov %1, g9\n\t"
        :
        : "r"(msg), "r"(42)
        : "g0", "g9"
    );

    print_mes();  // Just call it; arguments already set
}