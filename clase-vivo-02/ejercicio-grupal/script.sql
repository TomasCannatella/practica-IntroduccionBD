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
VALUES (12345678, 'Juan', 'Perez', '1990-01-01', 'Buenos Aires', 'La Plata');

INSERT INTO clients (dni, first_name, last_name, date_of_birth, province, city)
VALUES (87654321, 'Maria', 'Gomez', '1990-01-01', 'Buenos Aires', 'La Plata');

INSERT INTO clients (dni, first_name, last_name, date_of_birth, province, city)
VALUES (12345679, 'Pedro', 'Gonzalez', '1990-01-01', 'Buenos Aires', 'Mar del Plata');

INSERT INTO clients (dni, first_name, last_name, date_of_birth, province, city)
VALUES (12345680, 'Jose', 'Rodriguez', '1990-01-01', 'Buenos Aires', 'Capital Federal');

INSERT INTO clients (dni, first_name, last_name, date_of_birth, province, city)
VALUES (12345681, 'Ana', 'Martinez', '1990-01-01', 'Buenos Aires', 'Mar del Plata');

INSERT INTO clients (dni, first_name, last_name, date_of_birth, province, city)
VALUES (12345682, 'Lucia', 'Sanchez', '1990-01-01', 'Buenos Aires', 'Moron');

INSERT INTO clients (dni, first_name, last_name, date_of_birth, province, city)
VALUES (12345683, 'Carlos', 'Fernandez', '1990-01-01', 'Mendoza', 'Mendoza');

INSERT INTO clients (dni, first_name, last_name, date_of_birth, province, city)
VALUES (12345684, 'Miguel', 'Lopez', '1990-01-01', 'Mendoza', 'Godoy Cruz');

INSERT INTO clients (dni, first_name, last_name, date_of_birth, province, city)
VALUES (12345685, 'Sofia', 'Gutierrez', '1990-01-01', 'Cordoba', 'La Falda');

INSERT INTO clients (dni, first_name, last_name, date_of_birth, province, city)
VALUES (12345686, 'Julieta', 'Diaz', '1990-01-01', 'Cordoba', 'Cordoba');

INSERT INTO clients (dni, first_name, last_name, date_of_birth, province, city)
VALUES (12345687, 'Matias', 'Moreno', '1990-01-01', 'Cordoba', 'Rio Cuarto');


-- Create values for table internet_plans;
INSERT INTO internet_plans (id, speed, price)
VALUES (1, '50 Mbps', 500);

INSERT INTO internet_plans (id, speed, price)
VALUES (2, '100 Mbps', 1000);

INSERT INTO internet_plans (id, speed, price)
VALUES (3, '300 Mbps', 1500);

INSERT INTO internet_plans (id, speed, price)
VALUES (4, '500 Mbps', 2000);

INSERT INTO internet_plans (id, speed, price)
VALUES (5, '1000 Mbps', 2500);

-- Create values for table clients_internet_plans where each client has only one internet service;
INSERT INTO clients_internet_plans (client_dni, internet_plan_id)
VALUES (12345678, 1);

INSERT INTO clients_internet_plans (client_dni, internet_plan_id)
VALUES (87654321, 2);

INSERT INTO clients_internet_plans (client_dni, internet_plan_id)
VALUES (12345679, 3);

INSERT INTO clients_internet_plans (client_dni, internet_plan_id)
VALUES (12345680, 4);

INSERT INTO clients_internet_plans (client_dni, internet_plan_id)
VALUES (12345681, 5);

INSERT INTO clients_internet_plans (client_dni, internet_plan_id)
VALUES (12345682, 1);

INSERT INTO clients_internet_plans (client_dni, internet_plan_id)
VALUES (12345683, 2);

INSERT INTO clients_internet_plans (client_dni, internet_plan_id)
VALUES (12345684, 3);

INSERT INTO clients_internet_plans (client_dni, internet_plan_id)
VALUES (12345685, 4);

INSERT INTO clients_internet_plans (client_dni, internet_plan_id)
VALUES (12345686, 5);

-- Obtener el nombre y apellido de todos los clientes que vivan en La Plata y tengan más de 30 años.
SELECT first_name, last_name
FROM clients
WHERE city = 'La Plata' AND date_of_birth < (NOW() - INTERVAL 30 YEAR);

