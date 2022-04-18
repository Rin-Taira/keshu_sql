CREATE DATABASE book_info;

CREATE TABLE company(
    id INT PRIMARY KEY,
    c_name VARCHAR(50)
);

CREATE TABLE author(
    id INT PRIMARY KEY,
    a_name VARCHAR(50)
);

CREATE TABLE book(
    b_id INT PRIMARY KEY,
    b_name VARCHAR(50),
    c_id INT REFERENCES company(id),
    price INT,
    sale_date DATE,
    a_id INT REFERENCES author(id)
);