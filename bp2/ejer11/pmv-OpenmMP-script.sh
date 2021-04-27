#!/bin/bash
#Ordenes para el Gestor de carga de trabajo:
#1. Asigna al trabajo un nombre
#SBATCH --job-name=bp2_11

# VERSION ATCGRID
#Instrucciones del script para ejecutar código:
echo "### Cola: $SLURM_JOB_PARTITION"

echo -e "---SECUENCIAL---"
srun ./pmv-secuencial_EXE 7500
srun ./pmv-secuencial_EXE 15000
    

for (( i=0; i<16; i+=1 )); do

    echo -e "---THREADS=$(($i + 1))"

    export OMP_NUM_THREADS=$(($i + 1))
    
    srun ./pmv-OpenmMP-reduction_EXE 7500
    srun ./pmv-OpenmMP-reduction_EXE 15000

done


echo -e "---THREADS=32"

export OMP_NUM_THREADS=32

echo -e "   REDUCTION"
srun ./pmv-OpenmMP-reduction_EXE 7500
srun ./pmv-OpenmMP-reduction_EXE 15000
