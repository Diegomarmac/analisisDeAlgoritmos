function countsort(arreglo::Vector{Int64})
    min, max = extrema(arreglo) #Aquí obtenemos el min y el max del arreglo, de un somin golpe
    arregloOrdenado = fill(0,length(arreglo)) # Inicializamos el arreglo a regresar con ceros, del mismo tamaño que el arrelo a ordenar
    contador = zeros(eltype(arreglo), max - min + 1) # Inicializamos un arreglo contador de tipo Int64 del tamaño de la diferencia de los extremos + 1
    for i in arreglo
        contador[i-min+1] += 1 
    end
    z = 1 # Debiera ser 0 que es donde inician los index de los arreglos, pero en Julia inician en 1
    for i in min:max
        while contador[i-min+1] > 0
            arregloOrdenado[z] = i
            z += 1
            contador[i-min+1] -= 1
        end
    end
    return arregloOrdenado
end
 
################## Caso de los 2 arreglos y su suma máxima
arregloUno = rand(1:20,10)
arregloDos = rand(1:20,10)
println("Arreglos desordenados $arregloUno")
println(arregloDos)
arregloUno = countsort(arregloUno)
arregloDos = countsort(arregloDos)
println("Arreglos Ordenados")
println(arregloUno)
println(arregloDos)
maximaUno = last(arregloUno)
maximaDos = last(arregloDos)
println("La suma máxima es $(maximaUno + maximaDos) ")

#########################
#v = rand(1:2 ^ 10, 20)
#v = rand(1:12,1000) Problema de los 1000 cumpleaños
#println("Arreglo de Enteros Desordenados: $v\n Ya ordenados: $(countsort(v))")