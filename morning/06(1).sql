-- 사용할 데이터베이스 지정
USE employees;

-- titles 선택
SELECT * FROM titles;
SELECT * FROM employees.titles;

-- employees에서 열 가져오기
SELECT first_name FROM employees;
SELECT first_name, birth_date, emp_no FROM employees;

-- 주석 작성하기
/*주석
작성
하기*/

-- 현재 서버에 어떤 DB/TABLE 있는지
SHOW databases;
SHOW tables;

-- TABLE의 열 확인
DESC employees;
DESCRIBE employees;

-- 열 이름 변경
SELECT first_name AS 이름 FROM employees;
