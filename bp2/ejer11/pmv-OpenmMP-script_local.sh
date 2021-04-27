
# VERSION LOCAL
#Instrucciones del script para ejecutar código:


echo -e "---SECUENCIAL---"
./pmv-secuencial_EXE 7500
./pmv-secuencial_EXE 15000
    

for (( i=0; i<16; i+=1 )); do

    echo -e "---THREADS=$(($i + 1))"

    export OMP_NUM_THREADS=$(($i + 1))
    
    ./pmv-OpenmMP-reduction_EXE 7500
    ./pmv-OpenmMP-reduction_EXE 15000

done


echo -e "---THREADS=32"

export OMP_NUM_THREADS=32

echo -e "   REDUCTION"
./pmv-OpenmMP-reduction_EXE 7500
./pmv-OpenmMP-reduction_EXE 15000
