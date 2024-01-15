/*1.- Crea una tabla llamada 'clientes' con las columnas id(entero) y nombre (cadena de texto) */
CREATE TABLE IF NOT EXISTS  clientes_5(
	id INT,
	nombre VARCHAR(255)
);

/*2.-Inserta un cliente con id=1 y nombre John en la tabla 'clientes' */
INSERT INTO public.clientes_5 (id,nombre)
VALUES (1,'John ')

/*3.-Actualiza el nombre del cliente con id=1 a 'John Doe' en la tabla clientes*/
UPDATE public.clientes_5
SET nombre = 'John Doe'
WHERE id=1

/*4.-Elimina el cliente con id=1 de la tabla 'clientes'*/
DELETE FROM public.clientes_5
WHERE id=1

/*5.-Lee todos los clientes de la tabla 'clientes */
SELECT * FROM public.clientes_5

/*6.-Crea una tabla llamada 'pedidos' con las columnas id(entero) y cliente_id(entero) */
CREATE TABLE pedidos_5 (
	id INT PRIMARY KEY,
	cliente_id INT 

);
/*7.-Inserta un pedido con id=1 en la tabla pedidos */
INSERT INTO public.pedidos_5 (id)
VALUES (1)

/*8.-Actualiza el cliente_id del pedido con id=1 a 2 en la tabla pedidos*/
UPDATE public.pedidos_5
SET cliente_id = 2
WHERE id = 1;

/*9.-Elimina el pedido con id=1 de la tabla pedidos */
DELETE FROM public.pedidos_5
WHERE id = 1;

/*10.-Lee todos los pedidos de la tabla pedidos */
SELECT * FROM public.pedidos_5

/*11.-Crea una tabla llamada 'productos' con las columnas id(entero) y nombre (cadena de texto) */
CREATE TABLE productos_5 (
	id INT PRIMARY KEY,
	nombre VARCHAR (255)
);

/*12.-Inserta un producto con id=1 y nombre 'Camisa' en la tabla 'productos' */
INSERT INTO public.productos_5 (id,nombre)
VALUES (1,'Camisa')

/*13.-Actualiza el nombre del producto con id=1 a 'Pantalon' en la tabla 'productos' */
UPDATE public.productos_5
SET nombre = 'Pantalon'
WHERE id=1

/*14.-Elimina el producto con id=1 de la tabla 'productos' */
DELETE FROM public.productos_5
WHERE id = 1;

/*15.-Lee todos los productos de la tabla 'productos'*/
SELECT * FROM public.productos_5

/*16.-Crea una tabla llamada 'DetallesPedido' con las columnas pedido_id(entero) y producto_id(entero) */
CREATE TABLE DetallesPedido (
	id SERIAL PRIMARY KEY,
	pedido_id INT,
	producto_id INT
);

/*17.-Inserta un detalle de pedido con pedido_id=1 y producto_id=1 en la tabla 'DetallesPedido' */
INSERT INTO public.detallespedido (pedido_id,producto_id)
VALUES (1,1)

/*18.-Actualiza el producto_id del detallepedido con pedido_id=1 a 2 en la tabla 'detallespedido'*/
UPDATE public.detallespedido
SET producto_id = 2
WHERE id=1

/*19.-Elimina el detalle de pedido con pedido_id=1 de la tabla 'detallespedido' */
DELETE FROM public.detallespedido
WHERE id = 1;

/*20.-Lee todos los detalles de pedido de la tabla 'detallespedido' */
SELECT * FROM public.detallespedido

/*21.-Realiza una consulta para obtener todos los clientes y sus pedidos correspondientes utilizando un INNER JOIN */
SELECT * FROM public.clientes_5 c
INNER JOIN public.pedidos_5 p
ON c.id = p.cliente_id

/*22.-Realiza un consulta para obtener todos los clientes y sus pedidos correspondientes utilizando un LEFT JOIN */
SELECT * FROM public.clientes_5 c
LEFT JOIN public.pedidos_5 p
ON c.id = p.cliente_id

/*23.-Realiza una consulta para obtener todos los productos y los detalles de pedido correspondientes utilizando un INNER JOIN */
SELECT * FROM public.productos_5 p
INNER JOIN public.detallespedido d
ON p.id = d.producto_id

/*24.-Realiza una consulta para obtener todos los productos y los detalles de pedido correspondientes utilizando un LEFT JOIN */
SELECT * FROM public.productos_5 p
LEFT JOIN public.detallespedido d
ON p.id = d.producto_id

/*25.-Crea una nueva columna llamada 'telefono' de tipo cadena de texto en la tabla 'clientes' */
ALTER TABLE public.clientes_5
ADD COLUMN telefono VARCHAR(255)

/*26.-Modifica la columna'telefono'en la tabla 'clientes' para cambiar su tipo de datos a entero */
ALTER TABLE public.clientes_5
ALTER COLUMN telefono TYPE INT USING (telefono::integer);

/*27.-Elimina la columna 'telefono' de la tabla 'clientes' */
ALTER TABLE public.clientes_5
DROP COLUMN telefono;

/*28.-Cambia el nombre de la tabla clientes a 'usuarios' */
ALTER TABLE clientes_5
RENAME TO usuarios_5;

/*29.-Cambia el nombre de la columna 'nombre' en la tabla 'usuarios' a 'nombre_completo' */
ALTER TABLE usuarios_5
RENAME COLUMN nombre TO nombre_completo;

/*30.-Agrega una restriccion de clave primaria a la columna 'id' en la tabla 'usuarios' */
ALTER TABLE usuarios_5
ADD CONSTRAINT PK_usuarios_id
PRIMARY KEY (id);













