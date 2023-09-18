AS = as
LD = ld
ASFLAGS = -mlittle-endian

main.elf: main.o
	$(LD) $< -o $@

main.o:	main.s
	$(AS) $(ASFLAGS) $< -o $@

clean: 
	rm -f *.o *.elf

run: main.elf
	@ ./$<