import random


def quicksortAleatorio(arreglo):
    if (len(arreglo)) < 2:
        return arreglo
    else:
        pivote = arreglo[random.randint(len(arreglo) // 4, len(arreglo)*3 //4)]
        # En esta instrucción quitamos los cuartos bilaterales para qudearnos con un 50% de probabilidad de tomar elementos en medio del arreglo
        less    = [i for i in arreglo[1:] if i <= pivote] # Sub arreglo de elementos menores que el pivote
        greater = [i for i in arreglo[1:] if i > pivote ] # Sub arreglo de elementos mayores que el pivote

        return quicksortAleatorio(less) + [pivote] + quicksortAleatorio(greater)

def quicksortInputUsuario(arreglo):
    if (len(arreglo)) < 2:
        return arreglo
    else:
        pivote = arreglo[random.randint(0, len(arreglo)-1)] #Tomamos un número aleatorio dentro del rango de la longitud del arreglo
        less    = [i for i in arreglo[1:] if i <= pivote] # Sub arreglo de elementos menores que el pivote
        greater = [i for i in arreglo[1:] if i > pivote ] # Sub arreglo de elementos mayores que el pivote

        return quicksortInputUsuario(less) + [pivote] + quicksortInputUsuario(greater)


### Esto es solo de testing ###
arregloAleatorio = [random.randint(-100,100) for _ in range(8)]
arregloUsuario = [10,5,2,3]

print(f"Arreglo aleatorio desordenado: {arregloAleatorio}")
print(f"Arreglo ordenado: {quicksortAleatorio(arregloAleatorio)}")
print(f"Arreglo desordenado: {arregloUsuario}")
print(f"Arreglo ordenado: {quicksortInputUsuario(arregloUsuario)}")