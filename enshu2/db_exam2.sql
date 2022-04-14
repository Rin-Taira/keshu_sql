-- 1.AND条件、並べ替え
SELECT * FROM student
WHERE grade = 1 AND hometown = '東京'
ORDER BY student_id;

-- 2.OR条件、LIKE条件、並べ替え
SELECT * FROM student
WHERE grade = 1 OR student_name LIKE '%本'
ORDER BY student_id DESC;

-- 3.GROUP_BY、MAX
SELECT major_id, max(grade) FROM student
GROUP BY major_id
ORDER BY major_id;

-- 4.GROUP_BY、COUNT、HAVING
SELECT hometown, count(hometown) FROM student
GROUP BY hometown
HAVING count(hometown) >= 2
ORDER BY hometown;

-- 5.JOIN、並べ替え
SELECT s.student_name, m.major_name
FROM student AS s
JOIN major AS m
ON s.major_id = m.major_id
ORDER BY major_name, student_name;

-- 6.JOIN、条件指定、並べ替え
SELECT s.student_id, s.student_name, s.hometown, m.major_name
FROM student AS s
JOIN major AS m
ON s.major_id = m.major_id
WHERE hometown <> '東京'
ORDER BY major_name, student_id;

-- 7.サブクエリ-その1
SELECT student_id, student_name, grade
FROM student
WHERE major_id IN (
    SELECT major_id
    FROM major
    WHERE major_name = '英文学'
)
ORDER BY student_id;

-- 8.サブクエリ-その2 IN
SELECT student_id, student_name, major_id
FROM student
WHERE major_id IN (
    SELECT major_id
    FROM student
    GROUP BY major_id
    HAVING count(*) > 2
)
ORDER BY major_id, student_id;