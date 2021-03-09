#!/bin/bash
echo -e "---LOCAL---"
for ((i=0;i<11;i=i+1))
do
    ./SumaVectores_LOCAL $((65536*(2**$i)))
done

echo -e "---GLOBAL---"
for ((i=0;i<11;i=i+1))
do
    ./SumaVectores_GLOBAL $((65536*(2**$i)))
done

echo -e "---DYNAMIC---"
for ((i=0;i<11;i=i+1))
do
    ./SumaVectores_DYNAMIC $((65536*(2**$i)))
done
