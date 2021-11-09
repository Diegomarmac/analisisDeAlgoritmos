function quicksort!(arreglo,i=1,j=length(arreglo))
    if j > i
        pivote = arreglo[rand(i:j)] #Tomamos un número aleatorio dentro del rango de la longitud del arreglo
        less, greater = i, j
        while less <= greater
            while arreglo[less] < pivote
                less += 1
            end
            while arreglo[greater] > pivote
                greater -= 1
            end
            if less <= greater
                arreglo[less], arreglo[greater] = arreglo[greater], arreglo[less]
                less += 1
                greater -= 1
            end
        end
        quicksort!(arreglo,i,greater)
        quicksort!(arreglo,less,j)
    end
    return arreglo
end

########### Testing
arregloAleatorio = rand(-10:10, 10)
println("un arrelo aleatorio desordenado: $arregloAleatorio ")
println("Ahora aparece ordenado! ", quicksort!(arregloAleatorio))