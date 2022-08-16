# Obtener el tamaño del array y establecerlo como variable n
# Si el tamaño del array es menor o igual a las posibilidades de ajustar el tamaño de los equipos, se pueden modificar todos los equipos existentes en el array
# Si todos los elementos son distintos, tendría solamente k+1 como equipos posibles
# 1. Determinar si el array tiene valores diferentes entre sí
# 2. En caso afirmativo, retornar k+1
# Si tengo equipos con igual cantidad de integrantes, podría considerarlos como tamaños óptimos y reducir la cantidad de k equipos posibles para obtener el máximo
# 3. Seleccionar los equipos con igual cantidad de integrantes.
# 4. Obtener el tamaño del array con los equipos seleccionados (para conocer cuántos equipos con igual cantidad de integrantes ya existen)
# 5. Obtener el conjunto de equipos cuya cantidad de integrantes sea mayor al tamaño óptimo, para definir si puedo reducirlos y obtener más equipos con igual cantidad de integrantes
# 6. Verificar que el tamaño del conjunto de equipos que pueden ser reducidos sea menor a k
# 7. En ese caso retornar la suma de los equipos que ya existen con tamaño óptimo y sumarles aquellos que pueden ser reducidos a ese valor.
# 8. Retornar la máxima cantidad de equipos que pueden formarse con igual cantidad de integrantes posibles, reduciendo los equipos a la cantidad de integrantes óptima.