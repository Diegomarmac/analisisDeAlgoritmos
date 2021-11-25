# Sección 16
## 16.1
### 16.1-1
El algoritmo dado puede computar el mínimo de O(n) números o solo retornar cero dependiendo del tamaño de $S_{ij}$. Como tenemos que $1 \leq i \leq j \leq n$  entonces existe un cierto número de subproblemas que cumplen con $O(n²)$. Teniendo en cuenta $O(n) y O(n²)$ entonces el tiempo completo es de $O(n^3)$

### 16.1-2
Es muy cercano al problema original planteado, hay que pensarlo como el tiempo de ejecución, pero al revés, esto produce una solución óptima por las mismas razones. Cumple con ser _greedy_ ya que en cada paso busca la mejor solución.

### 16.1-3
Como contra-ejemplo del problema de las actividades, tengamos {(1,9),(8,11),(10,20)}, si escogemos la de menor duración, entonces eligiriamos (8,11) con lo que ya no es posible tomar una clase más, en este caso solo tendríamos una clase, que si tomamos la opción de elegir la actividad que termina primero(como expongo en el proyecto), entonces eligiramos primero (1,9) y nos permite elegir también (10,20), con lo que tendríamos dos clases en lugar de uno que es como nos lo expone el problema.  
Ahora... podemos dar un contra-ejemplo de elegir la que inicie primero, tengamos {(1,10),(2,3),(4,5)} entonces eligiriamos (1,10), pero esto nos impide elegir otra clase, de nuevo el acercamiento que propongo, de elegir la que términe primero, elegiriamos primero (2,3) y esto nos permite elegir (4,5) después, con lo cual mejoramos la salida.

### 16.1-4
Manteniendo un conjunto de usados pero libres salones de lectura F y actualmente ocupados los salones B, ordenar las clases por el tiempo de inicio, por cada nueva hora de inicio elegida, remover un salón de F, organiza las actividades en ese salón y agrega el salón a B, si Festá vacío agrega uno nuevo (**no** usado). Cuando las clases terminan, elimina los salones de B y agregalos a F.  
Esto es óptimo ya que, supongamos inciamos usando en m-ésimo salón por primera vez, esto sólo ocurre cuando cada salón ya usado está en B, pero, esto a su vez significa que hay m clases ocurriendo al mismo tiempo por lo que habría que tener m salones distintos en uso.

### 16.1-5
Podemos usar programación dinamica usando la ecuación (16.2) donde el segundo caso tiene "1" reemplazado con $"v_k"$, tenemos que los subproblemas están indexados por un par de actividades y cada cálculo requiere tomar el mínimo conjunto de tamaño $\leq |S_{ij}| \in O(n)$. El total del tiempo de ejecución está acotado por $O(n³)$

## 16.2
### 16.2-1
Una solución óptima al problema fraccional de la mochiles es aquel que tiene el mayor valor de densidad, dado que estamos agregando los objetos de mayor valor que se pueda. Suponiendo que tenemos otra solución usando la menor densidad, podríamos sustituir en alguno de los valores más altos een densidad, esto significa que la solución no será óptima.

### 16.2-2
Supongamos que tenemos un objeto de peso w en la solución, entonces debemos resolver el problema en $n - 1$ objetos con un máximo de peso $W - w$. Entonces para usar _bottomUp_ debemos resolver el problema 0-1 knapsack para todos los objetos y posibles pesos menores que W. La tabla de valores será de tamaño $n+1$ por $W +1$, los renglones están indexados por objeto, mientras que las columnas estarán por el peso total.  
Para el renglón i columna j, tendremos los valores correspondientes y por ende se decide inlcuyendo el objeto i comparando con el total de objetos usando $i -1$ con peso $max~ j$ y el total del valor estará dado por $i -1 $ con peso $max ~ j - i$.  
Ya para resolver el problema solo debemos revisar la entrada n,W de la tabla para determinar el valor máximo.

### 16.2-3
En cada paso sólo eligimos el objeto más valioso pero a su vez, el más ligero. Para encontrar la solución óptima, supongamos que éxiste un objeto j que ya incluímos pero, existe un objeto más pequeño y más valioso i, el cual no hemos incluido, podríamos reemplazar j con i.  
_ALgoritmo 0-1 knapsack(n,W )_
1. inicializar una tabla k de $n+1$ por $W+1$
2. for j = 1 hasta W :
    1. K[0,j] = 0
3. for i = 1 hasta n :
    1. K[i,0] = 0
4. for i = 1 hasta n:
    1. for j = 1 hasta W :
        1. if j < i.weight :
            1. K[i,j] = K[i-1,j]
        2. K[i,j] = max (k[i -1,j], k [i-1, j - i.weight] + i.value)

### 16.2-4
En este caso, la solución _greedy_ nos da la solución óptima, donde maximizamos la distancia que podemos cubrir desde un punto particular de modo que éxiste un lugar al que podemos llegar por agua. La primera parada es en el punto más lejano del inicio, el cual está menor o igual a m millas de distancia. El problema muestra una subestructura óptima ya que hemos seleccionado una primera parada denominada _p_. resolvemos el subproblema asumiendo que comenzamos en _p_.  
Ahora debemos mostrar que éste acercamiento _greedy_ tiene una primera parada la cual está contenida en la solución óptima. Sea O la solución óptima en la que el profesor se ha detenido en los puntos $o_1,o_2,...0,_k$.  
Sea $g_1$ la parada más lejana que podemos alcanzar desde el incio, entonces reemplezamos $o_1$ con $g_2$ para crear una solución modificada G, donde $o_2 - o_1 < o_2 - g_1$ EN otras palabras, podemos hacerlo para las posiciones en G sin quedarnos sin agua.  Y dado que G tiene el mismo número de paradas, concluimos que $g_1$ está contenido en la solución óptima, por lo que la solución greedy funciona !

### 16.2-5
Tomemos el intervalo más a la izquierda, este intervalo contiene el punto más lejano a la izquierda, de modo que el lado izquierdo contiene el punto más lejano a la izquierda, así que sólo quitamos cualquier punto a cualquier distancia al punto más a la izquierda y repetimos esto hasta acabar, como en cada paso exista una solución óptima para donde colocar el intervalo más a la izquierda, está solución es la solución óptima.

### 16.2-6
Primero hay que computar el valor de cada objeto, este valor será igual a la cantidad economica por el peso. Se usa el siguiente acercamiento recursivo:  
Encontrar el objeto de valor que contenga el valor mediana, esto se resolvió en el capitulo 9, usando lo visto ahí, esto nos toma tiempo linear, luego, la suma de los pesos de todos aquellos objetos por arriba de la mediana lo denominaremos M, si M excede W entonces sabemos que la solución al problema fraccional recae en tomar los objetos de este conjunto. Con esto estamos resolviendo el problema fraccional con un _input_ de $\frac{n}{2}$; pero ahora queda el caso en donde M **no** excede W, en este caso debemos resolver pensando en los objetos de menor valor con un peso máximo de W - M.  
Sea T(n) el tiempo de ejecución del algoritmo, sabemos que podemos resolverlo cuando exista u onjeto en tiempo constante, la recursión nos queda: $T(n) = T(\frac{n}{2}) + cn$ y $T(1) = d$ lo que nos da un tiempo de $O(n)$

## 16.3
### 16.3-1
Si tenemos $x.freq = b.freq$ entonces sabemos que b está sujeta a la frecuencia más baja. Esto significa que por lo menos existen dos _algo_ con la menor frecuencia, entonces $y.freq = x.freq$, además, si se cumple que:  
$x.freq \leq a.freq \leq b.freq = x.freq$  
Entonces tenemos que $a.freq = x.freq$

### 16.3-2
Sea T un árbol binario que corresponde al óptimo código prefix, supongamos T no está lleno, sea n un nodo cuyo nodo hijo es x, entonces T' sería el árbol que resulta de remover n y poner en ese lugar x; ahora, sea m un nodo hoja que es descendiente de x, entonces tenemos:  
![sumatoria 16-3-2](../images/16-3-2.png)  
Lo cual contradice que T fuese óptimo, por lo tanto cualquier árbol binario que corresponda a un óptimo código prefix deberá estar lleno.

### 16.3-3
Un óptimo código Huffman sería:
![optimal Huffman code](../images/16-3-3.png)  
Podríamos verlo como tener los n-ésimos primeros números Fibonacci como frecuencias de modo que $k < n-ésima$ letra más frecuente tiene un _codeword_ $0^{k-1}1$ y la n-ésima más frecuente letra tiene $0^{n-1}$

### 16.3-4
Sea x un nodo hoja, entonces $x.freq$ es agregado al costo de cada nodo interno que sea un ancestro de x exactamente una sola vez, por lo que el nuevo costo computacional es $x.freq.d_T(x)$ que es el mismo que antes, por lo que vemos que el costo computacional es equivalente.

### 16.3-6
Primero observamos que cualquier árbol binario tiene $2n -1$ nodos,podemos codificar esto usando un recorrido _inverso_ de T. Para cada nodo ya visitado, escribimos un 0 si el nodo es interno, y un 1 si es un nodo hoja; ahora, pensando en los caracteres de C, podemos codificarlos en $lg n$ bits, al existir n caracteres, solo hay que multiplicar ese valor con n, lo que nos da $n lgn$ bits que es la codificación del recorrido inverso.

### 16.3-7
En lugar de agrupar de dos en dos a partir de la frecuencia más baja, con el fin de obtener un árbol ternario, vamos agrupar de a 3, colocando los valores más bajos al final del árbol de modo que seán más largos sus _codewords_ que la frecuencia de ocurrencia de los simbolos.

### 16.3-8
para cualquiera 2 caracteres, la suma de las frecuencias de sus frecuencias excede la frecuencia de cualquier otro caracter, inicialmente los códigos de Huffman van a crear 128 árboles de 2 hojas cada uno, en un siguiente nivel tenemos la misma estructura anterior. Continuando con esto, los códigos de Huffman construyen un árbol binario de altura $lg(256)=8$ el cual **no** es más eficiente que un código de 8 bits

### 16.3-9
Si cada posible caracter es equiprobable, entonces, cuando construimos el código de Huffman ,tendremos un árbol binario de profundidad 7, ya que cada caracter tendrá exactamente 8 bits. Esto es, se usará la misma cantidad de bits que se usarón originalmente para representarlos, por lo que el archivo no reduce su tamaño.

## 16.4
### 16.4-1
La primera condición nos dice que S es un conjunto finito, para provar la segunda condición supongamos que $k \geq 0$, esto implica que $I_k$ es _no vacía_. AHora, para probar la propiedad hereditaria, supongamos $A \in I_k$ esto significa que $|A| \leq k$. Entonces si $B \subseteq A$, esto significa que $|B| \leq A \leq k$, entonces $B \in I_k$.  
Por último veamos la propiedad de intercambio teniendo $A,B \in I_k$ tal que $|A| < |B|$, si escogemos cualquier elemento $x \in B \ A$ entonces $| A \cup \{x\} | = |A| + 1 \leq |B| \leq k$, por lo que podemos extender $A$ a $A \cup \{x\} \in I_k$

### 16.4-2
Sean $c_1 , ..., c_m$ las columnas de T, supongamos $C = \{ c_{i1},...,c_{ik} \}$ es dependiente, entonces existen escalares $d_1, ..., d_k$ no todos 0's de modo que :  
$\sum_{j=1}^k d_j c_{ij} = 0$. Agregando columnas a C y dandoles un coeficiente 0 en la suma, notamos que cualquier _super set_ de C es también dependiente y al revés, cualquier subconjunto de un conjunto independiente, será entonces, independiente. Ahora supongamos que A y B son un conjunto de columnas independientes de modo que $|A| > |B| $ sino es posible agregar una columna manteniendo la independencia, entonces, es el caso donde cualquier elemento de A es una combinación lineal de elementos de B, pero esto no es factible, por lo tanto nuestro sistema independiente debe satisfacer la propiedad de intercambio, lo que de hecho está describiendo un matroide.

### 16.4-4
Supongamos $X \subset Y $ y $Y \ in I$, entonces $(X \cap S_i) \subset (Y \cap S_i) \forall i$, entonces tenemos $|X \cap S_i| \leq |Y \cap S_i| \leq 1 \forall 1 \leq i \leq k$ por lo tanto M es cerrado bajo inclusión.  
Ahora, sea $A, B \in I$ con $|A| = |B|  + 1$ entonces debe existir algún j tal que $|A \cap S_j | = 1$ pero $|B \cap S_j| = 0$. Sea $a = A \cap S_j$ Entonces $a \notin B$ y $|(B \cup \{ a \} \cap S_j)| = 1$ por lo tanto M es un matroide.

### 16.4-5
Supongamos que W denota el peso más grande que un elemento puede tener, entonces definimos nuestra función de peso $w_2 (x) = 1 + W - w(x)$ esto nos ayuda a que solo haya pesos positivos , ahora, para cualquier conjunto independiente que posea un peso máximo con respecto a $w_2$ tendrá entonces, un peso mínimo con respecto a $w$.Pensando en el teorema 16.6, supongamos para nuestra matroide, todo conjunto máximo e independiente sitne un tamaño $S$, además supongamos que $M_1$ y $M_2$ son conjuntos máximos independientes tal que $M_1$ es máximo con respecto a $w_2$ y $M_2$ es mínimo con respecto a $w$, tenemos que mostrar que $w(M_1) = w(M_2)$, usando minimidad de $M_2$tenemos que: $w(M_1) > w(M_2)$, podemos reescribir esto en términos de $w_2$:  
$w_2(M_2) - (1 + W)S > w_2(M_1)-(1+W)S$  
Entonces $w_2(M_2) > w_2(M_1)$, pero esto último contradice la máximilidad de $M_1$ con respecto a $w_2$ ... entonces para $w(M_1) = w(M_2)$ tenemos que un conjunto máximo e independiente que posee el peso más grande con respecto a $w_2$ además tiene el peso mínimo con respecto a $w$ !  