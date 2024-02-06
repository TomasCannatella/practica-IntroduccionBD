## Consultas SQL Avanzadas
### Ejercicio

Teniendo las tablas de una base de datos de una empresa:

**EMPLEADO**
| cod_emp | nombre  | apellido   | puesto       | fecha_alta | salario | comision | depto_nro |
|---------|---------|------------|--------------|------------|---------|----------|-----------|
| E-0001  | César   | Piñero     | Vendedor     | 12/05/2018 | 80000   | 15000    | D-000-4   |
| E-0002  | Yosep   | Kowaleski  | Analista     | 14/07/2015 | 140000  | 0        | D-000-2   |
| E-0003  | Mariela | Barrios    | Director     | 05/06/2014 | 185000  | 0        | D-000-3   |
| E-0004  | Jonathan| Aguilera   | Vendedor     | 03/06/2015 | 85000   | 10000    | D-000-4   |
| E-0005  | Daniel  | Brezezicki | Vendedor     | 03/03/2018 | 83000   | 10000    | D-000-4   |
| E-0006  | Mito    | Barchuk    | Presidente   | 05/06/2014 | 190000  | 0        | D-000-3   |
| E-0007  | Emilio  | Galarza    | Desarrollador| 02/08/2014 | 60000   | 0        | D-000-1   |

**DEPARTAMENTO** 
| depto_nro | nombre_depto | localidad |
|-----------|--------------|-----------|
| D-000-1   | Software     | Los Tigres|
| D-000-2   | Sistemas     | Guadalupe |
| D-000-3   | Contabilidad | La Roca   |
| D-000-4   | Ventas       | Plata     |

1. **Mostrar el título y el nombre del género de todas las series.**
	```sql
    SELECT s.title,g.name
    FROM `series` as `s`
    JOIN `genres` as `g` ON `s`.genre_id = `g`.id;
    ```
2. **Mostrar el título de los episodios, el nombre y apellido de los actores que trabajan en cada uno de ellos.**
	```sql
    SELECT e.title, a.first_name,a.last_name
    FROM actors as a
    JOIN actor_episode as ae
    ON a.id = ae.actor_id
    JOIN episodes e
    ON e.id = ae.episode_id;
    ```
3. **Mostrar el título de todas las series y el total de temporadas que tiene cada una de ellas.**
	```sql
    SELECT series.title,count(seasons.id)
    FROM series
    JOIN seasons
    ON series.id = seasons.serie_id
    GROUP BY series.title;
    ```
4. **Mostrar el nombre de todos los géneros y la cantidad total de películas por cada uno, siempre que sea mayor o igual a 3.**
	```sql
    SELECT genres.name,count(movies.title) as `cantidad peliculas`
    FROM genres
    JOIN movies
    ON movies.genre_id = genres.id
    GROUP BY genres.name
    HAVING count(movies.title) >= 3;
    ```
5. **Mostrar sólo el nombre y apellido de los actores que trabajan en todas las películas de la guerra de las galaxias y que estos no se repitan.**
	```sql
    SELECT DISTINCT actors.first_name,actors.last_name
    FROM actors
    JOIN actor_movie
    ON actors.id = actor_movie.actor_id
    JOIN movies
    ON actor_movie.movie_id = movies.id
    WHERE movies.title LIKE 'La_Guerra_de_las_galaxias%'
    ```