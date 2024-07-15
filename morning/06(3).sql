USE sqldb;

-- ORDER BY (ASC: 오름차순(생략가능), DESC: 내림차순)
SELECT name, mDATE FROM usertbl ORDER BY mDATE ASC;
SELECT name, addr FROM usertbl ORDER BY name DESC;
SELECT name, height FROM usertbl ORDER BY height DESC, name ASC;

-- 중복 제거
SELECT DISTINCT addr FROM usertbl;

-- LIMIT: 상위 N개만 출력
USE employees;
SELECT emp_no, hire_date FROM employees ORDER BY hire_date;
SELECT emp_no, hire_date FROM employees ORDER BY hire_date LIMIT 5;

-- LIMIT N,M: LIMIT 시작, 개수 = OFFSET M LIMIT N
SELECT emp_no, hire_date FROM employees ORDER BY hire_date DESC LIMIT 10,4;
SELECT emp_no, hire_date FROM employees ORDER BY hire_date LIMIT 4 OFFSET 10;

-- CREATE TABLE
USE sqldb;
CREATE TABLE buytbl2 (SELECT * FROM buytbl);
SELECT * FROM buytbl2;

CREATE TABLE buytbl3 (SELECT userID, prodName FROM buytbl);
SELECT * FROM buytbl3;

-- GROUP BY
SELECT * FROM buytbl;
SELECT userID, SUM(amount) FROM buytbl GROUP BY userID;

SELECT userID AS '이름', SUM(amount) AS '총 구매 개수' FROM buytbl GROUP BY userID;
SELECT userID AS '이름', SUM(amount*price) AS '총 구매가격' FROM buytbl GROUP BY userID;

-- 집계 함수
SELECT userID, AVG(amount) AS '평균 구매 갯수' FROM buytbl GROUP BY userID;

SELECT MAX(height), MIN(height) FROM usertbl;
SELECT name, MAX(height), MIN(height) FROM usertbl GROUP BY userID;

-- height가 usertbl 테이블에서 가장 큰 값과 같거나, 가장 작은 값과 같은 경우 모두 출력.
SELECT name, height FROM usertbl WHERE height = (SELECT MAX(height) FROM usertbl) OR height = (SELECT MIN(height) FROM usertbl);

SELECT * FROM usertbl;
SELECT COUNT(mobile1) AS '휴대폰이 있는 사용자' FROM usertbl;

-- HAVING: 집계 함수에 대해서 조건을 제한. HAVING 절은 꼭 GROUP BY 절 다음에 나와야 함
SELECT userID AS '사용자', SUM(amount*price) AS '총 구매액' FROM buytbl GROUP BY userID HAVING SUM(amount*price) >= 1200;

-- ROLL UP: 총합 또는 중간 합계가 필요할 경우 사용
SELECT num, groupName, SUM(price*amount) AS '비용' FROM buytbl GROUP BY groupName, num WITH ROLLUP;
SELECT groupName, SUM(price*amount) AS '비용' FROM buytbl GROUP BY groupName WITH ROLLUP;