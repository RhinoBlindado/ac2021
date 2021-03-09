#!/bin/bash
#Ordenes para el Gestor de carga de trabajo:
#1. Asigna al trabajo un nombre
#SBATCH --job-name=SumaVectores
#2. Asignar el trabajo a una partición (cola)
#SBATCH --partition=ac
#3. Asignar el trabajo a un account
#SBATCH --account=ac

echo -e "---LOCAL---"
for ((i=0;i<11;i=i+1))
do
    srun ./SumaVectores_LOCAL $((65536*(2**$i)))
done

echo -e "---GLOBAL---"
for ((i=0;i<11;i=i+1))
do
    srun ./SumaVectores_GLOBAL $((65536*(2**$i)))
done

echo -e "---DYNAMIC---"
for ((i=0;i<11;i=i+1))
do
    srun ./SumaVectores_DYNAMIC $((65536*(2**$i)))
done
