function guessTheNumber(limiteSuperior, limiteInferior)
    variableABuscar = limiteInferior + ((limiteSuperior - limiteInferior)/2) #El principio de BInary Search se basa en irnos a mitades hacia arriba o hacia abajo, usamos ese principio
    variableABuscar = trunc(Int,variableABuscar) # Con esto convertimos el resultado a Entero
    println("El número a buscar es: ", variableABuscar, "?")
    println("Presione 'g' si el número a buscar es más grande")
    println("Presione 'b' si el número a buscar es más bajo")
    println("Presione 'c' si el número a buscar es el correcto")
    respuesta = chomp(readline())
    while respuesta ∉ ["c", "b", "g"] #Que el usuario SOLAMENTE pueda ingresar las opciones que queremos
        print("Por favor seleccione solamente \"c\", \"b\", o \"g\". ")
        respuesta = chomp(readline())
    end
    if respuesta == "c" # Esto es solamente gestión de entrada, si ya se encontró el número, pos GAME OVER
        println("Genial ya encontramos el número!")
    elseif respuesta == "b"
        limiteSuperior = variableABuscar
        guessTheNumber(limiteSuperior, limiteInferior) # Si el númeroa buscar es menor, entonces tomamos el número dado como el limite superior para la siguiente busqueda
    else
        limiteInferior = variableABuscar
        guessTheNumber(limiteSuperior,limiteInferior) # Si el númeroa buscar es mayor, entonces tomamos el número dado como el limite inferior para la siguiente busqueda
    end
end
######################### Lo de aca abajo es solo para testing
println("Vamos a jugar, seleccione una dificultad:")
println("Para juego rápido pulse 'r' ")
println("Para juego medio pulse 'm' ")
println("Para juego tedioso pulse 't' ")
dificultadDelJuego = chomp(readline()) #Esto solo para añadirle más opciones para el usuario
while dificultadDelJuego ∉ ["r", "m", "t"]
    print("Por favor seleccione solamente \"r\", \"m\", o \"t\". ")
    dificultadDelJuego = chomp(readline())
end
if dificultadDelJuego == "r"
    arreglo = collect(1:10)
elseif dificultadDelJuego == "m"
    arreglo = collect(1:100)
else
    arreglo = collect(1:1000)
end

println("Piensa en un número entre 1 y",length(arreglo),"... listo ? comencemos !")
guessTheNumber(length(arreglo),0)