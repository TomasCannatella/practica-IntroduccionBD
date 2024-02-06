#### Ejercicio 1
Luego del planteo de los requerimientos de la empresa, se solicita modelar los mismos mediante un DER (Diagrama Entidad-Relación).

#### Ejercicio 2 
Una vez modelada y planteada la base de datos, responder a las siguientes preguntas:
**a. ¿Cuál es la primary key para la tabla de clientes? Justificar respuesta**
En la tabla cliente el primary key en este caso puede ser el documento, ya que es un campo que su valor debe ser unico y no se puede repetir.
**b. ¿Cuál es la primary key para la tabla de planes de internet? Justificar respuesta.**
En la tabla planes de internet se decidio usar un Id para poder identificar el plan, ya que el id es un campo numerico autoincremental el cual no se repite

**c. ¿Cómo serían las relaciones entre tablas? ¿En qué tabla debería haber foreign key? ¿A qué campo de qué tabla hace referencia dicha foreign key? Justificar respuesta.**
En este caso las relaciones es de muchos a muchos, donde un cliente puede tener muchos planes de internet y un plan muchos clientes. En este caso las foreing key van en una tabla aparte que se llama ClientsPlans ya que la relacion es de muchos a muchos. Donde cada foreing key hace referencia al id correspondiente de cada tabla. 


#### Ejercicio 3

Una vez realizado el planteo del diagrama y de haber respondido estas preguntas, utilizar PHPMyAdmin o MySQL Workbench para ejecutar lo siguiente:

Se solicita crear una nueva base de datos llamada “empresa_internet”.
Incorporar 10 registros en la tabla de clientes y 5 en la tabla de planes de internet.
Realizar las asociaciones/relaciones correspondientes entre estos registros.

```sql
 -- CREATE TABLE CLIENTS IN MYSQL

CREATE TABLE clients (
    dni INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    province VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    PRIMARY KEY (dni)
    KEY (first_name, last_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE internet_plans(
    id INT NOT NULL,
    speed VARCHAR(50) NOT NULL,
    price FLOAT NOT NULL,
    PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE clients_internet_plans(
    client_dni INT NOT NULL,
    internet_plan_id INT NOT NULL,
    PRIMARY KEY (client_dni, internet_plan_id),
    FOREIGN KEY (client_dni) REFERENCES clients (dni),
    FOREIGN KEY (internet_plan_id) REFERENCES internet_plans (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

-- Create values for table clients
INSERT INTO clients (dni, first_name, last_name, date_of_birth, province, city)
VALUES (12345678, 'Juan', 'Perez', '1990-01-01', 'Buenos Aires', 'La Plata'

INSERT INTO clients (dni, first_name, last_name, date_of_birth, province, city)
VALUES (87654321, 'Maria', 'Gomez', '1990-01-01', 'Buenos Aires', 'La Plata')

INSERT INTO clients (dni, first_name, last_name, date_of_birth, province, city)
VALUES (12345679, 'Pedro', 'Gonzalez', '1990-01-01', 'Buenos Aires', 'Mar del Plata')

INSERT INTO clients (dni, first_name, last_name, date_of_birth, province, city)
VALUES (12345680, 'Jose', 'Rodriguez', '1990-01-01', 'Buenos Aires', 'Capital Federal')

INSERT INTO clients (dni, first_name, last_name, date_of_birth, province, city)
VALUES (12345681, 'Ana', 'Martinez', '1990-01-01', 'Buenos Aires', 'Mar del Plata')

INSERT INTO clients (dni, first_name, last_name, date_of_birth, province, city)
VALUES (12345682, 'Lucia', 'Sanchez', '1990-01-01', 'Buenos Aires', 'Moron')

INSERT INTO clients (dni, first_name, last_name, date_of_birth, province, city)
VALUES (12345683, 'Carlos', 'Fernandez', '1990-01-01', 'Mendoza', 'Mendoza')

INSERT INTO clients (dni, first_name, last_name, date_of_birth, province, city)
VALUES (12345684, 'Miguel', 'Lopez', '1990-01-01', 'Mendoza', 'Godoy Cruz')

INSERT INTO clients (dni, first_name, last_name, date_of_birth, province, city)
VALUES (12345685, 'Sofia', 'Gutierrez', '1990-01-01', 'Cordoba', 'La Falda')

INSERT INTO clients (dni, first_name, last_name, date_of_birth, province, city)
VALUES (12345686, 'Julieta', 'Diaz', '1990-01-01', 'Cordoba', 'Cordoba')

INSERT INTO clients (dni, first_name, last_name, date_of_birth, province, city)
VALUES (12345687, 'Matias', 'Moreno', '1990-01-01', 'Cordoba', 'Rio Cuarto')


-- Create values for table internet_plans
INSERT INTO internet_plans (id, speed, price)
VALUES (1, '50 Mbps', 500)

INSERT INTO internet_plans (id, speed, price)
VALUES (2, '100 Mbps', 1000)

INSERT INTO internet_plans (id, speed, price)
VALUES (3, '300 Mbps', 1500)

INSERT INTO internet_plans (id, speed, price)
VALUES (4, '500 Mbps', 2000)

INSERT INTO internet_plans (id, speed, price)
VALUES (5, '1000 Mbps', 2500)

-- Create values for table clients_internet_plans where each client has only one internet service
INSERT INTO clients_internet_plans (client_dni, internet_plan_id)
VALUES (12345678, 1)

INSERT INTO clients_internet_plans (client_dni, internet_plan_id)
VALUES (87654321, 2)

INSERT INTO clients_internet_plans (client_dni, internet_plan_id)
VALUES (12345679, 3)

INSERT INTO clients_internet_plans (client_dni, internet_plan_id)
VALUES (12345680, 4)

INSERT INTO clients_internet_plans (client_dni, internet_plan_id)
VALUES (12345681, 5)

INSERT INTO clients_internet_plans (client_dni, internet_plan_id)
VALUES (12345682, 1)

INSERT INTO clients_internet_plans (client_dni, internet_plan_id)
VALUES (12345683, 2)

INSERT INTO clients_internet_plans (client_dni, internet_plan_id)
VALUES (12345684, 3)

INSERT INTO clients_internet_plans (client_dni, internet_plan_id)
VALUES (12345685, 4)

INSERT INTO clients_internet_plans (client_dni, internet_plan_id)
VALUES (12345686, 5)
```

#### Ejercicio 4
Plantear 10 consultas SQL que se podrían realizar a la base de datos. Expresar las sentencias.

1. Obtener el nombre y apellido de todos los clientes.
```sql
SELECT first_name,last_name
FROM clients;
```
2. Obtener el nombre y apellido de todos los clientes que vivan en La Plata. 
```sql
SELECT first_name,last_name
FROM clients
WHERE city = 'La Plata';
```

3. Obtener el nombre y apellido de todos los clientes que vivan en La Plata y tengan más de 30 años. 
```sql
SELECT dni,first_name, last_name
FROM clients
WHERE city = 'La Plata' 
AND date_of_birth < (NOW() - INTERVAL 30 YEAR);
```

4. Obtener el nombre y apellido de todos los clientes que vivan en La Plata y tengan más de 30 años y su plan de internet sea de 100 Mbps.
```sql
SELECT c.first_name, c.last_name
FROM clients c
INNER JOIN clients_internet_plans cip ON c.dni = cip.client_dni
INNER JOIN internet_plans ip ON ip.id = cip.internet_plan_id 
WHERE c.city = 'La Plata'
AND c.date_of_birth < (NOW() - INTERVAL 30 YEAR)
AND ip.speed = '100 Mbps';
```

5. Obtener el nombre y apellido de todos los clientes que vivan en La Plata y tengan más de 30 años y su plan de internet sea de 100 Mbps o 300 Mbps.
```sql
SELECT c.first_name, c.last_name
FROM clients c
INNER JOIN clients_internet_plans cip ON c.dni = cip.client_dni
INNER JOIN internet_plans ip ON ip.id = cip.internet_plan_id 
WHERE c.city = 'La Plata'
AND c.date_of_birth < (NOW() - INTERVAL 30 YEAR)
AND ip.speed IN ('100 Mbps','300 Mbps');
```
6. Obtener el nombre y apellido de todos los clientes que vivan en La Plata y tengan más de 30 años y su plan de internet sea de 100 Mbps o 300 Mbps y su precio sea menor a $1.500.
```sql
SELECT c.first_name, c.last_name
FROM clients c
INNER JOIN clients_internet_plans cip ON c.dni = cip.client_dni
INNER JOIN internet_plans ip ON ip.id = cip.internet_plan_id 
WHERE c.city = 'La Plata'
AND c.date_of_birth < (NOW() - INTERVAL 30 YEAR)
AND ip.speed IN ('100 Mbps','300 Mbps')
AND ip.price < 1500;
```
7. Obtener el nombre y apellido de todos los clientes que vivan en La Plata y tengan más de 30 años y su plan de internet sea de 100 Mbps o 300 Mbps y su precio sea menor a $1.500 ordenados por nombre y apellido de forma ascendente.
```sql
SELECT c.first_name, c.last_name
FROM clients c
INNER JOIN clients_internet_plans cip ON c.dni = cip.client_dni
INNER JOIN internet_plans ip ON ip.id = cip.internet_plan_id 
WHERE c.city = 'La Plata'
AND c.date_of_birth < (NOW() - INTERVAL 30 YEAR)
AND ip.speed IN ('100 Mbps','300 Mbps')
AND ip.price < 1500
ORDER BY c.first_name,c.last_name;
```
8. Obtener el nombre y apellido de todos los clientes que vivan en La Plata y tengan más de 30 años y su plan de internet sea de 100 Mbps o 300 Mbps y su precio sea menor a $1.500 ordenados por nombre y apellido de forma ascendente y limitar la cantidad de resultados a 5.
```sql
SELECT c.first_name, c.last_name
FROM clients c
INNER JOIN clients_internet_plans cip ON c.dni = cip.client_dni
INNER JOIN internet_plans ip ON ip.id = cip.internet_plan_id 
WHERE c.city = 'La Plata'
AND c.date_of_birth < (NOW() - INTERVAL 30 YEAR)
AND ip.speed IN ('100 Mbps','300 Mbps')
AND ip.price < 1500
ORDER BY c.first_name,c.last_name
LIMIT 5;
```
9. Obtener el nombre y apellido de todos los clientes que vivan en La Plata y tengan más de 30 años y su plan de internet sea de 100 Mbps o 300 Mbps y su precio sea menor a $1.500 ordenados por nombre y apellido de forma ascendente y limitar la cantidad de resultados a 5 y empezar a mostrar los resultados desde el segundo.
```sql
SELECT c.first_name, c.last_name
FROM clients c
INNER JOIN clients_internet_plans cip ON c.dni = cip.client_dni
INNER JOIN internet_plans ip ON ip.id = cip.internet_plan_id 
WHERE c.city = 'La Plata'
AND c.date_of_birth < (NOW() - INTERVAL 30 YEAR)
AND ip.speed IN ('100 Mbps','300 Mbps')
AND ip.price < 1500
ORDER BY c.first_name,c.last_name
LIMIT 2,5;
```
10. Obtener el nombre y apellido de todos los clientes que vivan en Mendoza y tengan más de 30 años y su precio sea menor a $3.500 ordenados por nombre y apellido de forma ascendente.
```sql
SELECT c.first_name, c.last_name
FROM clients c
INNER JOIN clients_internet_plans cip ON c.dni = cip.client_dni
INNER JOIN internet_plans ip ON ip.id = cip.internet_plan_id 
WHERE c.province = 'Mendoza'
AND c.date_of_birth < (NOW() - INTERVAL 30 YEAR)
AND ip.price < 3500
ORDER BY c.first_name,c.last_name;
```