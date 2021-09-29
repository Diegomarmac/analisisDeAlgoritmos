function swap(arreglo, i, j)
    arreglo[i], arreglo[j] = arreglo[j], arreglo[i] 
end

#####Recordar que el uso de ! al final del nombre de una función en Julia
### es unac convención para indicar que los argumentos son
## pass-by-sharing 

function pd!(arreglo, primero, ultimo)
    while (c = 2 * primero - 1) < ultimo
        if c < ultimo && arreglo[c] < arreglo[c + 1]
            c += 1
        end
        if arreglo[primero] < arreglo[c]
            swap(arreglo, c, primero)
            primero = c
        else
            break
        end
    end
end
 
function heapify!(arreglo, n) #n es un indice
    f = div(n, 2)
    while f >= 1 
        pd!(arreglo, f, n)
        f -= 1 
    end
end
 
function heapsort!(arreglo)
    longitud = length(arreglo)
    heapify!(arreglo, longitud)
    while longitud > 1 
        swap(arreglo, 1, longitud)
        longitud -= 1
        pd!(arreglo, 1, longitud)
    end
    return arreglo
end
 
######################### Lo de aca abajo es solo para testing
arreglo = rand(-10:10, 10)

println("un arrelo aleatorio desordenado: $arreglo ")
println("Ahora aparece ordenado! ", heapsort!(arreglo))
