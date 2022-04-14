-- 1.CREATE
CREATE TABLE sales_old (
    sales_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT NOT NULL REFERENCES customer(customer_id),
    amount DECIMAL
);

-- 2.INSERT
INSERT INTO sales_old VALUES
(6, '2018/09/02', 2, 20000),
(7, '2018/09/02', 1, 5000),
(8, '2018/09/02', 3, 6000),
(9, '2018/09/05', 1, 3000);

-- 3.INSERT、SELECT
INSERT INTO sales
SELECT * FROM sales_old;

-- 4.DROP
DROP TABLE sales_old;

-- 5.CASE WHEN、別名
SELECT sales_id, order_date,
(CASE WHEN order_date < '2018/10/01' THEN '○'
ELSE '' END) AS is_old
FROM sales
ORDER BY order_date;

-- 6.文字列結合、別名
SELECT customer_id || ':' || customer_name AS customer_id_name
FROM customer
ORDER BY customer_id;

-- 7.LIMIT
SELECT * FROM sales
WHERE customer_id = 1
ORDER BY order_date DESC LIMIT 2;

-- 8.GROUP BY、MIN、SUM、サブクエリ、別名
SELECT order_date, sum(amount) AS sum_amount FROM sales
WHERE order_date = (
    SELECT min(order_date) FROM sales
)
GROUP BY order_date;

-- 9.GROUP BY、JOIN、AVG、TRUNC、別名
SELECT s.customer_id, customer_name, TRUNC(avg(amount)) AS avg_amount
FROM sales AS s
JOIN customer AS c
ON s.customer_id = c.customer_id
GROUP BY s.customer_id, customer_name
ORDER BY s.customer_id;

-- 10.BETWEEN、LIMIT、サブクエリ
SELECT * FROM sales
WHERE sales_id = (
    SELECT sales_id FROM sales
    WHERE order_date BETWEEN '2018/09/01' AND '2018/09/30'
    ORDER BY amount DESC LIMIT 1
);
