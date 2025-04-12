# Ejercicio 1

Utiliza Factures.xls para crear tu primer dashboard. 

 - Empieza con el modelo, sus tablas y relaciones.
 - Usa PowerQuery para el tratamiento de datos inicial.
 - Define las columnas o métricas que consideres necesarias para que tu herramienta de reporte muestre una información más relevante e interesante.
 - Usa los datos originales y tus métricas para diseñar tus visualizaciones e indicadores

# Ejercicio 2

Conecta PowerBI con tu base de datos Stockify de MySQL. 

 - Desarrolla y diseña un Dashboard con los datos de los stocks:
    - Indicadores y visualizaciones sobre los precios
	- Indicadores y visualizaciones sobre variaciones diarias
	- top5 de las compañías más caras, las compañías que más han crecido, las más volátiles...
	- Indicadores y visualizaciones sobre usuarios y sus transacciones (En los datos originales esta información es escasa, pero prepara los indicadores por si los hacemos más ricos)
    - Y todas las informaciones que te parezcan relevante mostrar a tus clientes si fueras un consultor de datos de bolsa
 - Si la conexión entre Python y MySQL, y entre MySQL y PowerBI, es correcta deberían actualizarse tus indicadores día a día (Si ejecutas tu código en Python)
 
 ## Bonus Ejercicio 2
 
 - Rellena los datos faltantes entre 2022 y 2025 
 - Trata de obtener más detalle temporal sobre tus datos, es decir información precios a la hora, al menos por un período de 3 meses.
 - Para una mejor experiencia y visualización por fecha y sus jerarquías, sería aconsejable crear una tabla dimensión "Fechas", con el id fecha_hora como primary key y una serie de columnas tales como dia, mes, cuatrimestre, año... Podría valerte con una serie de columnas en  la tabla Stocks, pero sabemos que no es lo más óptimo
 



