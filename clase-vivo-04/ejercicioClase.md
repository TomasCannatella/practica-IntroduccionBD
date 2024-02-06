## Creación de Tablas Temporales e Índices
**Ejercicio 1** 
Con la base de datos “movies”, se propone crear una tabla temporal llamada “TWD” y guardar en la misma los episodios de todas las temporadas de “The Walking Dead”. Realizar una consulta a la tabla temporal para ver los episodios de la primera temporada.

```sql
CREATE TEMPORARY TABLE `TWD`(
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(30) NOT NULL,
    `number` INTEGER(1)  NOT NULL,
    `release_date` DATETIME NOT NULL,
    `rating` FLOAT NOT NULL,
    PRIMARY KEY(`id`)
);

INSERT INTO `TWD`
SELECT e.id,e.title,e.number,e.release_date,e.rating
FROM series se
INNER JOIN seasons ss ON ss.serie_id = se.id
INNER JOIN episodes e ON ss.id = e.season_id
WHERE se.title = 'The Walking Dead';
```
**Ejercicio 2**
En la base de datos “movies”, seleccionar una tabla donde crear un índice y luego chequear la creación del mismo. Analizar por qué crearía un índice en la tabla indicada y con qué criterio se elige/n el/los campos.
```sql
ALTER TABLE `TWD` ADD INDEX `title` (`title`);
```