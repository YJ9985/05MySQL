USE sqldb;

CREATE TABLE testTbl4(id INT, userName CHAR(4), age INT);
INSERT INTO testTbl4 VALUES(1, '홍길동', 25);
INSERT INTO testTbl4(id, userName) VALUES (2,'설현');
INSERT INTO testTbl4(username, age, id) VALUES('하나', 26, 3);

SELECT * FROM testtbl4;

-- auto increment: 자동으로 증가
USE sqldb;
CREATE TABLE testTbl2(
	id INT AUTO_INCREMENT PRIMARY KEY,
    userName CHAR(3),
    age INT
);

INSERT INTO testTbl2 VALUES (NULL, '지민', 25);
INSERT INTO testTbl2 VALUES (NULL, '유나', 22);
INSERT INTO testTbl2 VALUES (NULL, '예지', 26);
SELECT * FROM testTbl2;

-- 대량의 샘플 데이터 생성
USE sqldb;
CREATE TABLE testTbl3(id INT, Fname VARCHAR(50), Lname VARCHAR(50));
INSERT INTO testTbl3
	SELECT emp_no, first_name, last_name
    FROM employees.employees;
SELECT * FROM testTbl3;


-- 데이터 수정
UPDATE testTbl3
SET Lname = '없음'
WHERE Fname = 'Kyoichi';
SELECT * FROM testTbl3;

UPDATE buytbl
set price = price * 1.5;
SELECT * FROM buytbl;

-- 행 단위로 데이터 삭제
DELETE FROM testTbl3
WHERE Fname = 'Aamer' LIMIT 5;
SELECT * FROM testTbl3;