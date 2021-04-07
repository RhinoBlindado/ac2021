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
for ((i=14;i<27;i=i+1))
do
    srun ./SumaVectores_seq_EXE $((2**$i))
done

echo -e "---PARALLEL FOR---"
for ((i=14;i<27;i=i+1))
do
    srun ./sp-OpenMP-for_EXE $((2**$i))
done

echo -e "---PARALLEL SECTIONS---"
for ((i=14;i<27;i=i+1))
do
    srun ./sp-OpenMP-sections_EXE $((2**$i))
done

