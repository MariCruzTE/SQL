/* 1.- Crear una nueva tabla llamada "Clientes" con las columnas: id (entero, clave primaria), nombre (texto), y email (texto).*/

CREATE TABLE IF NOT EXISTS clientes (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL,
	email VARCHAR(255)
)

/* 2.- Insertar un nuevo cliente en la tabla "Clientes" on id=1, nombre"Juan" y email= juan@example.com */

INSERT INTO public.clientes (id,nombre, email)
VALUES (1,'Juan','juan@example.com')


/* 3.- Actualizar el email del cliente con id = 1 a 'juan@gmail.com' */

UPDATE public.clientes
SET email = 'juan@gmail.com'
WHERE id = 1;

/* 4.- Eliminar el cliente con id = 1 de la tabla 'Clientes' */

DELETE FROM public.clientes
WHERE id = 1 ;

/* 5.-Crear una tabla llamada 'pedidos' con las columnas id (entero, clave primaria), cliente_id (entero, clave externa referenciando a la tabla 'clientes'), producto (texto) y cantidad (entero) */

CREATE TABLE pedidos (
	id INT PRIMARY KEY,
	cliente_id INT NOT NULL,
	producto VARCHAR (255),
	cantidad INT,
	CONSTRAINT FK_cliente_id FOREIGN KEY (cliente_id) REFERENCES clientes(id)
)

/* 6.- Insertar un nuevo pedido en la tabla 'pedidos' con id=1, cliente_id=1, 'producto'='Camiseta'y cantidad=2 */

INSERT INTO public.pedidos(id, cliente_id, producto, cantidad)
VALUES (1,1,'Camiseta',2)

/* 7.- Actualizar la cantidad del pedido con id=1 a 3 */

UPDATE public.pedidos
SET cantidad=3
WHERE id=1;

/* 8.- Eliminar el pedido con id=1 de la tabla 'pedidos' */

DELETE FROM public.pedidos
WHERE id=1;

/* 9.- Crear una tabla llamada 'productos' con las columnas: id(entero, clave primaria), nombre (texto), y precio(decimal) */

CREATE TABLE productos (
	id INT PRIMARY KEY,
	nombre VARCHAR(255),
	precio FLOAT
)

/* 10.- Insertar varios productos en la tabla 'productos' con diferentes valores */

INSERT INTO public.productos(id,nombre, precio)
VALUES (1,'Bicicleta de equilibrio', 179.99),(2,'Moldea y pinta imanes',14.99), (3,'Estudio DJ portatil',34.99),(4,'Fashion Designer',34.94)

/* 11.- Consultar todos los clientes de la tabla 'clientes'*/

SELECT * FROM public.clientes

/* 12.- Consultar todos los pedidos de la tabla 'pedidos' junto con los nombres de los clientes correspondientes */

SELECT * FROM public.pedidos p
LEFT JOIN public.clientes c
ON c.id = p.cliente_id

/*13.- Consultar los productos de la tabla 'productos' cuyo precio sea mayor a 50 */

SELECT * FROM public.productos
WHERE precio > 50

/*14.- Consultar los pedidos de la tabla 'pedidos' que tengan una cantidad mayor o igual a 5*/

SELECT * FROM public.pedidos
WHERE cantidad >= 5

/*15.- Consultar los clientes de la tabla 'clientes' cuyo nombre empiece con la letra 'A'*/

SELECT * FROM public.clientes
WHERE nombre LIKE 'A%'

/* 16.- Realizar una consulta que muestre el nombre del cliente y el total de pedidos realizados por cada cliente */

SELECT
public.clientes.nombre ,
public.pedidos.cantidad 
FROM public.clientes, public.pedidos
WHERE public.clientes.id = public.pedidos.cliente_id

/*17.-Realizar una consulta que muestre el nombre del producto y la cantidad total de pedidos de este producto */

SELECT producto, cantidad FROM public.pedidos 

/*18.- Agregar una columna llamada 'fecha' a la tabla pedidos de tipo 'fecha'*/

ALTER TABLE public.pedidos
ADD COLUMN fecha DATE

/*19.- Agregar una clave externa a la tabla 'pedidos' que haga referencia a la tabla 'productos' en la columna 'producto' */

ALTER TABLE public.pedidos
ADD COLUMN producto_id INT 

ALTER TABLE public.pedidos
ADD CONSTRAINT FK_producto_id
foreign key (producto_id)
REFERENCES public.productos(id)

/*20.-Realizar una consulta qu muestre los nombres de los clientes, los nombres de los productos y las cantidades de los pedidos donde coincida la clave externa */

SELECT
public.clientes.nombre as nombre,
public.productos.nombre as producto,
public.pedidos.cantidad as cantidad
FROM public.clientes, public.productos, public.pedidos
WHERE public.clientes.id = public.pedidos.cliente_id AND public.productos.id = public.pedidos.producto_id
