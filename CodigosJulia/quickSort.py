import random

dondeInicio = 0

def quicksort(arreglo):
    if (len(arreglo)) < 2:
        return arreglo
    else:
        if len(arreglo) == 3:
            dondeInicio = 0 # Si el arreglo es de solo 3 elementos, nos conviene tomar el indice 0 para ordenar
        else:
            dondeInicio = random.randint(len(arreglo) // 4, len(arreglo)*3 //4)
            # En esta instrucción quitamos los cuartos bilaterales para qudearnos con un 50% de probabilidad de tomar elementos en medio del arreglo
        pivote  = arreglo[dondeInicio]
        less    = [i for i in arreglo[1:] if i <= pivote] # Sub arreglo de elementos menores que el pivote
        greater = [i for i in arreglo[1:] if i > pivote ] # Sub arreglo de elementos mayores que el pivote

        return quicksort(less) + [pivote] + quicksort(greater)

### Esto es solo de testing ###
arregloAleatorio = [random.randint(-100,100) for _ in range(50)]

print(f"Arreglo aleatorio desordenado: {arregloAleatorio}")
print(f"Arreglo ordenado: {quicksort(arregloAleatorio)}")