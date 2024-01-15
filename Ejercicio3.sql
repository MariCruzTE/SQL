/*1.- Crea una tabla llamada 'productos'con las columnas: 'id' (entero, clave primaria), 'nombre'(texto) y 'precio' (numérico)*/

ALTER TABLE productos
RENAME TO productos_a
______________________
CREATE TABLE productos (
	id INT PRIMARY KEY,
	nombre VARCHAR(255),
	precio INT
);

/*2.-Inserta al menos cinco registros en la tabla 'productos' */

INSERT INTO public.productos (id,nombre,precio)
VALUES (1,'Patatas',3), (2,'Jamón',6), (3,'Bacon',4), (4,'Detergente',7), (5,'Vino',10)

/*3.-Actualiza el precio de un producto en la tabla 'productos' */

UPDATE public.productos
SET precio = 6
WHERE id = 4

/*4.-Elimina un producto de la tabla 'productos' */

DELETE FROM public.productos
WHERE id = 5;

/*5.-Realiza una consulta que muestre los nombres de los usuarios junto con los nombres de los productos que han comprado ( utiliza un INNER JOIN con la tabla 'productos) */
CREATE TABLE compras (
	id SERIAL PRIMARY KEY,
	usuario_id INT NOT NULL,
	producto VARCHAR (255) NOT NULL,
	cantidad INT NOT NULL
);
_________________________
ALTER TABLE public.compras
ADD CONSTRAINT FK_usuario_id
FOREIGN KEY (usuario_id)
REFERENCES usuarios(id)
_________________________
INSERT INTO public.compras (usuario_id,producto,cantidad)
VALUES (3,'Patatas',3),(4,'Detergente',2),(4,'Bacon',1)
_________________________
SELECT
u.nombre as nombre,
c.producto as producto_comprado
FROM public.usuarios u
INNER JOIN public.compras c
ON u.id = c.usuario_id





