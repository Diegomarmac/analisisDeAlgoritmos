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

function binarysearch(arreglo::Vector{T}, valorABuscar::T) where T
    limiteInferior = 1
    limiteSUperior = length(arreglo)
    while limiteInferior ≤ limiteSUperior
        mitad = (limiteInferior + limiteSUperior) ÷ 2
        if arreglo[mitad] > valorABuscar
            limiteSUperior = mitad - 1
        elseif arreglo[mitad] < valorABuscar
            limiteInferior = mitad + 1
        else
            return mitad
        end
    end
    return 0
end
##############
arregloUno = [1,9,8,5,6,7]
arregloDos = [9,7,957,1,0]
sumaABuscar = 10

arregloUno = countsort(arregloUno)
arregloDos = countsort(arregloDos)

for i in 1:length(arregloDos)
    temporal = sumaABuscar - arregloDos[i]
    println("la suma se cumple para")
    println(binarysearch(arregloUno,temporal))
    println(arregloDos[i])
end