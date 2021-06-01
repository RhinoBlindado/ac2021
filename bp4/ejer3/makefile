
all: daxpyO0_EXE daxpyO2_EXE daxpyO3_EXE daxpyOs_EXE daxpyO0.s daxpyO2.s daxpyO3.s daxpyOs.s

daxpyO0_EXE: daxpy.c
	gcc -O0 -o $@ $<

daxpyO2_EXE: daxpy.c
	gcc -O2 -o $@ $<
	
daxpyO3_EXE: daxpy.c
	gcc -O3 -o $@ $<

daxpyOs_EXE: daxpy.c
	gcc -Os -o $@ $<
	
daxpyO0.s: daxpy.c
	gcc -S -O0 -o $@ $<
	
daxpyO2.s: daxpy.c
	gcc -S -O2 -o $@ $<

daxpyO3.s: daxpy.c
	gcc -S -O3 -o $@ $<

daxpyOs.s: daxpy.c
	gcc -S -Os -o $@ $<
