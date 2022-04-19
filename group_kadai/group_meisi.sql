CREATE DATABASE group_kadai;

CREATE TABLE company (
    id INT PRIMARY KEY,
    c_name VARCHAR(50),
    c_url VARCHAR(50)
);

CREATE TABLE c_office (
    id INT PRIMARY KEY,
    c_id INT REFERENCES company(id),
    o_name VARCHAR(50),
    o_address VARCHAR(50),
    tel VARCHAR(50),
    fax VARCHAR(50),
);

CREATE TABLE roll (
    id INT PRIMARY KEY,
    roll VARCHAR(50)
);

CREATE TABLE employee (
    id INT PRIMARY KEY,
    e_name VARCHAR(50),
    o_id INT REFERENCES c_office(id),
    department VARCHAR(50),
    category VARCHAR(50),
    r_id INT REFERENCES roll(id),
    mail VARCHAR(50)
);

INSERT INTO company VALUES 
(1, 'T&Cテクノロジーズ株式会社', 'https://tc-tech.co.jp/'),
(2, 'TakiMotors', 'https://www.goo-net.com/usedcar_shop/0120169/detail.html');

INSERT INTO c_office VALUES
(1000, 1, '本社', '沖縄県那覇市銘苅2-3-1 メカルヨン_ゴ(那覇産業支援センター)411号室', '098-943-8270', '098-943-8290'),
(1001, 1, '松尾オフィス', '沖縄県那覇市松尾1-10-24 ホークシティ那覇ビル 5F', NULL, NULL),
(1002, 2, '販売店', '沖縄県中城村登又208-1', '098-895-3718', '098-895-3961'),
(1003, 2, '板金塗装工場', '沖縄県沖縄市中央2-27-16', '098-939-4835', NULL);

INSERT INTO roll VALUES
(1, '社長'),
(2, '専務'),
(3, '常務'),
(4, '本部長'),
(5, '部長'),
(6, '次長'),
(7, '課長'),
(8, '係長'),
(9, '主任'),
(10, '一般社員'),
(11, '店長');

INSERT INTO employee VALUES
(1, '岸本 啓佑', 1001, '開発部', 'システムエンジニア', 4, 'k.kishimoto@tc-tech.co.jp'),
(2, '滝 慎太郎', 1002, '総括', '自動車販売', 11, NULL);


