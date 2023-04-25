-- Creating tables

CREATE TABLE salesperson(
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100)
);

CREATE TABLE  car(
	carserial_id SERIAL PRIMARY KEY,
	make VARCHAR(150),
	model VARCHAR(150),
	_year INTEGER
);

CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(150),
	last_name VARCHAR(150)
);

CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(150),
	last_name VARCHAR(150)
);

CREATE TABLE parts(
	part_id SERIAL PRIMARY KEY,
	part_name VARCHAR(150)
);

CREATE TABLE service_ticket (
	serviceticket_id SERIAL PRIMARY KEY,
	customer_id INTEGER,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	carserial_id INTEGER,
	FOREIGN KEY(carserial_id) REFERENCES car(carserial_id),
	mechanic_id INTEGER,
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id),
	service_timestamp VARCHAR(150),
	service_type VARCHAR(150),
	part_id INTEGER,
	FOREIGN KEY(part_id) REFERENCES parts(part_id)
);

CREATE TABLE invoice(
	invoice_id SERIAL PRIMARY KEY,
	customer_id INTEGER,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	salesperson_id INTEGER,
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
	carserial_id INTEGER,
	FOREIGN KEY(carserial_id) REFERENCES car(carserial_id),
	serviceticket_id INTEGER,
	FOREIGN KEY(serviceticket_id) REFERENCES service_ticket(serviceticket_id),
	invoice_date_time VARCHAR(150)
);

-- Inserting data into tables for Austin buying a new car

INSERT INTO customer(customer_id, first_name, last_name)
VALUES(1, 'Austin', 'Aldrich');

INSERT INTO salesperson(salesperson_id, first_name, last_name)
VALUES(1, 'Jake', 'Cline');

INSERT INTO car(carserial_id, make, model, _year)
VALUES(1, 'Hyundai', 'Ioniq 5', 2023);

INSERT INTO invoice(invoice_id, customer_id, salesperson_id, carserial_id, serviceticket_id, invoice_date_time)
VALUES(1, 1, 1, 1, NULL, now());

-- Inserting data into tables for Scott bringing in his car for service

INSERT INTO customer(customer_id, first_name, last_name)
VALUES(2, 'Scott', 'Bell');

INSERT INTO car(carserial_id, make, model, _year)
VALUES(2, 'Nissan', 'Leaf', 2018);

INSERT INTO mechanic(mechanic_id, first_name, last_name)
VALUES(1, 'Connie', 'Speer');

INSERT INTO service_ticket(serviceticket_id, customer_id, carserial_id, mechanic_id, service_timestamp, part_id)
VALUES(1, 2, 2, 1, now(), NULL);

INSERT INTO invoice(invoice_id, customer_id, salesperson_id, carserial_id, serviceticket_id, invoice_date_time)
VALUES(2, 2, 1, 2, 1, now());