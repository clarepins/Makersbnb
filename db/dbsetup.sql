CREATE DATABASE makersbnb;
CREATE TABLE listings(id SERIAL PRIMARY KEY, name VARCHAR(500), price INT, description VARCHAR(500), owner_name VARCHAR(100), email VARCHAR(50), phone_num VARCHAR(20));


CREATE DATABASE makersbnb_test;
CREATE TABLE listings(id SERIAL PRIMARY KEY, name VARCHAR(500), price INT, description VARCHAR(500), owner_name VARCHAR(100), email VARCHAR(50), phone_num VARCHAR(20));
