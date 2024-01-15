/*1.-Crea una tabla 'pedidos' con las columnas : id (entero, clave primaria), 'id_usuario'(entero, clave foranea de la tabla 'usuarios') y 'id_producto' (entero, clave foranea de la tabla 'productos') */
ALTER TABLE pedidos
RENAME TO pedidos_a
__________________________
CREATE TABLE PEDIDOS (
	id INT PRIMARY KEY,
	id_usuario INT NOT NULL,
	id_producto INT NOT NULL
	
)__________________________
ALTER TABLE public.pedidos
ADD CONSTRAINT FK_id_usuario
FOREIGN KEY (id_usuario)
REFERENCES public.usuarios(id)
__________________________
ALTER TABLE public.pedidos
ADD CONSTRAINT fk_id_producto
FOREIGN KEY (id_producto)
REFERENCES public.productos(id)

/*2.-Inserta al menos tres registros en la tabla 'pedidos' que relacionen usuarios con productos. */

INSERT INTO public.pedidos (id,id_usuario,id_producto)
VALUES (1,2,2),(2,2,3),(3,2,4),(4,3,2), (5,4,1),(6,4,4)

/*3.-Realiza una consulta que muestre los nombres de los usuarios y los nombres de los productos que han comprado, incluidos aquellos que no han realizado ningun pedido (utiliza LEFT JOIN y COALESCE). */

SELECT DISTINCT
u.nombre as nombre,
COALESCE (p.nombre,'0') as producto_comprado
FROM public.usuarios u
LEFT JOIN public.pedidos c
ON u.id = c.id_usuario
LEFT JOIN public.productos p
ON p.id = c.id_producto

/*4.-Realiza una consulta que muestre los nombres de los usuarios que han realizado un pedido, pero tambien los que no han realizado ningún pedido (utiliza LEFT JOIN). */

SELECT
u.nombre as nombre,
COUNT (P.id) as pedidos_realizados
FROM public.usuarios u
LEFT JOIN public.pedidos p
ON u.id = p.id_usuario
GROUP BY u.nombre

/*5.-Agrega una nueva columna llamada 'cantidad' a la tabla 'pedidos' y actualiza los registros existentes con un valor (utiliza  ALTER TABLE y UPDATE)*/

ALTER TABLE public.pedidos
ADD COLUMN cantidad INT
__________________________
UPDATE public.pedidos
SET cantidad = 2
WHERE id = 1
__________________________
UPDATE public.pedidos
SET cantidad = 3
WHERE id = 2
__________________________
UPDATE public.pedidos
SET cantidad = 1
WHERE id = 5
__________________________
UPDATE public.pedidos
SET cantidad = 3
WHERE id = 6
__________________________
ALTER TABLE public.pedidos
ALTER COLUMN cantidad SET NOT NULL






