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
    
    arregloCopy = deepcopy(arregloAOrdenar)  # TIempo 0(1)

    for index in eachindex(arregloAOrdenar)
        if color(arregloAOrdenar, index) == "r" # TIempo 0(1)
            append!(arregloDeRojos, index)
        elseif color(arregloAOrdenar, index) == "v" # TIempo 0(1)
            append!(arregloDeVerdes, index)
        elseif color(arregloAOrdenar, index) == "a" # TIempo 0(1)
            append!(arregloDeAzules, index)
        else                                           # TIempo 0(n)
            append!(arregloDeErrores,index)             # Esto es opcional, como gestión de errores o casos extraños
        end
    end

    append!(arregloConIndices,arregloDeVerdes)      # TIempo 0(1)
    append!(arregloConIndices,arregloDeRojos)       # TIempo 0(1)
    append!(arregloConIndices,arregloDeAzules)      # TIempo 0(1)

    for element in arregloConIndices                   
        intercambio(arregloAOrdenar,arregloCopy,i,element) # Just a Swap utlity to save time
        i+=1
    end

    return arregloAOrdenar
    
end

#### Testing
arregloDeColores = ["a","r","v","r","a"]
println("Arreglo de Colores Desordenados: $arregloDeColores\n Ya ordenados: $(sortingColores(arregloDeColores))")