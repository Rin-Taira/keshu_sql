-- 1.インデックスの作成
CREATE INDEX mn_index ON major(major_name);
CREATE INDEX sn_index ON student(student_name);
CREATE INDEX g_sn_index ON student(grade, student_name);

-- 2.ビューの作成
CREATE VIEW v_student AS
SELECT student_id, student_name, hometown, major_name
FROM student AS s
JOIN major AS m
ON s.major_id = m.major_id
WHERE hometown <> '東京'
ORDER BY major_name;

-- 3.マテリアライズド・ビュー
CREATE MATERIALIZED VIEW mv_student AS
SELECT * FROM v_student;

-- 4.ファンクション
CREATE OR REPLACE FUNCTION ic_amount(amount decimal) RETURNS decimal
LANGUAGE plpgsql
AS $function$
declare

begin
    return trunc(amount * 1.1, 0);
end;
$function$;

SELECT *, ic_amount(amount)
FROM sales;

-- 5.シーケンス
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

SELECT setval('users_id_seq', 100);