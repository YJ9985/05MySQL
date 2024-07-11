#첫 번째 장
SHOW DATABASES;
USE employees;
SHOW TABLES;
DESC employees;

#두 번째 장
SELECT * FROM employees.titles;
SELECT first_name FROM employees;
SELECT first_name, last_name, gender FROM employees;


#세 번째 장
SELECT first_name AS '이름', gender AS '성별', hire_date AS '회사 입사일' FROM employees; 

#네 번째 장
USE sqld;
SELECT * FROM userbl WHERE name = '김경호';
SELECT * FROM userbl WHERE birthyear >= 1970 and height >=182;

#다섯번째 장
SELECT * FROM userbl WHERE height >=180 and height <= 183;
SELECT * FROM userbl WHERE addr='경남' OR addr = '전남' OR addr = "경북";
SELECT * FROM userbl WHERE name LIKE '김%';

#여섯번째 장
SELECT name,height FROM userbl WHERE height > (SELECT height FROM userbl WHERE name = '김경호');

#일곱번째 장
SELECT * FROM userbl ORDER BY mdata ASC;
SELECT * FROM userbl ORDER BY mdata DESC;
SELECT * FROM userbl ORDER BY height DESC, name DESC; 

#여덟번째 장
SELECT DISTINCT addr FROM userbl ORDER BY addr ASC; 











