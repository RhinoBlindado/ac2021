#!/bin/bash
#Ordenes para el Gestor de carga de trabajo:
#1. Asigna al trabajo un nombre
#SBATCH --job-name=bp1_10
#2. Asignar el trabajo a una partición (cola)
#SBATCH --partition=ac
#3. Asignar el trabajo a un account
#SBATCH --account=ac

#Obtener informacion de las variables del entorno del gestor de carga de trabajo:

echo "Id. usuario del trabajo: $SLURM_JOB_USER"
echo "Id. del trabajo: $SLURM_JOBID"
echo "Nombre del trabajo especificado por usuario: $SLURM_JOB_NAME"
echo "Directorio de trabajo (en el que se ejecuta el script): $SLURM_SUBMIT_DIR"
echo "Cola: $SLURM_JOB_PARTITION"
echo "Nodo que ejecuta este trabajo:$SLURM_SUBMIT_HOST"
echo "No de nodos asignados al trabajo: $SLURM_JOB_NUM_NODES"
echo "Nodos asignados al trabajo: $SLURM_JOB_NODELIST"
echo "CPUs por nodo: $SLURM_JOB_CPUS_PER_NODE"

#Instrucciones del script para ejecutar código:

echo -e "---SECUENCIAL---"
    srun time ./SumaVectores_seq_EXE 8388608
    srun time ./SumaVectores_seq_EXE 16777216
    srun time ./SumaVectores_seq_EXE 33554432
    srun time ./SumaVectores_seq_EXE 67108864

echo -e "---PARALLEL FOR---"
    srun time ./sp-OpenMP-for_EXE 8388608
    srun time ./sp-OpenMP-for_EXE 16777216
    srun time ./sp-OpenMP-for_EXE 33554432
    srun time ./sp-OpenMP-for_EXE 67108864

