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