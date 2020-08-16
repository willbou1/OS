GPPARAMS = -m32 -nostdlib -fno-builtin -fno-leading-underscore
ASPARAMS = --32
LDPARAMS = -melf_i386

objects = PCI.o debug.o memory.o keyboardDriver.o CPU.o VGA3Driver.o interruptStubs.o loader.o GDT.o IDT.o ports.o interrupts.o kernel.o
ROOT_DIRECTORY = /root/os/

build: mykernel.iso
	rm *.o

%.o: Sources/%.c
	gcc $(GPPARAMS) -I $(ROOT_DIRECTORY) -o $@ -c $<

%.o: Sources/%.s
	as $(ASPARAMS) -o $@ $<

mykernel.bin: linker.ld $(objects)
	ld $(LDPARAMS) -T $< -o $@ $(objects)

install: kernel.bin
	cp $< /boot/mykernel.bin

mykernel.iso: mykernel.bin
	mkdir iso
	mkdir iso/boot
	mkdir iso/boot/grub
	cp $< iso/boot
	echo "set timeout=0" > iso/boot/grub/grub.cfg
	echo "set default=0" >> iso/boot/grub/grub.cfg
	echo "" >> iso/boot/grub/grub.cfg
	echo 'menuentry "mykernel" {' >> iso/boot/grub/grub.cfg
	echo '	multiboot /boot/mykernel.bin' >> iso/boot/grub/grub.cfg
	echo '	boot' >> iso/boot/grub/grub.cfg
	echo '}' >> iso/boot/grub/grub.cfg
	grub-mkrescue --output=$@ iso
	rm -rf iso