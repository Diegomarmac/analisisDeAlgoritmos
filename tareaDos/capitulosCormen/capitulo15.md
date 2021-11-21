# Sección 15
## 15.1
### 15.1-1
El caso base es $T(0) = 2^0$ y como $\forall ~r \in \R:r \neq 0, r⁰ = 1$ entonces $T(0) = 1$ usando hipotésis inductiva y tenemos:  
$T(n) = 1 + \sum_{j=0}^{n-1}T(j) = 1 + \sum_{j=0}^{n-1}2^j = 1 + \frac{2^n -1}{2 -1} = 1 + 2^n - 1 = 2^n$

### 15.1-2
Tomando $p_1=0, p_2 = 4, p_3 = 7, n=4 $ usando greedy, primero cortaríamos una pieza de tamaño 3 ya que esta tiene la mayor densidad, el resto de la barra tiene una longitud de 1, por lo tanto el precio es de 7. Otro camino es tomar dos varras de longitud 2 con precio de 8.

### 15.1-3
tenemos:  
$r_n = max\{p_n, r_1 + r_{n-1} - c, r_2 + r_{n-2}-c, ..., r_{n-1} + r_1 -c  \}$  
Con lo que el algoritmo queda:  
![algoritmo 15-1-3](./images/15-1-3.jpg)
