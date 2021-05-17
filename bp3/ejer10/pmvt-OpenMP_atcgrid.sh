#!/bin/bash
#Ordenes para el Gestor de carga de trabajo:
#1. Asigna al trabajo un nombre
#SBATCH --job-name=bp3_10

echo ">INICIO SCRIPT"
echo ">>COLA: $SLURM_JOB_PARTITION"

schedule=("static" "dynamic" "guided" "static,1" "dynamic,1" "guided,1" "static,64" "dynamic,64" "guided,64")


for (( i=0; i<9; i+=1 )); do

    echo -e ">>>EJECUTANDO ${schedule[$i]}..."

    export OMP_SCHEDULE="monotonic:${schedule[$i]}"
    
    srun ./pmtv-OpenMP_EXE 15360

    echo "Finalizado"
done

echo ">FIN"
