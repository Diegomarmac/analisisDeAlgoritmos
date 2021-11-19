function schedulingProblem(arregloDeActividades)
    arregloOrdenado = sort!(arregloDeActividades, by = x -> x[3]) #Con esto ordenamos el arreglo de modo que la clase que acaba más temprano quede hasta arriba
    indice = 1
    primeraClase = arregloOrdenado[indice][1]
    for otherIndex in 1:length(arregloOrdenado)
        if arregloOrdenado[otherIndex][2] > arregloOrdenado[i][3]
            println(arregloOrdenado[otherIndex][1])
            indice = otherIndex
        end
    end
end