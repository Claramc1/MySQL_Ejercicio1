USE tienda;
-- 3.1. Lista el nombre de todos los productos que hay en la tabla producto.
SELECT nombre
FROM producto
-- 3.2. Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT nombre, precio
FROM producto
-- 3.3. Lista todas las columnas de la tabla producto.
SELECT *
FROM producto
-- 3.4. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT nombre, concat(precio,"EUR"), concat(precio*1.08,"USD")
FROM producto
-- 3.5. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
SELECT nombre, concat(precio,"EUR") AS Euros,
concat(precio*1.08,"USD") AS Dólares
FROM producto
-- Si el cambio de nombre tuviera espacio, habría que ponerlo entre comillas
-- 3.6. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT UPPER(nombre) AS NOMBRE, concat(precio,"EUR") AS Euros,
    concat(precio*1.08,"USD") AS Dólares
FROM producto
-- 3.7. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
SELECT LOWER(nombre) AS 'nombre minúscula', concat(precio,"EUR") AS Euros,
    concat(precio*1.08,"USD") AS Dólares
FROM producto
-- 3.8. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT nombre,
left(UPPER(nombre),2) AS mayus
FROM fabricante
-- 3.9. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT nombre, ROUND(precio,0)
FROM producto
-- 3.10 Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT nombre, TRUNCATE(precio,0)
FROM producto
-- 3.11 Lista el código de los fabricantes que tienen productos en la tabla producto.
SELECT codigo_fabricante
FROM producto
-- 3.12 Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.
SELECT DISTINCT codigo_fabricante
FROM producto
-- 3.13 Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre FROM fabricante
ORDER BY nombre ASC
-- 3.14 Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT nombre FROM fabricante
ORDER BY nombre DESC
-- 3.15 Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
SELECT nombre, precio FROM producto
ORDER BY nombre ASC, precio DESC
-- 3.16 Devuelve una lista con las 5 primeras filas de la tabla fabricante.
SELECT * FROM producto
WHERE codigo <=5
-- o también
SELECT * FROM producto LIMIT 5
-- 3.17 Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
SELECT * FROM fabricante
LIMIT 3,9
-- 3.18 Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT nombre, precio FROM producto
ORDER BY precio ASC
LIMIT 1
-- 3.19 Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT nombre, precio FROM producto
ORDER BY precio DESC
LIMIT 1
-- 3.20 Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT nombre FROM producto
WHERE codigo_fabricante = 2
-- 3.21 Lista el nombre de los productos que tienen un precio menor o igual a 120€.
SELECT nombre FROM producto
WHERE precio <= 120
-- 3.22 Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
SELECT nombre FROM producto
WHERE precio >= 400
-- 3.23 Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
SELECT nombre FROM producto
WHERE NOT precio >= 400
-- 3.24 Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
SELECT * FROM producto
WHERE precio > 80 AND precio < 300
-- 3.25 Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
SELECT * FROM producto
WHERE precio BETWEEN 60 AND 200
-- 3.26 Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6.
SELECT * FROM producto
WHERE precio >= 200 AND codigo_fabricante = 6
-- 3.27 Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
SELECT * FROM producto
WHERE codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5
-- 3.28 Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.
SELECT * FROM producto
WHERE codigo_fabricante IN (1,3,5)
-- 3.29 Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
SELECT nombre, concat(precio*100) AS "Céntimos" FROM producto
-- 3.30 Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
SELECT nombre FROM fabricante
WHERE nombre LIKE 's%'
-- 3.31 Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
SELECT nombre FROM fabricante
WHERE nombre LIKE '%e'
-- 3.32 Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
SELECT nombre FROM fabricante
WHERE nombre LIKE '%w%'
-- 3.33 Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
SELECT nombre FROM fabricante
WHERE nombre LIKE '____'
-- 3.34 Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
SELECT nombre FROM producto
WHERE nombre LIKE '%Portátil%'
-- 3.35 Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
SELECT nombre FROM producto
WHERE nombre LIKE '%Monitor%' AND precio < 215
-- 3.36 Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
SELECT nombre, precio FROM producto
WHERE precio >= 180
ORDER BY precio DESC, nombre ASC
-- 4.1 Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT producto.nombre, precio, fabricante.nombre FROM producto 
JOIN fabricante
	ON producto.codigo_fabricante = fabricante.codigo 
-- 4.2 Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
SELECT producto.nombre, precio, fabricante.nombre FROM producto
JOIN fabricante
	ON producto.codigo_fabricante = fabricante.codigo
ORDER BY fabricante.nombre ASC
-- 4.3 Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.
SELECT producto.codigo, producto.nombre, producto.codigo_fabricante, fabricante.nombre FROM producto
JOIN fabricante
	ON producto.codigo_fabricante = fabricante.codigo
-- 4.4 Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT producto.nombre, precio, fabricante.nombre FROM producto
JOIN fabricante
	ON producto.codigo_fabricante = fabricante.codigo
ORDER BY precio ASC
LIMIT 1
-- 4.5 Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT producto.nombre, precio, fabricante.nombre FROM producto
JOIN fabricante
	ON producto.codigo_fabricante = fabricante.codigo
ORDER BY precio DESC
LIMIT 1 
-- 4.6 Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT * FROM producto
JOIN fabricante
	ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Lenovo'
-- 4.7 Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
SELECT * FROM producto
JOIN fabricante
	ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Crucial' AND precio > 200
-- 4.8 Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Sin utilizar el operador IN.
SELECT producto.nombre FROM producto
JOIN fabricante
	ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Asus' OR fabricante.nombre = 'Hewlett-Packard' OR fabricante.nombre = 'Seagate'
-- 4.9 Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Utilizando el operador IN.
SELECT producto.nombre FROM producto
JOIN fabricante
	ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate')
-- 4.10 Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
SELECT producto.nombre, precio FROM producto
JOIN fabricante
	ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre LIKE '%e'
-- 4.11 Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
SELECT producto.nombre, precio FROM producto
JOIN fabricante
	ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre LIKE '%w%'
-- 4.12 Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
SELECT producto.nombre, precio, fabricante.nombre FROM producto
JOIN fabricante
	ON producto.codigo_fabricante = fabricante.codigo
WHERE precio >= 180
ORDER BY precio DESC, producto.nombre ASC
-- 4.13 Devuelve un listado con el código y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
SELECT fabricante.codigo, fabricante.nombre FROM fabricante
JOIN producto
	ON producto.codigo_fabricante = fabricante.codigo
WHERE codigo_fabricante IS NOT NULL
-- 5.1 Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
SELECT f.nombre, p.nombre FROM fabricante f
LEFT JOIN producto p
ON p.codigo_fabricante = f.codigo
-- 5.2 Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT * FROM fabricante f
LEFT JOIN producto p
	ON p.codigo_fabricante = f.codigo
WHERE p.codigo_fabricante IS NULL
-- 5.3 ¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.
No debería, a menos que sea de fbricante desconocido alguien tiene que haber creado el producto.
-- 6.1 Calcula el número total de productos que hay en la tabla productos.
SELECT COUNT(nombre) FROM producto
-- 6.2 Calcula el número total de fabricantes que hay en la tabla fabricante.
SELECT COUNT(nombre) FROM fabricante
-- 6.3 Calcula el número de valores distintos de código de fabricante aparecen en la tabla productos.
SELECT COUNT(DISTINCT codigo_fabricante) FROM producto
-- 6.4 Calcula la media del precio de todos los productos.
SELECT AVG(precio) FROM producto
-- 6.5 Calcula el precio más barato de todos los productos.
SELECT MIN(precio) FROM producto
-- 6.6 Calcula el precio más caro de todos los productos.
SELECT MAX(precio) FROM producto
-- 6.7 Lista el nombre y el precio del producto más barato.
SELECT precio, nombre FROM producto
WHERE Precio = (SELECT MIN(precio) FROM producto)
-- 6.8 Lista el nombre y el precio del producto más caro.
SELECT nombre, precio FROM producto
WHERE precio = (SELECT MAX(precio) FROM producto)
-- 6.9 Calcula la suma de los precios de todos los productos.
SELECT SUM(precio) AS Suma FROM producto
-- 6.10 Calcula el número de productos que tiene el fabricante Asus.
SELECT COUNT(producto.nombre) AS 'productos Asus' FROM producto
JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Asus'
-- 6.11 Calcula la media del precio de todos los productos del fabricante Asus.
SELECT AVG(producto.precio) AS 'media Asus' FROM producto
JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Asus'
-- 6.12 Calcula el precio más barato de todos los productos del fabricante Asus.
SELECT MIN(producto.precio) AS 'Barato Asus' FROM producto
JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Asus'
-- 6.13 Calcula el precio más caro de todos los productos del fabricante Asus.
SELECT MAX(producto.precio) AS 'Caro Asus' FROM producto
JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Asus'
-- 6.14 Calcula la suma de todos los productos del fabricante Asus.
SELECT COUNT(producto.nombre) AS 'Prod Asus' FROM producto
JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Asus'
-- 6.15 Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
SELECT MAX(producto.precio), MIN(producto.precio), AVG (producto.precio), COUNT(producto.nombre) FROM producto
JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Crucial'
-- 6.16 Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto.
-- El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos.
SELECT fabricante.nombre, COUNT(producto.nombre) AS num_prod FROM producto
RIGHT JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
GROUP BY fabricante.nombre
ORDER BY num_prod DESC
-- 6.17 Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
SELECT fabricante.nombre, MAX(producto.precio), MIN(producto.precio), AVG(producto.precio) FROM producto
LEFT JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
GROUP BY fabricante.nombre
-- 6.18 Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el código del fabricante es suficiente.
SELECT codigo_fabricante, MAX(precio), MIN(precio), AVG(precio), COUNT(codigo_fabricante) FROM producto
GROUP BY codigo_fabricante
HAVING AVG(precio) > 200
-- 6.19 Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.
SELECT fabricante.nombre, MAX(precio), MIN(precio), AVG(precio), COUNT(codigo_fabricante) FROM producto
JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
GROUP BY codigo_fabricante
HAVING AVG(precio) > 200
-- 6.20 Calcula el número de productos que tienen un precio mayor o igual a 180€.
SELECT COUNT(precio) FROM producto
WHERE precio >= 180
-- 6.21 Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
SELECT codigo_fabricante, COUNT(precio) FROM producto
WHERE precio >= 180
GROUP BY codigo_fabricante
-- 6.22 Lista el precio medio los productos de cada fabricante, mostrando solamente el código del fabricante.
SELECT codigo_fabricante, AVG(precio) FROM producto
GROUP BY codigo_fabricante
-- 6.23 Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
SELECT fabricante.nombre, AVG(precio) FROM producto
JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
GROUP BY codigo_fabricante
-- 6.24 Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
SELECT fabricante.nombre, AVG(precio) FROM producto
JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
GROUP BY codigo_fabricante
HAVING AVG(precio) >= 150
-- 6.25 Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
SELECT fabricante.nombre, COUNT(codigo_fabricante) FROM producto
JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
GROUP BY codigo_fabricante
HAVING COUNT(codigo_fabricante) >= 2
-- 6.26 Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €.
-- No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición.
SELECT fabricante.nombre, COUNT(codigo_fabricante) AS total FROM producto
JOIN fabricante
ON producto.codigo_fabricante = fabricante.codigo
WHERE precio >= 220
GROUP BY codigo_fabricante
ORDER BY total DESC
-- 6.27 Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno
-- con un precio superior o igual a 220 €.
-- El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene
-- productos con un precio superior o igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.
SELECT fabricante.nombre, SUM(if(producto.precio >= 220, 1, 0)) AS quantity FROM fabricante
LEFT JOIN producto
ON fabricante.codigo = producto.codigo_fabricante
WHERE producto.precio >= 0 or producto.precio IS NULL
GROUP BY fabricante.nombre
ORDER BY quantity DESC
-- 6.28 Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.
SELECT fabricante.nombre, SUM(producto.precio) FROM fabricante
LEFT JOIN producto
ON fabricante.codigo = producto.codigo_fabricante
GROUP BY fabricante.codigo
HAVING SUM(producto.precio) > 1000
-- 6.29 Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante.
SELECT producto.nombre, MAX(producto.precio), fabricante.nombre AS nombre_fabricante FROM producto
JOIN fabricante
ON fabricante.codigo = producto.codigo_fabricante
GROUP BY nombre_fabricante
ORDER BY nombre_fabricante ASC
-- 7.1 Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT nombre FROM producto
WHERE codigo_fabricante = 2
-- 7.2 Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT * FROM producto
WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = 2 )
-- 7.3 Lista el nombre del producto más caro del fabricante Lenovo.
SELECT nombre FROM producto
WHERE codigo_fabricante = 2 
ORDER BY precio DESC
LIMIT 1
-- 7.4 Lista el nombre del producto más barato del fabricante Hewlett-Packard.
SELECT nombre FROM producto
WHERE codigo_fabricante = 3 
ORDER BY precio ASC
LIMIT 1
-- 7.5 Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
SELECT nombre, precio FROM producto
WHERE precio >= (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = 2 )
-- 7.6 Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
SELECT nombre FROM producto
WHERE codigo_fabricante = 1 AND precio > (SELECT AVG(precio) FROM producto WHERE codigo_fabricante = 1 )
-- 7.8 Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.
SELECT * FROM producto
WHERE precio >= ALL (SELECT precio
    FROM fabricante INNER JOIN producto
    ON fabricante.codigo = producto.codigo_fabricante)
-- 7.9 Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.
SELECT * FROM producto
WHERE precio <= ALL (SELECT precio
    FROM fabricante INNER JOIN producto
    ON fabricante.codigo = producto.codigo_fabricante)
-- 7.10 Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).
SELECT nombre FROM fabricante
WHERE codigo = ANY (SELECT codigo_fabricante
    FROM producto INNER JOIN fabricante
    ON fabricante.codigo = producto.codigo_fabricante)
-- 7.11 Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).
SELECT nombre FROM fabricante
WHERE codigo != ALL (SELECT codigo_fabricante
    FROM producto INNER JOIN fabricante
    ON fabricante.codigo = producto.codigo_fabricante)
-- 7.12 Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).
SELECT nombre FROM fabricante
WHERE codigo IN (SELECT codigo_fabricante
    FROM producto INNER JOIN fabricante
    ON fabricante.codigo = producto.codigo_fabricante)
-- 7.13 Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).
SELECT nombre FROM fabricante
WHERE codigo NOT IN (SELECT codigo_fabricante
    FROM producto INNER JOIN fabricante
    ON fabricante.codigo = producto.codigo_fabricante)
-- 7.14 Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT DISTINCT fabricante.nombre FROM fabricante
JOIN producto ON fabricante.codigo = producto.codigo_fabricante
WHERE EXISTS (SELECT codigo_fabricante FROM producto JOIN fabricante
ON fabricante.codigo = producto.codigo_fabricante WHERE codigo_fabricante IS NOT NULL ) 
-- o
SELECT fabricante.nombre FROM fabricante
WHERE EXISTS (SELECT * FROM producto
WHERE fabricante.codigo = producto.codigo_fabricante)
-- 7.15 Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT fabricante.nombre FROM fabricante
WHERE NOT EXISTS (SELECT * FROM producto
WHERE fabricante.codigo = producto.codigo_fabricante)
-- 7.16 Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.
SELECT fabricante.nombre, producto.nombre, producto.precio FROM fabricante
JOIN producto ON fabricante.codigo = producto.codigo_fabricante
WHERE producto.precio = (SELECT MAX(precio) FROM producto WHERE fabricante.codigo = producto.codigo_fabricante)
-- 7.17 Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.
SELECT fabricante.nombre, producto.nombre, producto.precio FROM fabricante
JOIN producto ON fabricante.codigo = producto.codigo_fabricante
WHERE producto.precio >= (SELECT AVG(precio) FROM producto WHERE fabricante.codigo = producto.codigo_fabricante)
-- 7.18 Lista el nombre del producto más caro del fabricante Lenovo
SELECT fabricante.nombre, producto.nombre, producto.precio FROM fabricante
JOIN producto ON fabricante.codigo = producto.codigo_fabricante
WHERE producto.precio >= (SELECT AVG(precio) FROM producto WHERE fabricante.codigo = producto.codigo_fabricante AND fabricante.nombre = 'Lenovo')
-- 8.1 Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.
SELECT fabricante.nombre FROM fabricante
JOIN producto ON fabricante.codigo = producto.codigo_fabricante
GROUP BY fabricante.codigo
HAVING COUNT(producto.codigo) = (SELECT COUNT(producto.codigo) FROM producto JOIN fabricante
ON fabricante.codigo = producto.codigo_fabricante 
WHERE fabricante.nombre = 'Lenovo')




