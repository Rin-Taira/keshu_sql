CREATE VIEW v_receipt AS
SELECT order_no AS 伝票番号, s_name AS 店名, s_address AS 住所, s_tel AS 電話番号, r_date + r_time AS 売上日時, regi_no AS レジNo, resp_no AS 従業員No, p_name AS 商品名, price AS 商品単価, - discount AS 値引額, cast((rate - 1) * 100::double precision AS INTEGER) AS 消費税率, cast(price * (rate - 1)::double precision AS INTEGER) AS 消費税額 FROM (
    SELECT p_id, p_name, price, p.t_id, rate FROM product AS p
    JOIN tax AS t
    ON p.t_id = t.t_id
) AS im_p
JOIN (
    SELECT eat_in.eat_in_flag, eat_in_rate, d_id, r_id, p_id, piece, discount, pay_id, p_amount, pay_name, order_no, r_date, r_time, e_id, regi_no, s_id, resp_no, s_name, s_address, s_tel FROM eat_in 
    JOIN (
        SELECT d_id, r_de.r_id, p_id, piece, discount, eat_in_flag, pay_id, p_amount, pay_name, order_no, r_date, r_time, e_id, regi_no, s_id, resp_no, s_name, s_address, s_tel FROM rec_detail AS r_de
        JOIN (
                SELECT rp_py.r_id, pay_id, p_amount, pay_name, order_no, r_date, r_time, e_id, regi_no, s_id, resp_no, s_name, s_address, s_tel FROM (
                SELECT r_id, rp.pay_id, p_amount, pay_name FROM rec_pay AS rp
                JOIN payment AS py
                ON rp.pay_id = py.pay_id
                )AS rp_py
            JOIN (
                SELECT r_id, order_no, r_date, r_time, r.e_id, regi_no, s_id, resp_no, s_name, s_address, s_tel FROM receipt AS r
                JOIN (
                    SELECT e_id, e.s_id, resp_no, s_name, s_address, s_tel FROM employee AS e
                    JOIN shop AS s
                    ON e.s_id = s.s_id
                ) AS emp
                ON r.e_id = emp.e_id
            ) AS new_rp
            ON rp_py.r_id = new_rp.r_id
        ) AS im_r
    ON r_de.r_id = im_r.r_id
    ) AS im_re_de
    ON eat_in.eat_in_flag = im_re_de.eat_in_flag
) AS im_eat_in
ON im_p.p_id = im_eat_in.p_id;

SELECT * FROM v_receipt
WHERE 伝票番号 = '00000001';