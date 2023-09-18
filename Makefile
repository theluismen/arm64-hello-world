AS = as
LD = ld
#AS = aarch64-linux-gnu-as
#LD = aarch64-linux-gnu-ld
ASFLAGS = -mlittle-endian

main.elf: main.o
	$(LD) $< -o $@

main.o:	main.s
	$(AS) $(ASFLAGS) $< -o $@

clean: 
	rm -f *.o *.elf

run: main.elf
	@ ./$<