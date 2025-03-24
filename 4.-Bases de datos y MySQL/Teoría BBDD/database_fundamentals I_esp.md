# Fundamentos de Bases de Datos - Primera Parte

## Duración Total: 2 horas

### Objetivos de Aprendizaje
Al final de esta sesión, los estudiantes podrán:
- Entender la definición y el propósito de las bases de datos.
- Identificar los diferentes tipos de modelos de bases de datos.
- Diferenciar entre bases de datos SQL y NoSQL.
- Comprender los principios básicos de diseño de bases de datos y normalización.

## Contenido

### Introducción a Bases de Datos (30 minutos)
- **Definición y Propósito:** Explicar qué es una base de datos y su rol en la gestión de datos.
- **Tipos de Usuarios:** Describir los diferentes perfiles que interactúan con las bases de datos: administradores de bases de datos, desarrolladores, analistas de datos y usuarios finales.

### Modelos de Datos (30 minutos)
- **Modelo Relacional:** Características y estructura de las bases de datos relacionales.
- **Modelo de Documentos:** Describir cómo funcionan las bases de datos basadas en documentos y cuándo son una opción adecuada.
- **Modelo Clave-Valor:** Explicar las bases de datos clave-valor y sus casos de uso típicos.
- **Modelo de Columnas Amplias:** Diferenciar el modelo de columnas amplias de otros modelos y discutir su utilidad.
- **Modelo de Grafos:** Presentar las bases de datos de grafos y sus ventajas para representar relaciones complejas.

### SQL vs NoSQL (30 minutos)
- **SQL:**
  - Definir SQL y discutir las características principales de las bases de datos SQL.
  - Discutir la escalabilidad vertical y las transacciones ACID.
  - Presentar ejemplos básicos de consultas SQL.
- **NoSQL:**
  - Introducir el concepto de NoSQL y explicar el teorema CAP.
  - Hablar sobre la escalabilidad horizontal.
  - Mostrar ejemplos de uso de bases de datos NoSQL.

### Claves: primaria y foránea


### Relaciones entre tablas

- 1:1, 1:N, N:N

### Conceptos ACID

### Diseño de Bases de Datos y Normalización (30 minutos)
- **Principios de Diseño:** Introducir los principios fundamentales del diseño de bases de datos, incluyendo tablas, filas, y columnas.
- **Normalización y Formas Normales:** Explicar qué es la normalización y para qué sirven las formas normales. Discutir cómo la normalización puede prevenir redundancias y mejorar la integridad de los datos.

## Introducción a Bases de Datos (30 minutos)

### ¿Qué es una Base de Datos?

Una base de datos es una colección de datos estructurados que se almacenan de forma organizada y eficiente para que puedan ser accedidos, gestionados y utilizados de forma eficiente. Las bases de datos se utilizan para almacenar una gran variedad de datos, desde información personal hasta datos científicos y empresariales.

**Artículos relevantes:**

* [What is a Database?](https://www.oracle.com/database/what-is-database/)
* [Introducción a las Bases de Datos](https://gestionbasesdatos.readthedocs.io/es/latest/Tema1/Teoria.html)

### Tipos de Usuarios de Bases de Datos

El ecosistema de las bases de datos incluye una variedad de roles, cada uno con responsabilidades únicas:

* **Administradores de Bases de Datos (DBAs):** Encargados de la salud y el rendimiento de la base de datos.
* **Desarrolladores de Bases de Datos:** Especializados en la creación de aplicaciones que se comunican con bases de datos.
* **Analistas de Datos:** Profesionales que interpretan datos para obtener insights y apoyar la toma de decisiones.
* **Usuarios Finales:** Personas que interactúan con los datos a través de una interfaz, sin necesidad de conocimientos técnicos sobre cómo funciona la base de datos.

**Artículos relevantes:**

* [Tipos de usuarios de bases de datos](https://barcelonageeks.com/diferentes-tipos-de-usuarios-de-bases-de-datos/)
* [Deep dive en roles de datos](https://www.springboard.com/blog/data-science/data-science-roles/)

### Diferencias entre Bases de Datos y Excel

Las bases de datos y las hojas de cálculo como Excel tienen propósitos y capacidades distintas. Excel es una herramienta excelente para análisis de datos y proyectos pequeños, pero no está diseñada para manejar grandes volúmenes de datos o realizar operaciones complejas.

**Diferencias clave:**

* **Estructura y Capacidad:** Las bases de datos están diseñadas para almacenar grandes cantidades de datos de manera eficiente, algo que Excel no puede hacer sin comprometer el rendimiento.
* **Funcionalidad:** Las bases de datos ofrecen funcionalidades avanzadas como transacciones, control de concurrencia, y seguridad de datos.
* **Consulta de Datos:** Las bases de datos utilizan lenguajes de consulta como SQL para realizar operaciones complejas, mientras que Excel se basa en fórmulas y funciones.
* **Integridad de Datos:** Las bases de datos mantienen la integridad de los datos a través de restricciones y reglas de negocio.
* **Escalabilidad:** Las bases de datos están diseñadas para escalar con el crecimiento de los datos, algo que Excel no maneja bien.

## Modelos de Datos (30 minutos)

En esta sección, exploraremos los diferentes modelos de bases de datos que son fundamentales para comprender cómo se estructuran y se pueden utilizar los datos en distintos contextos.

### Modelo Relacional

El modelo relacional es uno de los modelos de bases de datos más utilizados. Se basa en la teoría de conjuntos y utiliza una estructura de tabla donde los datos se organizan en filas y columnas. Cada fila representa un registro único y cada columna un campo de ese registro.

- **Características clave:**
  - Estructura tabular
  - Integridad de datos a través de claves primarias y foráneas
  - Operaciones basadas en el álgebra relacional
  - Uso de SQL para la manipulación y consulta de datos

- **Artículo relevante:**
  - [Understanding Relational Databases](https://cloud.google.com/learn/what-is-a-relational-database)

### Modelo Clave-Valor (Key-value)

Las bases de datos clave-valor son sistemas de almacenamiento de datos que utilizan un método simple de clave única para acceder a un valor de datos. Son extremadamente rápidas para consultas de recuperación y actualización y son muy escalables.

- **Casos de uso típicos:**
  - Almacenamiento de sesiones de usuario
  - Sistemas de caché
  - Aplicaciones que requieren alta disponibilidad y baja latencia

- **Artículo relevante:**
  - [Key-Value Databases, Explained](https://redis.com/nosql/key-value-databases/)

### Modelo de Documentos (document store, an evolution of Key-value)

Las bases de datos basadas en documentos almacenan y gestionan datos en formatos de documentos, como JSON, XML o BSON. Son ideales para aplicaciones que requieren una gran flexibilidad en la estructura de datos y donde los datos no se ajustan naturalmente a un esquema rígido.

- **Cuándo usarlas:**
  - Cuando los datos son semi-estructurados o no estructurados
  - Para aplicaciones que requieren agilidad en el desarrollo y cambios frecuentes en el esquema
  - En sistemas donde el rendimiento de lectura es crítico

- **Artículo relevante:**
  - [When to Use Document Databases](https://www.mongodb.com/document-databases)

### Modelo de Columnas Amplias (wide column store, an evolution of Key-value)

El modelo de columnas amplias almacena datos en columnas en lugar de filas, lo que es útil para consultas que deben leer grandes cantidades de datos de una columna específica. Es ideal para analizar grandes conjuntos de datos y para bases de datos que deben escalar horizontalmente.

- **Diferencias clave:**
  - Almacenamiento de datos por columnas en lugar de filas
  - Optimizado para consultas sobre grandes conjuntos de datos
  - Escalabilidad horizontal

- **Artículo relevante:**
  - [Wide-Column Store vs. Relational Database](https://www.scylladb.com/glossary/wide-column-database/)

### Modelo de Grafos

Las bases de datos de grafos están diseñadas para almacenar y navegar relaciones entre entidades de manera eficiente. Son ideales para representar datos complejos y conectados como redes sociales, sistemas de recomendación y más.

- **Ventajas:**
  - Representación intuitiva de relaciones y patrones
  - Eficiencia en la navegación y exploración de conexiones complejas
  - Flexibilidad para evolucionar sin un esquema predefinido

- **Artículo relevante:**
  - [Graph Databases for Beginners](https://neo4j.com/developer/graph-database/)

Cada modelo de datos tiene sus propias ventajas y es adecuado para diferentes tipos de aplicaciones. La elección del modelo de datos depende de los requisitos específicos del sistema y del tipo de operaciones que se realizarán con los datos.

## SQL vs NoSQL (30 minutos)

En esta sección, exploraremos las diferencias fundamentales entre las bases de datos SQL y NoSQL, dos paradigmas dominantes en el mundo de la gestión de datos.

### SQL

SQL (Structured Query Language) es el estándar para trabajar con bases de datos relacionales. Estas bases de datos están estructuradas para reconocer relaciones entre los datos almacenados en tablas.

- **Definición y características principales:**
  - SQL es un lenguaje de dominio específico utilizado en la programación y diseñado para administrar datos en un sistema de gestión de bases de datos relacionales.
  - Las bases de datos SQL son ideales para aplicaciones que requieren transacciones complejas y donde la integridad y la seguridad de los datos son críticas.
  - Son conocidas por su rigidez en los esquemas de datos, lo que puede ser una ventaja para garantizar la consistencia de los datos.

- **Escalabilidad vertical y transacciones ACID:**
  - La escalabilidad vertical implica aumentar la capacidad de un solo servidor, como agregar más memoria o un procesador más rápido.
  - Las bases de datos SQL siguen el modelo ACID para garantizar que todas las transacciones son procesadas de manera confiable.

### NoSQL

NoSQL es un término que engloba una variedad de tecnologías de bases de datos diseñadas para superar las limitaciones de las bases de datos SQL, ofreciendo modelos de datos más flexibles y escalabilidad horizontal.

- **Concepto y teorema CAP:**
  - NoSQL representa "not only SQL" y se refiere a bases de datos no relacionales.
  - El teorema CAP establece que un sistema de base de datos distribuida no puede garantizar simultáneamente la Coherencia (C), la Disponibilidad (A) y la Tolerancia a particiones de red (P) al 100%.
  - Las bases de datos NoSQL a menudo hacen concesiones entre estos tres aspectos según las necesidades específicas de la aplicación.

- **Escalabilidad horizontal:**
  - A diferencia de las bases de datos SQL, las NoSQL están diseñadas para escalar horizontalmente, lo que significa que pueden expandirse a través de múltiples servidores y ubicaciones.
  - Esta característica las hace particularmente adecuadas para aplicaciones en la nube y de gran escala que manejan enormes volúmenes de datos y tráfico.

- **Casos de uso de bases de datos NoSQL:**
  - Las bases de datos NoSQL son preferidas en situaciones donde los datos no son estructurados o donde la estructura de los datos puede cambiar con el tiempo.
  - Son ideales para almacenar datos de usuario para aplicaciones web, manejar grandes volúmenes de datos en tiempo real y para aplicaciones que requieren una rápida iteración del desarrollo.

Al comprender las diferencias entre SQL y NoSQL, los desarrolladores y arquitectos de bases de datos pueden tomar decisiones más informadas sobre qué tecnología se adapta mejor a las necesidades de su aplicación o proyecto.

[NoSQL vs SQL](https://www.geeksforgeeks.org/difference-between-sql-and-nosql/)

## Claves: primaria y foránea

Las claves **primaria** y **foránea** son esenciales para definir relaciones en bases de datos relacionales. La clave primaria define la identidad de los registros. La clave foránea permite relacionar tablas y garantizar la consistencia de los datos.

- **Clave primaria**: Es un identificador único para cada fila en una tabla. No puede contener NULLs ni valores repetidos.
- **Clave foránea**: Es un campo en una tabla que referencia la **clave primaria de otra tabla**. Asegura la integridad referencial (no se pueden insertar valores que no existan en la tabla referenciada).


## Relaciones entre tablas

Las relaciones en bases de datos definen cómo interactúan las tablas entre sí. En **MySQL** y otros sistemas relacionales, las principales relaciones son:

###  Relación **Uno a Uno (1:1)**

- Cada registro de una tabla **se asocia con un único registro** en otra tabla.
- Se usa cuando una entidad tiene atributos opcionales o se desea dividir información por motivos de seguridad.
- Por ejemplo las tablas usuarios y usuarios_detallado. En la primera tendríamos el campo nombre y email, y en la segunda datos más confidenciales y con menor necesidad de acceso, por ello se podrían guardar en otra tabla más securizada. 

### Relación **Uno a Varios (1:N)**

- Un registro de una tabla puede estar relacionado con varios registros en otra tabla.
- Es el caso más habitual.
- Por ejemplo, la tabla clientes y compras. Un cliente puede hacer varias compras, pero cada compra solo está asociada a un cliente

### Relación **Varios a Varios (N:N)**

- Un registro de la primera tabla puede estar relacionado con varios registros de la segunda tabla y viceversa.
- Por ejemplo, la tabla cursos y la tabla estudiantes. Los cursos tienen varios estudiantes, y los estudiantes pueden estar en varios cursos.


## Conceptos ACID en Bases de Datos

Los conceptos **ACID** en bases de datos son un conjunto de propiedades que garantizan la fiabilidad y la integridad de las transacciones en un sistema de gestión de bases de datos (DBMS). **ACID** es un acrónimo de:

### 1. Atomicidad (Atomicity)
- Garantiza que una transacción se complete en su totalidad o no se realice en absoluto.  
- Si una parte de la transacción falla, se revierte todo el proceso para evitar inconsistencias.

### 2. Consistencia (Consistency)
- Asegura que la base de datos pase de un estado válido a otro estado válido después de cada transacción.  
- No permite que la base de datos quede en un estado corrupto o inválido.

### 3. Aislamiento (Isolation)
- Garantiza que las transacciones concurrentes no interfieran entre sí.  
- Cada transacción debe ejecutarse de manera independiente hasta su finalización, evitando efectos colaterales no deseados.

### 4. Durabilidad (Durability)
- Una vez que una transacción ha sido confirmada, sus cambios permanecen en la base de datos incluso ante fallos del sistema, como cortes de energía o caídas del sistema.

Estos principios son fundamentales para garantizar la integridad de los datos en bases de datos relacionales y en algunos sistemas NoSQL que requieren transacciones confiables.


## Diseño de Bases de Datos y Normalización (30 minutos)

El diseño de bases de datos es un paso crítico en la creación de sistemas de información eficientes y confiables. Un buen diseño asegura que la base de datos sea capaz de manejar datos de manera eficiente y flexible. La normalización es una parte fundamental de este proceso.

### Principios de Diseño

Al diseñar una base de datos, es esencial comprender y aplicar ciertos principios fundamentales que guiarán la estructura y organización de los datos.

- **Tablas, Filas y Columnas:**
  - **Tablas:** También conocidas como relaciones, las tablas son la estructura principal en una base de datos relacional y deben diseñarse para almacenar información sobre un tipo de entidad.
  - **Filas:** Cada fila en una tabla representa una instancia única de la entidad definida por la tabla.
  - **Columnas:** Las columnas en una tabla, también conocidas como atributos, representan los diferentes datos que se guardan para cada instancia de la entidad.

### Normalización y Formas Normales

La **normalización** en bases de datos es el proceso de organizar los datos de manera que se reduzcan las redundancias y se eviten las dependencias problemáticas. Esto se logra dividiendo una tabla en otras tablas más pequeñas y estableciendo relaciones entre ellas. Las tres primeras formas normales (1NF, 2NF, 3NF) son las más comunes. A continuación, se explica brevemente cada una:


- **Qué es la Normalización:**
  - La normalización implica descomponer tablas en partes más pequeñas y manejables mientras se mantienen las relaciones entre ellas.
  - El objetivo es minimizar la duplicación de datos y evitar problemas de actualización de datos en la base de datos.

- **Propósito de las Formas Normales:**
  - Las formas normales son un conjunto de reglas para guiar el diseño de la base de datos.
  - Cada "forma normal" es un nivel de requisitos que una base de datos debe cumplir para considerarse normalizada.
  - Las primeras tres formas normales (1NF, 2NF, 3NF) son las más utilizadas y se centran en asegurar que cada tabla tenga una clave primaria y que los datos almacenados en una tabla se refieran solo a esa clave primaria.

- **Prevención de Redundancias:**
  - La normalización ayuda a prevenir redundancias al asegurar que cada pieza de información se almacene solo una vez.
  - Cuando los datos se actualizan, la normalización reduce el riesgo de inconsistencias, ya que cada dato tiene un único punto de actualización.

- **Mejora de la Integridad de los Datos:**
  - Al separar los datos en tablas lógicas y relacionadas, la normalización protege la integridad de los datos.
  - Las restricciones de integridad, como las claves foráneas, aseguran relaciones consistentes entre tablas.

La normalización es un equilibrio entre la eficiencia de acceso a los datos y la rapidez de actualización de los mismos. En algunos casos, especialmente en bases de datos de alto rendimiento, puede ser necesario desnormalizar ligeramente la estructura de la base de datos para optimizar el rendimiento de las consultas.

Al comprender y aplicar los principios de diseño y normalización, los diseñadores de bases de datos pueden crear sistemas robustos que manejen los datos de manera eficaz y eficiente.
[Database normalization](https://www.freecodecamp.org/news/database-normalization-1nf-2nf-3nf-table-examples/)

## Tipos de normalizaciones

1. **1NF**: Elimina valores no atómicos, asegurando que cada celda contenga un solo valor.
2. **2NF**: Elimina dependencias parciales, asegurando que las columnas no clave dependan completamente de la clave primaria.
3. **3NF**: Elimina dependencias transitivas, asegurando que las columnas no clave dependan directamente de la clave primaria.


## Ejemplo normalización

## 1. Tabla Original de compras

Tenemos una tabla en la que cada línea representa una compra en la que pueden haber varios artículos. Incluye los precios, la forma de pago e infortmación propia del cliente como su procedencia. 

| ID_Cliente | Nombre_Cliente | ID_Carrito | Carrito (Artículos)              | Importe_Prod (Precios)        | Importe_Total | Código_Provincia | Provincia  | Forma_Pago | Número_Artículos |
|------------|----------------|------------|----------------------------------|-------------------------------|---------------|------------------|------------|------------|------------------|
| 1          | Juan Pérez     | 101        | "Zapatos, Camisa"                | "50, 20"                       | 70            | 28               | Madrid     | Tarjeta    | 2                |
| 1          | Juan Pérez     | 102        | "Camisa, Camisa"                 | "20, 20"                       | 40            | 28               | Madrid     | Efectivo   | 2                |
| 2          | María García   | 103        | "Pantalones"                     | "30"                           | 30            | 8                | Barcelona  | Online     | 1                |
| 3          | Carlos López   | 104        | "Zapatos, Sombrero"              | "50, 15"                       | 65            | 12               | Valencia   | Tarjeta    | 2                |
| 4          | Laura Martínez | 105        | "Camisa"                         | "20"                           | 20            | 41               | Sevilla    | Efectivo   | 1                |
| 4          | Laura Martínez | 106        | "Pantalones, Camisa, Sombrero"   | "30, 20, 15"                   | 65            | 41               | Sevilla    | Online     | 3                |

## 2. **Primera Forma Normal (1NF)**

En la **1NF**, descomponemos las tuplas dentro de las celdas y separamos los productos y precios en filas individuales, asegurándonos de que cada celda contenga un solo valor atómico. Además, añadimos un **ID_Articulo** único para cada artículo.

### Tabla en 1NF

| ID_Cliente | Nombre_Cliente | ID_Carrito | ID_Articulo | Nombre_Articulo | Precio_Unitario | Cantidad_de_ID_Articulo | Importe_Total | Código_Provincia | Provincia  | Forma_Pago | Número_Artículos |
|------------|----------------|------------|-------------|-----------------|-----------------|-------------------------|---------------|------------------|------------|------------|------------------|
| 1          | Juan Pérez     | 101        | 1           | Zapatos         | 50              | 1                       | 70            | 28               | Madrid     | Tarjeta    | 2                |
| 1          | Juan Pérez     | 101        | 2           | Camisa          | 20              | 1                       | 70            | 28               | Madrid     | Tarjeta    | 2                |
| 1          | Juan Pérez     | 102        | 2           | Camisa          | 20              | 2                       | 40            | 28               | Madrid     | Efectivo   | 2                |
| 2          | María García   | 103        | 3           | Pantalones      | 30              | 1                       | 30            | 8                | Barcelona  | Online     | 1                |
| 3          | Carlos López   | 104        | 1           | Zapatos         | 50              | 1                       | 65            | 12               | Valencia   | Tarjeta    | 2                |
| 3          | Carlos López   | 104        | 4           | Sombrero        | 15              | 1                       | 65            | 12               | Valencia   | Tarjeta    | 2                |
| 4          | Laura Martínez | 105        | 5           | Camisa          | 20              | 1                       | 20            | 41               | Sevilla    | Efectivo   | 1                |
| 4          | Laura Martínez | 106        | 3           | Pantalones      | 30              | 1                       | 65            | 41               | Sevilla    | Online     | 3                |
| 4          | Laura Martínez | 106        | 5           | Camisa          | 20              | 1                       | 65            | 41               | Sevilla    | Online     | 3                |
| 4          | Laura Martínez | 106        | 4           | Sombrero        | 15              | 1                       | 65            | 41               | Sevilla    | Online     | 3                |

## 3. **Segunda Forma Normal (2NF)**

Para cumplir con la **2NF**, eliminamos las dependencias parciales. La columna **Importe_Total** depende de **ID_Carrito**, no de **ID_Cliente** ni de **ID_Articulo**. La información sobre los **clientes** y **carritos** debe ser separada en tablas distintas.

### Tabla de Clientes

| ID_Cliente | Nombre_Cliente | Código_Provincia | Provincia  |
|------------|----------------|------------------|------------|
| 1          | Juan Pérez     | 28               | Madrid     |
| 2          | María García   | 8                | Barcelona  |
| 3          | Carlos López   | 12               | Valencia   |
| 4          | Laura Martínez | 41               | Sevilla    |

### Tabla de Carritos

Esta tabla contiene los detalles del carrito: **ID_Carrito**, **Forma_Pago**, **Importe_Total**, **ID_Cliente** y **Número_Artículos**.

| ID_Carrito | ID_Cliente | Forma_Pago | Importe_Total | Número_Artículos |
|------------|------------|------------|---------------|------------------|
| 101        | 1          | Tarjeta    | 70            | 2                |
| 102        | 1          | Efectivo   | 40            | 2                |
| 103        | 2          | Online     | 30            | 1                |
| 104        | 3          | Tarjeta    | 65            | 2                |
| 105        | 4          | Efectivo   | 20            | 1                |
| 106        | 4          | Online     | 65            | 3                |

### Tabla de Artículos

| ID_Articulo | Nombre_Articulo | Precio_Unitario |
|-------------|-----------------|-----------------|
| 1           | Zapatos         | 50              |
| 2           | Camisa          | 20              |
| 3           | Pantalones      | 30              |
| 4           | Sombrero        | 15              |

### Tabla de Detalles Carrito

Esta tabla contiene los detalles de cada artículo dentro de un carrito: **ID_Cliente**, **ID_Carrito**, **ID_Articulo**, **Cantidad_de_ID_Articulo**.

| ID_Cliente | ID_Carrito | ID_Articulo | Cantidad_de_ID_Articulo |
|------------|------------|-------------|-------------------------|
| 1          | 101        | 1           | 1                       |
| 1          | 101        | 2           | 1                       |
| 1          | 102        | 2           | 2                       |
| 2          | 103        | 3           | 1                       |
| 3          | 104        | 1           | 1                       |
| 3          | 104        | 4           | 1                       |
| 4          | 105        | 5           | 1                       |
| 4          | 106        | 3           | 1                       |
| 4          | 106        | 5           | 1                       |
| 4          | 106        | 4           | 1                       |

## 4. **Tercera Forma Normal (3NF)**

Para cumplir con la **3NF**, eliminamos las dependencias transitivas. En este caso, la columna **Provincia** depende de **Código_Provincia** en la tabla **Clientes**, lo que introduce una dependencia transitiva.

### Tabla de Clientes

| ID_Cliente | Nombre_Cliente | Código_Provincia |
|------------|----------------|------------------|
| 1          | Juan Pérez     | 28               |
| 2          | María García   | 8                |
| 3          | Carlos López   | 12               |
| 4          | Laura Martínez | 41               |

### Tabla de Provincias

| Código_Provincia | Nombre_Provincia | Renta_Per_Capita |
|------------------|------------------|------------------|
| 28               | Madrid           | 30000            |
| 8                | Barcelona        | 25000            |
| 12               | Valencia         | 23000            |
| 41               | Sevilla          | 21000            |

### Tabla de Carritos

| ID_Carrito | ID_Cliente | Forma_Pago | Importe_Total | Número_Artículos |
|------------|------------|------------|---------------|------------------|
| 101        | 1          | Tarjeta    | 70            | 2                |
| 102        | 1          | Efectivo   | 40            | 2                |
| 103        | 2          | Online     | 30            | 1                |
| 104        | 3          | Tarjeta    | 65            | 2                |
| 105        | 4          | Efectivo   | 20            | 1                |
| 106        | 4          | Online     | 65            | 3                |

### Tabla de Artículos

| ID_Articulo | Nombre_Articulo | Precio_Unitario |
|-------------|-----------------|-----------------|
| 1           | Zapatos         | 50              |
| 2           | Camisa          | 20              |
| 3           | Pantalones      | 30              |
| 4           | Sombrero        | 15              |

### Tabla de Detalles Carrito

| ID_Cliente | ID_Carrito | ID_Articulo | Cantidad_de_ID_Articulo |
|------------|------------|-------------|-------------------------|
| 1          | 101        | 1           | 1                       |
| 1          | 101        | 2           | 1                       |
| 1          | 102        | 2           | 2                       |
| 2          | 103        | 3           | 1                       |
| 3          | 104        | 1           | 1                       |
| 3          | 104        | 4           | 1                       |
| 4          | 105        | 5           | 1                       |
| 4          | 106        | 3           | 1                       |
| 4          | 106        | 5           | 1                       |
| 4          | 106        | 4           | 1                       |


