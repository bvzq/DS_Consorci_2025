-- Tabla con los codigos de oficina y su número de teléfono
select officeCode, phone
from offices
;
-- Busca los empleados con email .es

select *, email, substring(email, -3) as es
from employees
-- where substring(email, -3) = '.es'
where email like '%.es';

-- Customers sin State
select * 
from payments
where state is null;

-- Selecciona los pagos superiores a 20.000
select * from payments where amount > 20000;

-- Selecciona los pagos superiores a 20.000 y del año 2005
select * 
from payments 
where amount > 20000
and YEAR(paymentDate) = 2005
-- and paymentDate BETWEEN '2005-01-01' and '2005-12-31' -- Estas dos líneas AND son similares a la anterior, el resultado es el mismo pero llegamos a ella de manera diferente
-- and paymentDate >= '2005-01-01' and paymentDate >= '2005-12-31'
;

-- Selecciona de la tabla orderdetails las lineas únicas por productcode
-- El comando DISTINCT nos elimina los duplicados
SELECT DISTINCT productCode
from orderdetails
;

-- Muestra una tabla con la cuenta de compras por país
select c.country, count(*) as cuenta
from orders p
inner join customers c on p.customerNumber = c.customerNumber
group by c.country;

-- Muestra una tabla con la cuenta de compras por país, y filtra por lo países con más de 10 compras
select c.country, count(*) as cuenta
from orders p
inner join customers c on p.customerNumber = c.customerNumber
group by c.country
having cuenta > 10;

-- PorductLine con la textDescription más larga
SELECT productLine, textDescription, length(textDescription), MAX(length(textDescription))
FROM productlines;

select productLine, textDescription, length(textDescription) as longitud
from 
;
-- Numero de customers por oficina
-- Existen algunos customers sin empleado ni oficina, por eso obtenemos resultados diferentes si empezamos resolviendo el ejercicio por offices o por customer. 
-- También tenemos que tener en cuenta los LEFT o RIGHT
SELECT offices.officeCode, COUNT(customers.customerNumber) AS customer_count 
FROM offices 
LEFT JOIN employees ON offices.officeCode = employees.officeCode
RIGHT JOIN customers ON employees.employeeNumber = customers.salesRepEmployeeNumber
GROUP BY offices.officeCode;

SELECT offices.officeCode, COUNT(customers.customerNumber) AS customer_count 
FROM customers 
LEFT JOIN employees ON employees.employeeNumber = customers.salesRepEmployeeNumber
LEFT JOIN offices ON offices.officeCode = employees.officeCode
GROUP BY offices.officeCode;

-- Que dia de la semana es en el que se han vendido más coches??
SET lc_time_names = 'es_ES';
SELECT DAYNAME(orderDate) AS weekday, count(*) as cuenta, p.productLine
from orders o
left join orderdetails od on od.orderNumber=o.orderNumber
left join products p on p.productCode=od.productCode
where p.productLine like '%Car%'
group by weekday, p.productName
;
-- Corrige los valores NA de la variable territory de la tabla offices por USA, usando case when
select *,
Case when territory = 'NA' then 'USA'
	else territory end as territory_new
from offices
;

-- Importe medio por carrito(order) y total de items, por año-mes, realizados en los años 2004 y 2005, por clientes asistidos por los empleados de la familia Patterson.
-- SOLUCION 1, importe medio por carrito y añomes
select s.año, s.mes, avg(s.totalCarrito) as promerdioCarrito, sum(s.numero_items) as NumItem
from (
	select o.orderNumber, year(o.orderDate) as año, month(o.orderDate) as mes , concat(year(orderDate), lpad(month(orderDate),2,'0')) as anomes, 
		sum(d.quantityOrdered*d.priceEach) as totalCarrito, count(o.orderNumber) as numero_items
	from orders o
	left join orderdetails d on o.orderNumber = d.orderNumber
	left join customers c on c.customerNumber = o.customerNumber
	left join  employees e on e.employeeNumber = c.salesRepEmployeeNumber
	where year(o.orderDate) >= 2004 and year(o.orderDate) <= 2005
		and e.lastName = 'Patterson'
group by o.orderNumber, year(o.orderDate), month(o.orderDate)  
) s
group by s.año, s.mes
;
-- SOLUCION 2, importemedio por añomes
EXPLAIN ANALYZE
Select concat(year(orderDate), lpad(month(orderDate),2,'0')) as anomes, sum(details.quantityOrdered) as numOrders,
round(avg(details.priceEach * details.quantityOrdered),2) as meanPriceOrder

	from classicmodels.orders as ord
    left join classicmodels.orderDetails as details
    on ord.orderNumber = details.orderNumber
    
    left join classicmodels.customers as cust
    on ord.customerNumber = cust.customerNumber
    
    left join classicmodels.employees as empl
    on cust.salesRepEmployeeNumber = empl.employeeNumber
    
	where (year(ord.orderDate) = 2004 or year(ord.orderDate) = 2005) and empl.lastName = 'Patterson'
    group by concat(year(orderDate), lpad(month(orderDate),2,'0'))
    
;

select *,orderDate, count(*) as cuenta
from orders
where count(*) > 2
group by orderDate
-- having cuenta > 10


;
-- con tablas temporales WITH
EXPLAIN ANALYZE
with orders as (
select customerNumber, ord.orderNumber, ord.orderDate, quantityOrdered, priceEach  from classicmodels.orders as ord 
    left join classicmodels.orderDetails as details
    on ord.orderNumber = details.orderNumber
    where (year(ord.orderDate) = 2004 or year(ord.orderDate) = 2005)
    -- group by concat(year(orderDate), lpad(month(orderDate),2,'0'))
), customers as (
select customerNumber, salesRepEmployeeNumber from  customers
), employees as (
select employeeNumber, lastName from employees
), cust_employ as (
select customerNumber, employeeNumber, lastName 
from customers c left join employees e on c.salesRepEmployeeNumber = e.employeeNumber
where e.lastName = 'Patterson'
), patterson_orders as (
select o.customerNumber, orderNumber, orderDate, quantityOrdered, priceEach, lastName, employeeNumber
from orders o
inner join cust_employ ce on o.customerNumber = ce.customerNumber
)
select *,concat(year(orderDate), lpad(month(orderDate),2,'0')) as anomes, sum(quantityOrdered) as numOrders,
round(avg(priceEach * quantityOrdered),2) as meanPriceOrder from patterson_orders
group by concat(year(orderDate), lpad(month(orderDate),2,'0'));


-- Quiero ir personalmente a las oficinas donde haya empleados con customers con el state vacío, para regañarles. Me puedes decir a qué oficinas tengo que ir?

select c.customerName, o.officeCode, e.officeCode, o.addressLine1, employeeNumber, c.state 
from customers c
left join employees e
on c.salesRepEmployeeNumber=e.employeeNumber

left join offices o
on e.officeCode=o.officeCode

Where c.state is null
;
/*Con tabla temporal*/
with cust_state as (
select customerName, state, city, salesRepEmployeeNumber from customers where state is null or state = ''
), employ as ( select c.customerName, c.state, c.city, e.lastName, e.officeCode from employees e
inner join cust_state c
on salesRepEmployeeNumber = employeeNumber
) select e.*, addressLine1, postalCode
from offices o
inner join employ e
on o.officeCode=e.officeCode





