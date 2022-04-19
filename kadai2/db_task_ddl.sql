CREATE DATABASE kadai2;

CREATE TABLE shop (
    s_id INT PRIMARY KEY,
    s_name VARCHAR(30),
    s_address VARCHAR(100),
    s_tel VARCHAR(50)
);

CREATE TABLE employee (
    e_id INT PRIMARY KEY,
    s_id INT REFERENCES shop(s_id),
    resp_no VARCHAR(20)
);

CREATE TABLE tax (
    t_id INT PRIMARY KEY,
    rate INT
);

CREATE TABLE product (
    p_id INT PRIMARY KEY,
    p_name VARCHAR(100),
    price INT,
    t_id INT REFERENCES tax(t_id)
);

CREATE TABLE receipt (
    r_id INT PRIMARY KEY,
    order_no VARCHAR(30),
    r_date DATE,
    r_time TIME,
    e_id INT REFERENCES employee(e_id),
    regi_no INT
);

CREATE TABLE eat_in (
    eat_in_flag INT PRIMARY KEY,
    eat_in_rate INT
);

CREATE TABLE rec_detail (
    d_id INT PRIMARY KEY,
    r_id INT REFERENCES receipt(r_id),
    p_id INT REFERENCES product(p_id),
    piece INT,
    discount INT,
    eat_in_flag INT REFERENCES eat_in(eat_in_flag)
);

CREATE TABLE payment (
    pay_id INT PRIMARY KEY,
    pay_name VARCHAR(30)
);

CREATE TABLE rec_pay (
    r_id INT REFERENCES receipt(r_id),
    pay_id INT REFERENCES payment(pay_id),
    p_amount INT,
    PRIMARY KEY(r_id, pay_id)
);