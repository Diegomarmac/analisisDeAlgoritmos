## find(arregloA, arregloB, numeroABuscar, comparadorUno, comparadorDos)
__Todos los -1 se omiten si programamos en Julia__  


__Es una adaptación de binary search para dos arreglos que juntos son la union de un tercero__  


1. longitudA = length(arregloA)
2. longitudB = length(arregloB)
3. if (comparadorUno == longitudA) _Aquí se nos acabó el arregloA_
    1. return arregloB[comparadorB + numeroABuscar - 1]
4. if (comparadorDos == longitudB) _Aquí se nos acabó el arregloB
    1. return arregloA[comparadorUno + numeroABuscar -1] 
5. if (numeroABuscar == 1)
    1. if arregloA[comparadorUno] < arregloB[comparadorDos]
        1. return arregloA[comparadorUno]
    2. else
        1. return arregloB[comparadorDos]
6. binary = numeroABuscar/2
7. if (binary - 1 >= longitudA - comparadorUno) _aquí verificamos que el tamaño de A sea o no menor que binary_
    1. if (arregloA[longitudA - 1] < arregloB[comparadorDos + binary - 1])
        1. return arregloB[comparadorDos + (numeroABuscar - (longitudA - comparadorUno) - 1 )]
    2. else return find(arregloA, arregloB, numeroABuscar-binary, comparadorUno,comparadorDos+binary)
8. if (binary -1 >= longitudB - comparadorDos) _aquí verificamos que el tamaño de B sea o no menor que binary_
    1. if (arregloB[longitudB - 1] < arregloA[comparadorUno + binary - 1] )
        1. return arregloA[comparadorUno + (numeroABuscar - comparadorDos) -1 ]
    2. else return find(arregloA,arregloB,numeroABuscar - binary, comparadorUno + binary, comparadorDos )
9. else 
    1. if (arregloA[binary + comparadorUno - 1] < arregloB[binary + comparadorDos - 1] )
        1. return find(arregloA,arregloB, numeroABuscar - binary, comparadorUno + binary, comparadorDos)
    2. else return find(arregloUno,arregloDos,numeroABuscar - binary, comparadorUno, comparadorDos + binary)
10. FIN DE TODO :)   



## Nota al llamarse por primera vez la función
No supe como poner esto en el pseudocodigo, que __solamente__ en la primera vez que se ejecute, deben inicializarse de esta manera las siguientes variables:  


comparadorUno = 0 _si se programa en Julia, inicializar en 1_  


comparadorDos = 0 _si se programa en Julia, inicializar en 1_
