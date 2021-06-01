#include <stdio.h>
#include <stdlib.h>
#include <time.h>	

int main(int argc, char **argv)
{
    if(argc < 2) 
    {
        printf("Uso: ./daxpy N\n");
        exit(-1);
    }

    // Declaración de datos.
    struct timespec cgt1,cgt2; double ncgt;

    int N = atoi(argv[1]);

    double *x, *y;
        x = (double *)malloc(N * sizeof(double));
        y = (double *)malloc(N * sizeof(double));

    if(x == NULL || y == NULL)
    {
        printf("Error en la reserva de espacio\n");
        exit(-2);
    }

    // Inicialización de datos.
    int aAux = 0, bAux = N, i;
    struct drand48_data randBuffer;
    double randomNumber;
    srand48_r(time(NULL), &randBuffer);
    drand48_r(&randBuffer, &randomNumber);
    double a = randomNumber;
    for (int i = 0; i < N; i++)
    {
        if (N < 9)
        {
            x[i] = ++aAux;
            y[i] = ++bAux;
        }
        else
        {
            drand48_r(&randBuffer, &randomNumber);
            x[i] = 10*randomNumber;
            drand48_r(&randBuffer, &randomNumber);
            y[i] = 10*randomNumber;
        }
    }

    // Cálculo
    clock_gettime(CLOCK_REALTIME, &cgt1);
    for (i=0;i<N;i++) y[i]= a*x[i] + y[i];
    clock_gettime(CLOCK_REALTIME,&cgt2);

    ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+
         (double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

    // Imprimir los datos
    printf("Dimension: %d Tiempo: %11.9f \n", N, ncgt);

    printf("Resultado: \n");
    if (N < 9)
    {
        for (int i = 0; i < N; i++)
        {
            printf("[%d] = %2.4f ", i, y[i]);
        }
    }
    else
    {
        printf("[0] = %2.4f, ..., [%d] = %2.4f", y[0], N-1, y[N-1]);
    }
    printf("\n");


    // Liberar memoria
    free(x);
    free(y);

    return 0;
} 
