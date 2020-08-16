.set MAGIC, 0x1badb002
.set FLAGS, (1<<0 | 1<<1)
.set CHECKSUM, -(MAGIC + FLAGS)

.section .multiboot
	.align 4
	.long MAGIC
	.long FLAGS
	.long CHECKSUM

.section .bss, "aw", @nobits
	.align 4096
	.global boot_page_directory

boot_page_directory:
	.skip 4096
boot_page_table1:
	.skip 4096
boot_page_table2:
	.skip 4096


.section .text
	.extern kernelMain
	.global loader
	.type loader, @function

loader:
	cli

	movl $(boot_page_table1 - 0xC0000000), %edi
	movl $0, %esi
	movl $1023, %ecx
label1:
	movl %esi, %edx

	# If current section is read only
	cmp $(pDataStartSymbol), %esi
	jl read_only

	# If current section is read write
	orl $11, %edx
	jmp end_loop
read_only:
	orl $9, %edx
end_loop:
	movl %edx, (%edi)
label2:
	addl $4096, %esi
	addl $4, %edi
	loop label1

	#mapping another page just after the first one
	movl $(boot_page_table2 - 0xC0000000), %edi
	movl $4096, %esi
	movl $1023, %ecx
label5:
	movl %esi, %edx
	orl $11, %edx
	movl %edx, (%edi)
	addl $4096, %esi
	addl $4, %edi
	loop label5

label3:
	# Mapping VGA text buffer
	movl $(0x000B8000 | 0x003), boot_page_table1 - 0xC0000000 + 1023 * 4
	
	movl $(boot_page_table1 - 0xC0000000 + 0x003), boot_page_directory - 0xC0000000 + 0
	movl $(boot_page_table1 - 0xC0000000 + 0x003), boot_page_directory - 0xC0000000 + 768 * 4
	movl $(boot_page_table2 - 0xC0000000 + 0x003), boot_page_directory - 0xC0000000 + 769 * 4
	movl $(boot_page_directory - 0xC0000000), %ecx
	movl %ecx, %cr3
	movl %cr0, %ecx
	orl $0x80010000, %ecx
	movl %ecx, %cr0
	lea label4, %ecx
	jmp *%ecx
label4:
	movl $0, boot_page_directory + 0
	movl %cr3, %ecx
	movl %ecx, %cr3

	mov $kernel_stack, %esp
	push %eax

	add $0xC0000000, %ebx
	push %ebx

	call kernelMain

_stop:
	cli
	hlt
	jmp _stop

.section .bss
.space 2*1024*1024
kernel_stack: