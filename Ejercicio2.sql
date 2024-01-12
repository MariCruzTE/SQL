/*1.- Crea una base de datos llamada'MiBaseDeDatos'

No aparece ninguna informacion al respecto en "Prework_introduccion a SQL", por lo que no se como realizarlo */

/*2.-Crea una tabla llamada 'usuarios' con las columnas : 'id' (entero, clave primaria), 'nombre' (texto), 'edad'(entero)*/

CREATE TABLE usuarios (
	id INT PRIMARY KEY,
	nombre VARCHAR(255),
	edad INT
);

/*3.-Inserta dos registros en la tabla 'usuarios' */

INSERT INTO usuarios (id,nombre,edad)
VALUES (1,'Sandra', 33),(2,'Nerea',24)


/*4.-Actualiza la edad de un usuario en la tabla 'usuarios' */

UPDATE public.usuarios
SET edad = 28
WHERE id = 1

/*5.-Elimina un usuario en la tabla 'usuarios' */

DELETE FROM public.usuarios
WHERE id = 1;







