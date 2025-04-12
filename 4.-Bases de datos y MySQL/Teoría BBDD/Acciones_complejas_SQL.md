# Acciones complejas de SQL

### Objetivos de Aprendizaje
Al final de esta sesión, los estudiantes podrán:
- Definir y usar tablas temporales y subconsultas
- Crear vistas y entender su utilidad
- Analizar las ejecuciones y sus tiempos
- Crear índices para optimizar las consultas
- Crear procedimientos
- Actualizar tablas en la base de datos con `UPDATE` 
- Eliminar registros de una base de datos con `DELETE` 

## Tablas y consultas temporales

### WITH

Con el comando `WITH` podemos crear tamblas temporales que nos pueden ser muy útiles en las consultas complejas o que requieran varios joins y llamadas a tablas de diferentes fuentes.

Por ejemplo si quisiéramos recuperar los orders de clientes de Nantes realizados despúes del 1 de enero del 2000. Se crean 2 tablas temporales, una que recoge los clientes de Nantes, y otra que obtiene los orders correspondientes. A continuación, usamos esas dos tablas para con un JOIN obtener el resultado deseado.

```sql
WITH customers_Nantes as (
    SELECT * FROM customers WHERE city = 'Nantes' 
), orders_2000 as (
    SELECT * FROM orders WHERE orderDate >= '2000-01-01'
)
SELECT c.customerName, o.orderNumber, o.orderDate
FROM customers_Nantes c
INNER JOIN orders_2000 o
ON c.customerNumber = o.customerNumber
```

### SUBCONSULTAS

Las subconsultas son queries dentro de queries, de manera anidada. Es decir, en el FROM introducir una query que haga su llamada respectiva a otro FROM, con su SELECT particular y sus filtros WHERE y demás acciones correspondientes.

Siguiendo el ejemplo anterior:

```sql
SELECT c.customerName, o.orderNumber, o.orderDate
FROM (SELECT * FROM customers WHERE city = 'Nantes') as c
INNER JOIN (SELECT * FROM orders WHERE orderDate >= '2000-01-01') as o
on c.customerNumber = o.customerNumber
```

En general si las consultas son sencillas, no demasiado profundas y no hay recursividad con hacer una subconsulta es suficiente. Sin embargo, si éstas son más complejas o alguna de las tablas temporales  tienen que ser usadas más de una vez, es recomendable crear las tablas intermedias temporales usando `WITH`, ya que es más eficiente y su estructuración la hace de más fácil interpretación.


## VISTAS

Una vista es una **consulta almacenada** que puede ser tratada como una tabla virtual dentro de una base de datos. En otras palabras, es una representación de una o más tablas que se puede consultar como si fuera una tabla normal. Sin embargo, una vista no almacena datos por sí misma, en lugar de eso, contiene una consulta que se ejecuta cada vez que se accede a ella.

### Características principales de las vistas:
 - Las vistas son tablas virtuales. Una vista no contiene datos, solo la consulta que define cómo obtener los datos de las tablas subyacentes.
 - Una vista suele ser creada a partir de una consulta compleja que involucra varias tablas, filtros, agregaciones, uniones, etc.
 - Al ser ejecutada cada vez que se abre, su actualización es dinámica. Los datos que ves en una vista se actualizan vez que se accede a ella, basándose en los datos más recientes de las tablas subyacentes.
 
```sql
CREATE VIEW compras_clientes_nantes as

WITH customers_Nantes as (
    SELECT * FROM customers WHERE city = 'Nantes' 
), orders_2000 as (
    SELECT * FROM orders WHERE orderDate >= '2000-01-01'
)
SELECT c.customerName, o.orderNumber, o.orderDate
FROM customers_Nantes c
INNER JOIN orders_2000 o
ON c.customerNumber = o.customerNumber
```

### Vistas Materializadas

Existen también las vistas materializadas, que tienen algunas ventajas e inconvenientes con respecto a las vistas normales. Por otro lado, en lenguajes como MySQL no se pueden crear, pero sí en otros como PostgreSQL.

Las vistas materializadas sí se guardan de manera física en la base de datos. Por lo tanto tendríamos una tabla en nuestra base de datos que contiene ya guardado el resultado de una query compleja. Esto significa que no se necesita volver a ejecutar la consulta cada vez que se abre la vista, lo que reduce el tiempo de respuesta de la consulta y minimiza el coste computacional.

Son recomendables en consultas repetidas, ya que no requieren volver a calcular el resultado de la consulta. Los datos ya están precomputados y almacenados. 

Por otro lado, dado que la vista materializada almacena los resultados de la consulta como una tabla, consume espacio de almacenamiento adicional en la base de datos. Lo cual puede ser significativo si es muy grande.



## Indices

Los índices en bases de datos son estructuras de datos que mejoran la velocidad de las operaciones de consulta, permitiendo que la base de datos localice y acceda rápidamente a los registros de una tabla sin necesidad de recorrerla completamente. Son muy similares a los índices de un libro, que permiten encontrar rápidamente la página correspondiente a un tema sin tener que leer todo el contenido.

Los índices mejoran la velocidad de las consultas realizando búsquedas rápidas, reduciendo el tiempo necesario para localizar datos en tablas grandes. Son especialmente útiles en operaciones de lectura SELECT, ya que implican **condiciones en columnas indexadas**. Las tablas indexadas no requieren ser leídas enteras, lo que se traduce en acceso más rápido a los datos

Los índices ayudan a que las consultas que involucran uniones (`JOIN`) entre tablas se realicen de manera más eficiente. La base de datos puede acceder rápidamente a las filas que deben ser emparejadas entre las tablas, reduciendo la necesidad de buscar las filas correspondientes.

También pueden ser utilizados para ordenar los datos más rápidamente en una consulta que usa `ORDER BY`. Así como en las operaciones de `GROUP BY`, permitiendo agrupar datos de manera eficiente.

En los procesos de actualización de las bases de datos también optimizan recursos. Si las columnas indexadas son las involucradas en las operaciones de actualización, inserción y eliminación.

En conclusión, sin índices, la base de datos debe realizar un **escaneo completo** de la tabla (Full Table Scan), lo que requiere leer todas las filas de la tabla. Con índices, la base de datos puede acceder a las filas de manera mucho más eficiente, lo que reduce significativamente la cantidad de lecturas de disco.

En MySQL, cuando se crea una base de datos ya se predefinen unos índices.

### Tipos de índices

### Índice BTREE

- El índice **BTREE** (árbol balanceado binario) es uno de los índices más comunes y ampliamente utilizados en bases de datos relacionales.
- Se utiliza principalmente para realizar búsquedas **ordenadas** de datos. Es eficiente para rangos de búsqueda y operaciones de comparación.
- Ideal para **consultas de rango** o cuando se necesita acceder a los datos de manera **ordenada**.
- **Adecuado para consultas con operadores de comparación**: Es muy eficiente para consultas que utilizan operadores como `=`, `>`, `<`, `>=`, `<=`, `BETWEEN`, etc.
- No es adecuado para búsquedas exactas de valores en columnas de tipo **no numérico** o con **valores no ordenados**.
 


### Índice HASH


- El índice **HASH** utiliza una función de **hashing** para mapear claves de búsqueda a ubicaciones específicas en la tabla, lo que permite una búsqueda rápida de valores exactos.
- **Búsqueda exacta**: Los índices HASH son extremadamente rápidos para **consultas de igualdad**, ya que el hash permite encontrar rápidamente el valor buscado. son muy útiles cuando las consultas se centran en encontrar valores exactos y no en rangos o valores ordenados.
- **No ordenado**: A diferencia del índice BTREE, los índices HASH no mantienen un orden en los datos, lo que significa que no son adecuados para consultas de rango.



### Resumen de Comparación

| Característica       | **BTREE**                              | **HASH**                                  |
|----------------------|----------------------------------------|-------------------------------------------|
| **Tipo de búsqueda** | Rango y comparaciones                  | Búsqueda exacta                           |
| **Ordenamiento**     | Sí, mantiene el orden de los datos    | No, no mantiene el orden de los datos    |
| **Operadores soportados** | `=`, `>`, `<`, `BETWEEN`, `IN`, etc.   | Solo `=`                                   |
| **Ventajas**         | Rápido para rangos y búsquedas ordenadas | Rápido para búsquedas exactas             |
| **Desventajas**      | Más lento en consultas de igualdad exacta | No soporta rangos o búsquedas de orden   |
| **Casos de uso**     | Ordenación, rangos, búsquedas de igualdad | Búsquedas exactas como identificadores   |




### Ejemplo de creación de índices


Creamos el índice, si no indicamos nada se usará BTREE

```sql
CREATE INDEX idx_payment_date 
ON payments (paymentDate);
```
Eliminamos el índice

```sql
DROP INDEX idx_payment_date ON payments;
```

```sql
CREATE INDEX idx_productName_hash 
ON products (productName) USING HASH;

```

### EXPLAIN y ANALYZE

Estos dos comandos se usan para que MySQL nos den información acerca del curso de la ejecución.

`EXPLAIN` se utiliza para analizar y comprender cómo el optimizador de consultas ejecutará una consulta en SQL. Muestra el plan de ejecución de la consulta, indicando aspectos como:

 - Tipo de acceso (full table scan, index scan, etc.).

 - Índices utilizados (si los hay).

 - Filas estimadas a procesar.

 - Costo estimado de la consulta.

`ANALYZE` ejecuta realmente la consulta y mide el tiempo real de ejecución.

En MySQL, ANALYZE TABLE optimiza las estadísticas de la tabla para mejorar el rendimiento.

Antes de crear los índices vamos a ver el plan de ejecución para compararlo con el plan después de la creación del índice

```sql
EXPLAIN SELECT * FROM payments WHERE paymentDate = '2004-10-19';
```

#### Prueba ejecutando este ejemplo

Verás que el coste de ejecución se ha reducido de 12 a 1.41, y el tiempo de 0.578 a 0.024

```sql
SHOW index FROM products
;
EXPLAIN ANALYZE SELECT * FROM products WHERE productName = 'Classic Car' or productName='Vintage Car';
/*
-> Filter: ((products.productName = 'Classic Car') or (products.productName = 'Vintage Car'))  (cost=12.00 rows=21) (actual time=0.578..0.578 rows=0 loops=1)
     -> Table scan on products  (cost=12.00 rows=110) (actual time=0.222..0.543 rows=110 loops=1)
*/
CREATE INDEX idx_productName_hash 
ON products (productName);
EXPLAIN ANALYZE SELECT * FROM products WHERE productName = 'Classic Car' or productName='Vintage Car';
/*
/*
'-> Index range scan on products using idx_productName_hash over (productName = \'Classic Car\') OR (productName = \'Vintage Car\'), 
with index condition: ((products.productName = \'Classic Car\') or (products.productName = \'Vintage Car\'))  (cost=1.41 rows=2) (actual time=0.024..0.024 rows=0 loops=1)\n'

*/
```


## Procedimientos

Un procedimiento almacenado es un conjunto de instrucciones SQL que se guardan en la base de datos y pueden ejecutarse cuando se necesiten. Es como una función predefinida que permite automatizar tareas repetitivas, mejorar el rendimiento y la seguridad.

Evitan repetir código al ejecutar procesos complejos. Si se requiere un cambio, se actualiza el procedimiento sin modificar el código de las aplicaciones que lo usan.

Los procedimientos aceptan parámetros de entrada, como en el ejemplo a continuación customerNumber.

```sql
DELIMITER $$

CREATE PROCEDURE GetTotalPayments(IN customerNumber INT)
BEGIN
    SELECT customerNumber, SUM(amount) AS total_payments
    FROM payments
    WHERE payments.customerNumber = customerNumber
    GROUP BY customerNumber;
END $$

DELIMITER ;

CALL GetTotalPayments(103);

```
Para eliminar el procedimiento

```sql
DROP PROCEDURE IF EXISTS GetTotalPayments;
```


### **Comparación rápida**

Comparación entre vistas y procedimientos. 

| Característica            | Vista (`VIEW`)  | Procedimiento (`STORED PROCEDURE`) |
|--------------------------|----------------|---------------------------------|
| **Propósito**           | Consulta de datos | Procesamiento y manipulación de datos |
| **Modificación de datos** | No (solo lectura) | Sí (INSERT, UPDATE, DELETE) |
| **Uso de lógica avanzada** | No | Sí (bucles, condiciones, transacciones) |
| **Mejora de seguridad** | Sí, oculta datos sensibles | Sí, controla accesos |
| **Ejemplo de uso** | Reportes de ventas | Generación de informes mensuales |


## UPDATE

El comando `UPDATE` en SQL se usa para modificar registros en una tabla. Se debe usar con precaución, especialmente sin `WHERE`, ya que puede actualizar **todos los registros**.

A continuación actualizamos la tabla customers. Con `SET` establecemos el creditLimit = 500 para quienes cumplan la condición `WHERE`, en este caso el customerNumber 103.

```sql
UPDATE customers 
SET creditLimit = 50000 
WHERE customerNumber = 103;
```

Podemos actualizar el creditLimit sin necesidad de una condición `WHERE`

```sql
UPDATE customers 
SET creditLimit = creditLimit * 1.1;
```

Ejemplo un poco más complejo, Establecemos un creditLimit de 1000000 a aquellos clientes con total payments superior a 500000. Primero seleccionamos la tabla a actualizar: customers junto con el `INNER JOIN` y su subconsulta en el que se filtra por >500000. 

Finalmente con el `SET` efectuamos la actualización. Es una manera diferente de definir la condición `WHERE`, pero necesaria, ya que la actualización se realiza sobre una tabla y la condición sobre otra.

```sql
UPDATE customers c
INNER JOIN (
    SELECT customerNumber, SUM(amount) AS total_payments
    FROM payments
    GROUP BY customerNumber
    HAVING total_payments > 500000
) AS subquery 
ON c.customerNumber = subquery.customerNumber
SET c.creditLimit = 1000000;
```

Antes y después de ejecutar el `UPDATE`, ejecuta este pedazo de código de a continuación para que aprecies el cambio

```sql
SELECT c.customerNumber, creditLimit, total_payments from customers c
JOIN (
    SELECT customerNumber, SUM(amount) AS total_payments
    FROM payments
    GROUP BY customerNumber
    HAVING total_payments > 500000
) AS subquery ON c.customerNumber = subquery.customerNumber
```

## DELETE

Para eliminar algunas líneas (filas) de una tabla en MySQL, se utiliza la instrucción DELETE con una cláusula WHERE que especifique qué filas deseas eliminar.


```sql
DELETE FROM customers
WHERE customerNumber = 103;
```
 
El comando `DELETE` elimina los registros que cumplan la condición indicada. Si queremos eliminar la tabla debemos usar `DROP`. De esta manera eliminamos la tabla entera, incluyendo sus columnas, índices... 

```sql
DROP customers;
```

Si queremos eliminar solo sus datos todos, sin condición ninguna:

```sql
TRUNCATE TABLE customers;
```

Ojo con las relaciones entre tablas, qué ocurriría con ellas si eliminamos la  tabla o alguna de sus líneas? Se eliminan esos Id en todas las tablas? Para más información mirar el comando `CASCADE` (cascade)[https://www.mysqltutorial.org/mysql-basics/mysql-on-delete-cascade/]


## Procedimiento + UPDATE 

Ahora vamos a hacer uso de un procedimiento para actualizar nuestra tabla. De esta manera podremos actualizar los credit Limit de nuestros clientes de manera recurrente

```sql
DELIMITER $$

CREATE PROCEDURE UpdateCreditLimit()
BEGIN
    UPDATE customers c
    INNER JOIN (
        SELECT customerNumber, SUM(amount) AS total_payments
        FROM payments
        GROUP BY customerNumber
        HAVING total_payments > 500000
    ) AS subquery 
    ON c.customerNumber = subquery.customerNumber
    SET c.creditLimit = 1000000;
END $$

DELIMITER ;

CALL UpdateCreditLimit();

```







