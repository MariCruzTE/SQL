/*1.- Crea una tabla llamada 'ciudades' con las columnas: 'id'(entero, clave primaria), 'nombre' (texto), 'pais'(texto)  */

CREATE TABLE ciudades (
	id INT PRIMARY KEY,
	nombre VARCHAR (255),
	pais VARCHAR (255)

);

/*2.- Inserta al menos tres registros en la tabla 'ciudades' */

INSERT INTO public.ciudades (id,nombre,pais)
VALUES (1,'Viseu','Portugal'),(2,'Vercelli','Italia'),(3,'Salamanca','España'),(4,'Medellin','Colombia'),(5,'Monterrey','Mexico')

/*3.-Crea una foreign key en la tabla 'usuarios' que se relacione con la colunma 'id' de la tabla ciudades */

ALTER TABLE public.usuarios
ADD CONSTRAINT FK_ciudad_id
FOREIGN KEY (ciudad_id)
REFERENCES public.ciudades(id)

/*4.-Realiza una consulta que muestre los nombres de los usuarios junto con el nombre de su ciudad y pais (utiliza LEFT JOIN) */
SELECT
u.nombre as nombre,
c.nombre as ciudad,
c.pais as pais
FROM public.usuarios u 
LEFT JOIN public.ciudades c
ON c.id = u.ciudad_id



/*5.-Realiza una consulta que muestre sólo los usuarios que tienen una ciudad asociada ( utiliza INNER JOIN) */
SELECT
u.nombre as nombre,
c.nombre as ciudad
FROM public.usuarios u 
INNER JOIN public.ciudades c
ON c.id = u.ciudad_id
