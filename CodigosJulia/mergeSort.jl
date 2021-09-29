function mergesort(arreglo::Vector)
	if length(arreglo) <= 1 return arreglo end
	mitad = floor(Int,length(arreglo) / 2)
	subArregloIzquierdo = mergesort(arreglo[1:mitad])
	subArregloDerecho = mergesort(arreglo[mitad+1:end])
	resultado = similar(arreglo) #Necesitamos inicializar un arreglo, que es el que regresaremos con las cifras ordenadas
	i = indiceDerecho = indiceIzquierdo = 1
	@inbounds while indiceIzquierdo <= length(subArregloIzquierdo) && indiceDerecho <= length(subArregloDerecho)
		if subArregloIzquierdo[indiceIzquierdo] <= subArregloDerecho[indiceDerecho]
			resultado[i] = subArregloIzquierdo[indiceIzquierdo]
			indiceIzquierdo += 1
		else
			resultado[i] = subArregloDerecho[indiceDerecho]
			indiceDerecho += 1
		end
		i += 1
	end
	if indiceIzquierdo <= length(subArregloIzquierdo)
		resultado[i:end] = subArregloIzquierdo[indiceIzquierdo:end]
	else
		resultado[i:end] = subArregloDerecho[indiceDerecho:end]
	end
	return resultado 
end
######################### Lo de aca abajo es solo para testing
arregloAleatorio = rand(-10:10, 10)
println("un arrelo aleatorio desordenado: $arregloAleatorio ")
println("Ahora aparece ordenado! ", mergesort(arregloAleatorio))
####ToDo: Agregar comentarios chingones