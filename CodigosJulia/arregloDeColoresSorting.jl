function color(arreglo,indice)
    temporal = arreglo[indice]
end

function intercambio(arreglo,arregloCopia,i,j)
    arreglo[i] = arregloCopia[j]
end

function sortingColores(arregloAOrdenar)
    arregloConIndices = []
    arregloDeErrores  = []
    arregloDeRojos    = []
    arregloDeVerdes   = []
    arregloDeAzules   = []
    i = 1
    
    arregloCopy = deepcopy(arregloAOrdenar)

    for index in eachindex(arregloAOrdenar)
        if color(arregloAOrdenar, index) == "r"
            append!(arregloDeRojos, index)
        elseif color(arregloAOrdenar, index) == "v"
            append!(arregloDeVerdes, index)
        elseif color(arregloAOrdenar, index) == "a"
            append!(arregloDeAzules, index)
        else
            append!(arregloDeErrores,index)
        end
    end

    append!(arregloConIndices,arregloDeVerdes)
    append!(arregloConIndices,arregloDeRojos)
    append!(arregloConIndices,arregloDeAzules)

    for element in arregloConIndices
        intercambio(arregloAOrdenar,arregloCopy,i,element)
        i+=1
    end

    return arregloAOrdenar
    
end

#### Testing
arregloDeColores = ["a","r","v","r","a"]
println("Arreglo de Colores Desordenados: $arregloDeColores\n Ya ordenados: $(sortingColores(arregloDeColores))")