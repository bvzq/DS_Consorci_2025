# Ejercicios vistas, índices y procedimientos

 - Definir una query compleja, y una actualización en alguna tabla a partir de ella, que apunte a la base de datos bands y que implique el mayor número de tablas posibles, por ejemplo:
 
   - Obtén el top 10 de bandas con mayor duración de cualquiera de sus álbumes de los 00s, siendo que el primer album de esas bandas haya salido en los 90s. Cambia la duración de todos los álbumes de estas 10 bandas a 0.
   
   - Selecciona la banda indie best seller de los 00s, con una media de sus álbumes igual o superior a 30 mins y que todos sus miembros sean los mismos que desde la fundación de la banda (que no tenga former members). Haz que uno de ellos abandone la banda.
   
   
 - Escríbela en SQL y comprueba que saca lo que pretendías. Todavía sin tener en cuenta la actualización.
 - Usa `EXPLAIN ANALYZE` para evaluar cuánto tarda en ejecutar, en tiempo (ms) y en costo.
 - Define los índices que creas necesarios para optimizar tu búsqueda.
 - Comprueba que el tiempo de ejecución ha mejorado.
 - Crea un procedimiento que ejecute la query, encuentre los elementos a actualizar y los actualice en la base de datos con `UPDATE` y ejecútalo con `CALL`
 - Crea una vista que muestre los cambios
 
   
   