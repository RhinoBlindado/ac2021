#Instrucciones del script para ejecutar código:

export OMP_DYNAMIC=FALSE
export OMP_NUM_THREADS=4

echo -e "---SECUENCIAL---"
for ((i=14;i<27;i=i+1))
do
    ./SumaVectores_seq_EXE $((2**$i))
done

echo -e "---PARALLEL FOR---"
for ((i=14;i<27;i=i+1))
do
    ./sp-OpenMP-for_EXE $((2**$i))
done

echo -e "---PARALLEL SECTIONS---"
for ((i=14;i<27;i=i+1))
do
    ./sp-OpenMP-sections_EXE $((2**$i))
done

