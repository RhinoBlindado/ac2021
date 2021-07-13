[:es: Español](#arquitectura-de-computadores) | [:gb: English](#computer-architectures)
 
---
# Arquitectura de Computadores #
## :books: Curso 2020-2021, Grado en Ingeniería Informática, ETSIIT UGR.
### :pushpin: Introducción
Las prácticas se dividieron en 5 bloques en los que había que realizar distintas tareas referentes a elementos de la arquitectura de un ordenador con un enfoque en paralelizar código por medio de la API [OpenMP 5.1](https://www.openmp.org/) y técnicas para la optimización del código aprovechando la arquitectura de la máquina en la que se trabaja.
### :gear: Compilación
Los ejercicios se encuentran en diferentes carpetas, cada una posee un Makefile sencillo, por lo tanto, para compilar cierto ejercicio no hace falta más que irse a la ubicación y en la terminal escribir `make`. 
 
Pueden haber _scripts_ sencillos realizados en Bash, estos pueden ejecutarse en la terminal con `bash ./<nombre de script>`.
 
### :link: Contenidos
* __BP0 - Entorno de programación__
    * El propósito de este bloque fue el de familiarizarse con el clúster de cómputo denominado ATCGrid que se tiene acceso.
    * Se introdujo el gestor de carga de trabajo _slurm_ con el cual se interacciona con el clúster.
    * Se ingresó al _front-end_ del clúster por medio de `ssh` y `ftp` para navegar por los ficheros y subir y/o descargar ficheros relevantes del clúster.
* __BP1 - Herramientas de Programación Paralela I: Directivas OpenMP__
    * Se introdujo la API de OpenMP; breve historia y funcionamiento en general.
    * Se introdujeron las directivas más importantes para poder utilizar la herramienta: `parallel`, `sections`, `for`, `single`, `master`, además de las directivas para la comunicación y sincronización `atomic`, `critical` y `barrier`.
* __BP2 - Herramientas de Programación Paralela II: Cláusulas OpenMP__
    * Se introdujo el concepto de las cláusulas de OpenMP en general.
    * Se introdujeron las cláusulas de control del ámbito de variables: `shared`, `default`, `reduction` y `private` junto a sus variantes; también las cláusulas de copia de valores.
* __BP3 - Herramientas de Programación Paralela III: Interacción con el Entorno en OpenMP y Evaluación de Prestaciones__
    * Se introdujeron las variables de control y entorno de OpenMP.
    * Se introdujeron adicionalmente la cláusula `if` y `schedule`.
    * También, como acceder a estas variables por medio de funciones del entorno de ejecución y como tomar el tiempo de programas paralelos.
* __BP4 - Optimización de Código en Arquitecturas ILP__
    * Se presentaron diferentes maneras de optimizar una ejecución ya sea secuencial o paralela.
    * Se explicaron las diferencias entres los distintos niveles de optimización que puede realizar el compilador de C/C++.
---
# Computer Architectures #
## :books: 2020-2021 Course, Computer Science Engineering Degree, ETSIIT UGR.
### :pushpin: Introduction
The practices were divided in 5 blocks which were all centered around elements of a computer architecture, being focused in making parallel code with the [OpenMP 5.1](https://www.openmp.org/) and techniques to optimize code taking advantage of the architecture that is being used for the program.
### :gear: Compilation
All exercises reside in their own individual folders, each has a simple Makefile thus to compile a certain exercise it is only needed to write `make` inside the chosen folder in the terminal.
 
There can also be some simple Bash scripts which can be executed with `bash ./<name of script>`.
### :link: Contents
* __BP0 - Enviroment__
    * The main purpose of this block was familiarizing with the ATCGrid computing cluster.
    * Introduction of the workload manager slurm to interact with the cluster.
    * Use of `ssh` and `ftp` to navigate the front-end of the cluster and to upload/download files to be used in the cluster.
* __BP1 - Parallel Programming Tools I: OpenMP Directives__
    * Introduction of the OpenMP API, history and general functions.
    * Introduction of relevant directives: `parallel`, `sections`, `for`, `single`, `master`, and directives for communication and synchronization `atomic`, `critical` y `barrier`.
* __BP2 - Parallel Programming Tools II: OpenMP Clauses__
    * General introduction of OpenMP Clauses.
    * Se introdujeron las cláusulas de control del ámbito de variables: `shared`, `default`, `reduction` y `private` junto a sus variantes; también las cláusulas de copia de valores.
    * Introduction of variable scope clauses such as  `shared`, `default`, `reduction` and `private` along with its variants; along with clauses to copy values.
* __BP3 - Parallel Programming Tools III: Interaction with the OpenMP Environment and Performance Evaluation__
    * Introduction of control and environment variables for OpenMP.
    * Introduction of  `if` and `schedule` clauses.
    * Also, how to modify and get variables with functions and procedures given by OpenMP.
* __BP4 - Code Optimization with ILP Architectures__
    * Introduction of different ways to optimize code, be it parallel or sequential.
    * Explanation of different optimization parameters that can be used with C/C++.