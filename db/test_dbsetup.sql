CREATE DATABASE makersbnb_test;
\c makersbnb_test;
CREATE TABLE listings(id SERIAL PRIMARY KEY, property_name VARCHAR(50), price INT, description VARCHAR(500), user_id INT, start_date DATE, end_date DATE);


CREATE TABLE users(id SERIAL PRIMARY KEY, email VARCHAR(50), password VARCHAR(20), phone_num VARCHAR(20));
