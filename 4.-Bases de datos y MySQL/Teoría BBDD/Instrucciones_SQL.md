# Instrucciones SQL

### Objetivos de Aprendizaje
Al final de esta sesión, los estudiantes podrán:
- Crear, definir y eliminar **bases de datos**.
- Crear, definir, eliminar, leer y filtrar **tablas**.
- Crear, renombrar y eliminar nuevas **columnas**.
- Cambiar formato columnas.
- Cruzar y unir tablas.

## Contenido

Usaremos a lo largo de este documento los datos de `classicmodels` para ejemplificar las instrucciones SQL. Classicmodels es una base de datos de aprendizaje.

- CREATE DATABASE y DROP DATABASE
- CREATE TABLE y DROP TABLE
- Definición de PRIMARY y FOREIGN KEY
- Tipos de Datos SQL
- SELECT FROM
- ORDER BY
- GROUP BY y operadores matemáticos y funciones de agregación
- Otras funciones
- Cláusulas WHERE y HAVING para filtrar tablas
- Declaración CASE en SQL
- Operacores INNER, LEFT, RIGHT y OUTER JOIN, y UNION ALL en SQL



### CREATE y DROP DATABASE

Creamos la base de datos. Simplemente se guarda un espacio en memoria destinado a una base de datos con nombre `classicmodels`. Pero todavía no sabemos cómo se llamarán las columnas, ni de qué tipo serán, ni qué contendrán.

####  `CREATE DATABASE`:  
Se usa para **crear** una nueva base de datos.  Si añadimos `IF NOT EXISTS` primero comprueba que no exista, ya que si existe y no tenemos esta cláusula MySQL nos daría error.

Recuerda añadir siempre `;` al final de tus pasos SQL, ya que si ejecutas varios y no están separados de `;` SQL se pensará que forma parte de la misma instrucción y dará error.

```sql
CREATE DATABASE IF NOT EXISTS `classicmodels`; 
```

####  `DROP DATABASE`:  
Se usa para **eliminar** una nueva base de datos.  

```sql
DROP DATABASE `classicmodels`;
```

### CREATE y DROP TABLE

A continuación creamos una tabla, incluyendo los nombres de sus columnas y sus formatos. Es costumbre añadir previamente un `DROP TABLE IF EXISTS` ya que si ya existiera nos daría error.

Recuerda añadir siempre `;` al final de tus pasos SQL, ya que si ejecutas varios y no están separados de `;` SQL se pensará que forma parte de la misma instrucción y dará error.

Junto a `CREATE TABLE` añadimos el nombre de la tabla. Entre paréntesis todas las columnas que contendrá, indicando nombre y formato (TIPO DE DATOS).

En las últimas líneas quedan definidas las `KEY`: 

 - Primary key es `customerNumber`, que identifica de manera única cada registro de esta tabla, es decir, por definición no puede haber duplicados en esta columna.
 
 - Foreign Key es `salesRepEmployeeNumber`, que está referenciada a la tabla `employees`. Es decir, `salesRepEmployeeNumber` es la primary key de `employees`. 
 

 
####  `CREATE TABLE`:  

La idea es definir tantos `CREATE TABLE` como tablas distintas queramos crear.

```sql
DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `customerNumber` int(11) NOT NULL,
  `customerName` varchar(50) NOT NULL,
  `contactLastName` varchar(50) NOT NULL,
  `contactFirstName` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `addressLine1` varchar(50) NOT NULL,
  `addressLine2` varchar(50) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `postalCode` varchar(15) DEFAULT NULL,
  `country` varchar(50) NOT NULL,
  `salesRepEmployeeNumber` int(11) DEFAULT NULL,
  `creditLimit` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`customerNumber`),
  KEY `salesRepEmployeeNumber` (`salesRepEmployeeNumber`),
  CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`salesRepEmployeeNumber`) REFERENCES `employees` (`employeeNumber`)
)
```

### INSERT INTO

El comando `INSERT INTO` se utiliza para agregar nuevas filas a una tabla en **MySQL**.
Hay que asegurarse de que el número y el orden de los valores coincidan con las columnas de la tabla.

Existen otras maneras de alimentar las tablas, como veremos más adelante.

```sql
INSERT INTO`customers` (`customerNumber`,`customerName`,`contactLastName`,`contactFirstName`,`phone`,`addressLine1`,`addressLine2`,`city`,`state`,`postalCode`,`country`,`salesRepEmployeeNumber`,`creditLimit`) values 

(103,'Atelier graphique','Schmitt','Carine ','40.32.2555','54, rue Royale',NULL,'Nantes',NULL,'44000','France',1370,'21000.00'),

(112,'Signal Gift Stores','King','Jean','7025551838','8489 Strong St.',NULL,'Las Vegas','NV','83030','USA',1166,'71800.00'),

(114,'Australian Collectors, Co.','Ferguson','Peter','03 9520 4555','636 St Kilda Road','Level 3','Melbourne','Victoria','3004','Australia',1611,'117300.00'),

(119,'La Rochelle Gifts','Labrune','Janine ','40.67.8555','67, rue des Cinquante Otages',NULL,'Nantes',NULL,'44000','France',1370,'118200.00')
```


### TIPOS DE DATOS

Con tipos de datos nos referimos a los formatos de las columnas, si son numéricas, de cadena, fecha, buleanos... Son esenciales para garantizar la integridad de los datos y el procesamiento eficiente.

#### **Tipos de Numéricos**  


- **`SMALLINT`**: Almacena números enteros, rango pequeño (**2 bytes**, -32,768 a +32,767).  
- **`INT`o `INTEGER`**: Enteros típicos (**4 bytes**, -2,147,483,648 a +2,147,483,647).  
- **`BIGINT`**: Enteros de gran rango (**8 bytes**, -9,223,372,036,854,775,808 a +9,223,372,036,854,775,807).  
- **`DECIMAL(p,s)`**: p número total de dígitos, s número de decimales. 
- **`FLOAT`**: 4 bytes.
- **`DOUBLE`o `REAL`**: Mayor precisión que `FLOAT`, 8 bytes

#### Tipos de Cadenas de Caracteres  

- **`CHAR(n)`**: Cadena de longitud fija, rellena de espacios en blanco. Para cuando tenemos la certeza de que todos los registros tendrán la misma longitud 
- **`VARCHAR(n)`**: Cadena de longitud variable con un límite.  
- **`TEXT`**: Longitud variable ilimitada.  

#### Tipos de Fecha/Hora  

- **`TIMESTAMP`**: Fecha y hora (sin zona horaria), **8 bytes**.  
- **`DATE`**: Fecha (sin hora del día), **4 bytes**.  
- **`TIME`**: Hora del día (sin fecha), **8 bytes**.  
- **`INTERVAL`**: Intervalo de tiempo, **12 bytes** (rango: -178,000,000 años a +178,000,000 años).  

### SELECT FROM

`SELECT` y `FROM` Son comandos para la lectura de tablas. En `SELECT` indicamos las columnas que deseamos leer, y en `FROM` la tabla origen de la que extraemos dichas columnas

```sql
SELECT customerNumber, customerName 
FROM customers;
```

### ORDER BY

Es usado para ordenar la tabla en función de una o varias columnas. Se puede especificar si de manera ascendente (por defecto) o descendente

```sql
SELECT customerName, customerName
FROM customers
ORDER BY contactLastName DESC;
```

### GROUP BY

El comando `GROUP BY` se usa para **agrupar filas** que tienen el mismo valor en una o más columnas. Se suele usar junto con funciones de agregación (`COUNT()`, `SUM()`, `AVG()`, etc.).  


```sql
SELECT customerName, count(*) as cuenta
FROM customers
GROUP BY city;
```

### Operadores matemáticos y otras funciones de agregación

Son normalmente usados junto con un `GROUP BY`, ya que si no haría la operación total, por ejemplo cuenta el total de registros (si aplicamos el `COUNT`) sin tener en cuenta la  `city` 

`COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()`


### Otras operaciones de columnas

https://learnsql.es/blog/18-funciones-sql-importantes-y-utiles-para-aprender-cuanto-antes/


```sql
SELECT UPPER(city) FROM customers; -- Transforma a mayúsculas
SELECT len(city) FROM customers; -- Devuelve el número de caracteres de cada registro en city
SELECT substring(city,1 ,2) FROM customers; -- devuelve desde la primera posición y dos más, es decir las dos primeras posiciones de cada city
SELECT TRIM(city) FROM customers; -- Elimina espacios en blanco
SELECT DATEADD(columnDate, INTERVAL 7 DAY) FROM customers; -- suma 7 dias
SELECT DATEDIFF(columnDate, INTERVAL 7 DAY) FROM customers; -- resta 7 dias
SELECT DATEDIFF(columnDate, columnDate2) FROM customers; -- resta dos columnas
```

### WHERE

La cláusula **`WHERE`** se usa en SQL para **filtrar registros** según una condición específica.  

```sql
SELECT customerName 
FROM customers
WHERE substring(customerName, 1,1) = 'A'
```

### HAVING

La cláusula **`HAVING`** se usa para **filtrar resultados de funciones de agregación** (`SUM()`, `COUNT()`, `AVG()`, etc.), algo que `WHERE` no puede hacer.  

En este ejemplo nos filtraría por las ciudades con más de 10 clientes. Para realizar la misma acción con `where` habría que hacer más pasos (que más adelante se verán).

```sql
SELECT city, count(*) as cuenta
FROM customers
GROUP BY city
HAVING cuenta > 10;
```

### CASE WHEN

La expresión **`CASE WHEN`** se usa en SQL para realizar evaluaciones condicionales y devolver diferentes valores según la condición. Muy utilizado para crear nuevas columnas dependientes de una o varias.

```sql
SELECT customerName,
    CASE WHEN len(phone) > 0 then 'Sí'
    ELSE 'No' 
    END AS Telefono_si_no
FROM customers
```

### Uniones entre tablas: INNER, LEFT, RIGHT JOIN

Las uniones (`JOIN`) permiten combinar datos de dos o más tablas según una condición en una columna común. Principalmente, esta condición es si los registros de una determinada variable de la primera tabla se encuentra o no en otra determinada variable de la segunda tabla.

#### INNER

Devuelve solo los registros que tienen coincidencias en ambas tablas.

En este ejemplo nos devolverá todas las compras y sus fechas que hayan realizado todos los clientes. Dejando atrás todos los clientes que nunca hayan realizado compras, y las compras que hayan realizado clientes anónimos.

```sql
SELECT custom.customerNumber, custom.customerName, compr.compra_id, compra.fecha
FROM customers as custom
INNER JOIN compras as compra
ON custom.customerNumber = compra.customerNumber;
```

#### LEFT

Devuelve todos los registros de la primera tabla (izquierda) y solo los coincidentes de la segunda (derecha).

En este ejemplo nos devolverá tantas líneas como clientes haya, y solo rellenará las columnas compra_id y fecha en caso de que éstos hubieran realizado alguna compra.


```sql
SELECT custom.customerNumber, custom.customerName, compr.compra_id, compra.fecha
FROM customers as custom
LEFT JOIN compras as compra
ON custom.customerNumber = compra.customerNumber;
```


#### RIGHT

Devuelve todos los registros de la segunda tabla (derecha) y solo los coincidentes de la primera (izquierda).

En este ejemplo nos devolverá tantas líneas como compras haya, y solo rellenará los customerNumber y customerName en caso de que las compras estén asociadas a clientes registrados


```sql
SELECT custom.customerNumber, custom.customerName, compr.compra_id, compra.fecha
FROM customers as custom
RIGHT JOIN compras as compra
ON custom.customerNumber = compra.customerNumber;
```

#### OUTER

Devuelve **todos** los registros de ambas tablas, con `NULL` en donde no hay coincidencias.


```sql
SELECT custom.customerNumber, custom.customerName, compr.compra_id, compra.fecha
FROM customers as custom
OUTER JOIN compras as compra
ON custom.customerNumber = compra.customerNumber;
```

#### UNION ALL

Se usa para **combinar los resultados de dos o más consultas SQL**, incluyendo **todos** los registros, incluso duplicados.  

A diferencia de `UNION`, que elimina duplicados, `UNION ALL` **mantiene todas las filas**.

Si no tienen las mismas columnas en el mismo formato da error.


```sql
SELECT customerNumber, customerName
FROM customersMadrid as customM
UNION ALL customerNumber, customerName customersBArcelona as customB;
```




