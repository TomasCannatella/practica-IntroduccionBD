## Consultas SQL Avanzadas
Resolver las siguientes consignas utilizando la base de datos movies_db.sql se solicita:
1. **Agregar una película a la tabla movies.**
    ```sql
    INSERT INTO movies ( title, rating, awards, release_date, `length`)
    VALUES ('Rapido y Furioso 2', 10, 5, '2003-05-30', 120);
    ```

2. **Agregar un género a la tabla genres.**
    ```sql
    INSERT INTO genres (`name`,ranking, active)
    VALUES ('Accion', 1, 1);
    ```

3. **Asociar a la película del punto 1. genre el género creado en el punto 2.**
    ```sql
    UPDATE movies
    SET genre_id = (SELECT g.id FROM genres g WHERE g.`name` = 'Accion')
    WHERE title = 'Rapido y Furioso 2';
    ```
4. **Modificar la tabla actors para que al menos un actor tenga como favorita la película agregada en el punto 1.**
    ```sql
    UPDATE actors
    SET favorite_movie_id = (SELECT id FROM movies WHERE title = 'Rapido y Furioso 2')
    WHERE id = 1;
    ```
5. **Crear una tabla temporal copia de la tabla movies.**
    ```sql
    CREATE TABLE movies_temp AS (SELECT * FROM movies);
    ```

6. **Eliminar de esa tabla temporal todas las películas que hayan ganado menos de 5 awards.**
    ```sql
    DELETE FROM movies_temp mt
    WHERE mt.awards < 5;
    ```

7. **Obtener la lista de todos los géneros que tengan al menos una película.**
    ```sql
    SELECT g.*
    FROM genres g
    INNER JOIN movies_temp m
    ON g.id = m.genre_id;
    ```

8. **Obtener la lista de actores cuya película favorita haya ganado más de 3 awards.**
    ```sql
    SELECT a.first_name, 
		   a.last_name
    FROM actors a
    WHERE favorite_movie_id IN (SELECT m.id 
                                FROM movies m 
                                WHERE m.awards > 3);
    ```
9. **Crear un índice sobre el nombre en la tabla movies.**
    ```sql
    ALTER TABLE movies ADD INDEX (title);
    ALTER TABLE movies_temp ADD INDEX (title);
    ```
10. **Chequee que el índice fue creado correctamente.**
    ```sql
    SHOW INDEX FROM movies;
    SHOW INDEX FROM movies_temp;
    ```

11. **En la base de datos movies ¿Existiría una mejora notable al crear índices? Analizar y justificar la respuesta.**
    No, porque la tabla movies es muy pequeña y no tiene muchos registros, por lo tanto no se vería una mejora notable al crear índices. 
    Pero en el caso de tener una tabla con muchos registros, si se vería una mejora notable al crear índices. Ya que al filtrar por algún campo,con indices, no recorrera todos los registros, sino que solo los que coincidan con el filtro.

12. **¿En qué otra tabla crearía un índice y por qué? Justificar la respuesta**
    En la tabla episodes, ya que contiene todos los episodios de las series y puede tener muchos registros.
    Entonces por ejemplo, si se crea un indice sobre el campo title, cuando se filtre por ese campo, no recorrera todos los registros y la consulta sera mas rapida.

### Diagrama DER de movies
![Diagrama DER de movies](https://lh7-us.googleusercontent.com/P3XXEVx8GdCS84oy0QJ_BMOSNTGi1x6-NSFpCcaum1Sbmn53qNeTOCVndhroXl874ORdQSLKKreset-gMzdbAFbOz5uJaQI7JAzSEe5tTLzwdVOm7BzhHmZnD0zzXfc_0qGmBPvnZUQSoazoa5G08w)
