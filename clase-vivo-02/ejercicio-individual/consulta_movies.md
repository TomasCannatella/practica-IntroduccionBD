## Resolución

**Se propone realizar las siguientes consultas a la base de datos movies_db.sql.**

**Importar el archivo movies_db.sql desde PHPMyAdmin o MySQL Workbench y resolver las siguientes consultas:**

1. Mostrar todos los registros de la tabla de movies.
   ```sql
    SELECT *
    FROM movies;
   ```

2. Mostrar el nombre, apellido y rating de todos los actores.
    ```sql
    SELECT a.`first_name`,a.`last_name`,a.`rating`
    FROM actors as a;
    ```

3. Mostrar el título de todas las series y usar alias para que tanto el nombre de la tabla como el campo estén en español.
    ```sql
	SELECT series.`title` as Titulo
    FROM series as series;
    ```

4. Mostrar el nombre y apellido de los actores cuyo rating sea mayor a 7.5.
    ```sql
	SELECT a.`first_name`,a.`last_name`
    FROM actors a
    WHERE rating > 7.5;
    ```

5. Mostrar el título de las películas, el rating y los premios de las películas con un rating mayor a 7.5 y con más de dos premios.
    ```sql
	SELECT m.`title`,m.`rating`,m.`awards`
    FROM movies m
    WHERE `rating` > 7.5;
    ```

6. Mostrar el título de las películas y el rating ordenadas por rating en forma ascendente.
    ```sql
	SELECT m.`title`,m.`rating`
    FROM movies m
    ORDER BY m.`rating`;
    ```

7. Mostrar los títulos de las primeras tres películas en la base de datos.
    ```sql
	SELECT m.`title`
    FROM movies m
    LIMIT 3;
    ```

8. Mostrar el top 5 de las películas con mayor rating.
    ```sql
	SELECT m.`title`,m.`rating`
    FROM movies m
    ORDER BY m.rating desc
    LIMIT 5;
    ```

9. Listar los primeros 10 actores.
    ```sql
	SELECT a.`first_name`,a.`last_name`
    FROM actors a
    LIMIT 10;
    ```

10. Mostrar el título y rating de todas las películas cuyo título sea de Toy Story.
    ```sql
	SELECT m.`title`,m.`rating`
    FROM movies m
    WHERE m.`title` like 'Toy_Story%';
    ```

11. Mostrar a todos los actores cuyos nombres empiezan con Sam.
    ```sql
	SELECT a.`first_name`,a.`last_name`
    FROM actors a
    WHERE a.`first_name` LIKE 'Sam%';
    ```

12. Mostrar el título de las películas que salieron entre el 2004 y 2008.
    ```sql
	SELECT m.`title`,m.`release_date`
    FROM movies m
    WHERE m.`release_date` BETWEEN '2004-01-01' AND '2008-12-31';
    ```

13. Traer el título de las películas con el rating mayor a 3, con más de 1 premio y con fecha de lanzamiento entre el año 1988 al 2009. Ordenar los resultados por rating.
    ```sql 
	SELECT m.`title`,m.`rating`,m.`awards`,m.`release_date`
    FROM movies m
    WHERE m.`rating` > 3
    AND m.`awards` > 1
    AND m.`release_date` BETWEEN '1988-01-01' AND '2008-12-31'
    ORDER BY rating DESC; 
    ```