ENTRY(loader)
OUTPUT_ARCH(i386:i386)
OUTPUT_FORMAT(elf32-i386)

SECTIONS
{
	. = 0xC0100000;

	pKernelStartSymbol = . - 0xC0000000;

	.text ALIGN(4K) : AT(ADDR(.text) - 0xC0000000)
	{
		*(.multiboot)
		*(.text)
	}

	pRodataStartSymbol = . - 0xC0000000;

	.rodata ALIGN(4K) : AT(ADDR(.rodata) - 0xC0000000)
	{
		*(.rodata)
	}

	pDataStartSymbol = . - 0xC0000000;

	.data ALIGN(4K) : AT(ADDR(.data) - 0xC0000000)
	{
		*(.data)
	}

	pBssStartSymbol = . - 0xC0000000;

	.bss ALIGN(4K) : AT(ADDR(.bss) - 0xC0000000)
	{
		*(COMMON)
		*(.bss)
		*(.bootstrap_stack)
	}

	pKernelEndSymbol = ALIGN(4K) - 0xC0000000;
}