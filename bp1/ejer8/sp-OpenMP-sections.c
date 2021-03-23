#include <stdlib.h>	// biblioteca con funciones atoi(), malloc() y free()
#include <stdio.h>	// biblioteca donde se encuentra la función printf()
#include <time.h>	// biblioteca donde se encuentra la función clock_gettime() 
#include <omp.h> // Paralelizar el codigo

int main(int argc, char** argv){ 
  
  int i; 
  double start;
  double finish;

  //Leer argumento de entrada (nº de componentes del vector)
  if (argc<2){	
    printf("Faltan nº componentes del vector\n");
    exit(-1);
  }
  
  unsigned int N = atoi(argv[1]);	// Máximo N =2^32-1=4294967295 (sizeof(unsigned int) = 4 B)
  //printf("TamaÃ±o Vectores:%u (%u B)\n",N, sizeof(unsigned int)); 

  double *v1, *v2, *v3;
  v1 = (double*) malloc(N*sizeof(double));// malloc necesita el tamaño en bytes
  v2 = (double*) malloc(N*sizeof(double));
  v3 = (double*) malloc(N*sizeof(double));
  if ((v1 == NULL) || (v2 == NULL) || (v2 == NULL)) {	
    printf("No hay suficiente espacio para los vectores \n");
    exit(-2);
  }

  //Inicializar vectores 
  #pragma omp parallel
  {
    if (N < 9)
    {
      #pragma omp sections
      {
        #pragma omp section
        {
          int n_max = N/4;
          for (i = 0; i < n_max; i++)
          {
            v1[i] = N * 0.1 + i * 0.1;
            v2[i] = N * 0.1 - i * 0.1;
          }
        }

        #pragma omp section
        {
          int n_max = N/4*2;
          int n_min = N/4;
          for (i = n_min; i < n_max; i++)
          {
            v1[i] = N * 0.1 + i * 0.1;
            v2[i] = N * 0.1 - i * 0.1;
          }
        }

        #pragma omp section
        {
          int n_max = N/4*3;
          int n_min = N/4*2;
          for (i = n_min; i < n_max; i++)
          {          
            v1[i] = N * 0.1 + i * 0.1;
            v2[i] = N * 0.1 - i * 0.1;
          }
        }

        #pragma omp section
        {
          int n_max = N;
          int n_min = N/4*3;
          for (i = n_min; i < n_max; i++)
          {
            v1[i] = N * 0.1 + i * 0.1;
            v2[i] = N * 0.1 - i * 0.1;
          }
        }
      }

    }
    else
    {
      #pragma omp single
      {
        srand(time(0));
      }

      #pragma omp sections
      {
        #pragma omp section
        {
          int n_max = N/4;
          for (i = 0; i < n_max; i++)
          {
            v1[i] = rand()/ ((double) rand()); 
            v2[i] = rand()/ ((double) rand()); //printf("%d:%f,%f/",i,v1[i],v2[i]);
          }
        }

        #pragma omp section
        {
          int n_max = N/4*2;
          int n_min = N/4;
          for (i = n_min; i < n_max; i++)
          {
            v1[i] = rand()/ ((double) rand()); 
            v2[i] = rand()/ ((double) rand()); //printf("%d:%f,%f/",i,v1[i],v2[i]);
          }
        }

        #pragma omp section
        {
          int n_max = N/4*3;
          int n_min = N/4*2;
          for (i = n_min; i < n_max; i++)
          {
            v1[i] = rand()/ ((double) rand()); 
            v2[i] = rand()/ ((double) rand()); //printf("%d:%f,%f/",i,v1[i],v2[i]);
          }
        }

        #pragma omp section
        {
          int n_max = N;
          int n_min = N/4*3;
          for (i = n_min; i < n_max; i++)
          {
            v1[i] = rand()/ ((double) rand()); 
            v2[i] = rand()/ ((double) rand()); //printf("%d:%f,%f/",i,v1[i],v2[i]);
          }
        }
      }
    }
  
    start = omp_get_wtime();

    //Calcular suma de vectores
    #pragma omp sections
    {

      #pragma omp section
      {
        int n_max = N/4;
        for (i = 0; i < n_max; i++)
          v3[i] = v1[i] + v2[i]; 
      }

      #pragma omp section
      {
        int n_max = N/4*2;
        int n_min = N/4;
        for (i = n_min; i < n_max; i++)
          v3[i] = v1[i] + v2[i]; 
      }

      #pragma omp section
      {
        int n_max = N/4*3;
        int n_min = N/4*2;
        for (i = n_min; i < n_max; i++)
          v3[i] = v1[i] + v2[i]; 
      }

      #pragma omp section
      {
        int n_max = N;
        int n_min = N/4*3;
        for (i = n_min; i < n_max; i++)
          v3[i] = v1[i] + v2[i]; 
      }
    }

    finish = omp_get_wtime();
  } // FIN PARALELISMO

  double ncgt = finish - start;


  //Imprimir resultado de la suma y el tiempo de ejecución
  if (N<12) {
  printf("Tiempo:%11.9f\t / Tamaño Vectores:%u\n",ncgt,N); 
  for(i=0; i<N; i++) 
    printf("/ V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) /\n",
          i,i,i,v1[i],v2[i],v3[i]); 
  }
  else
    printf("Tiempo:%11.9f\t / Tamaño Vectores:%u\t/ V1[0]+V2[0]=V3[0](%8.6f+%8.6f=%8.6f) / / V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) /\n",
          ncgt,N,v1[0],v2[0],v3[0],N-1,N-1,N-1,v1[N-1],v2[N-1],v3[N-1]); 




free(v1); // libera el espacio reservado para v1
free(v2); // libera el espacio reservado para v2
free(v3); // libera el espacio reservado para v3
return 0; 
}