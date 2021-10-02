function find(arregloA::Vector{Int},arregloB::Vector{Int},numeroABuscar::Int,limiteInferiorUno::Int,limiteInferiorDos::Int)
    longitudA = length(arregloA)
    longitudB = length(arregloB)
    
    if limiteInferiorUno == longitudA #Aquí se nos acabó el arregloA
        return arregloB[limiteInferiorDos + numeroABuscar - 1]
    end
    if limiteInferiorDos == longitudB #Aquí se nos acabó el arregloA
        return arregloA[limiteInferiorUno + numeroABuscar - 1]
    end

    if numeroABuscar == 1
        if arregloA[limiteInferiorUno] < arregloB[limiteInferiorDos]
            return arregloA[limiteInferiorUno]
        else
            return arregloB[limiteInferiorDos]
        end
    end
    
    binary = trunc(Int,numeroABuscar/2)

    if (binary - 1) >= longitudA - limiteInferiorUno
        if arregloA[longitudA] < arregloB[longitudB + (binary-1)]
            return arregloB[limiteInferiorDos + (numeroABuscar - (longitudA - limiteInferiorUno) - 1 )]
        else
            return find(arregloA,arregloB,numeroABuscar-binary,limiteInferiorUno,limiteInferiorDos+binary)
        end
    end

    if (binary - 1) >= longitudB - limiteInferiorDos
        if arregloB[(longitudB - 1)] < arregloA[limiteInferiorUno + (binary-1)]
            return arregloA[limiteInferiorUno + (numeroABuscar - limiteInferiorDos) - 1]
        else
            return find(arregloA,arregloB, numeroABuscar-binary, limiteInferiorUno+binary, limiteInferiorDos)
        end
    else
        if arregloA[binary + (limiteInferiorUno - 1)] < arregloB[binary + (limiteInferiorDos - 1)]
            return find(arregloA,arregloB,numeroABuscar - binary,limiteInferiorUno+binary, limiteInferiorDos)
        else
            return find(arregloA,arregloB,numeroABuscar-binary,limiteInferiorUno,limiteInferiorDos+binary)
        end
    end
end

arregloA = collect(1:100000)
arregloB = collect(1:100000)
numeroABuscar = rand(1:100000)
limiteInferiorUno = 1
limiteInferiorDos = 1
println("el n-esimo elemento $(numeroABuscar-1) está en")
println(find(arregloA,arregloB, (numeroABuscar-1),limiteInferiorUno,limiteInferiorDos)) #Por los indices en Julia, le resto uno al número a buscar
println("de la union de A y B")