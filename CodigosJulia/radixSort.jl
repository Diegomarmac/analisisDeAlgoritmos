function radixsort(ordenar::Vector{Int})
    arreglo = deepcopy(ordenar)
    for cambio in 63:-1:0
        temporal = Vector{Int}(undef, length(arreglo))
        j = 0
        for i in 1:length(arreglo)
            if (cambio == 0) == ((arreglo[i] << cambio) >= 0)
                arreglo[i - j] = arreglo[i]
            else
                temporal[j + 1] = arreglo[i]
                j += 1
            end
        end
        temporal[j+1:end] .= arreglo[1:length(temporal)-j]
        arreglo = temporal
    end
    arreglo
end
 
function test()
    arrays = [[1180, 450, -705, -90, -802, 24, 2, 66], [-4, 5, -26, 58, -990, 331, 331, 990, -1837, 2028]]
    for array in arrays 
        println(radixsort(array))
    end
end
 
test()
 ## PONER COMENTARIOS