USE sqldb;
SELECT * FROM usertbl;

-- 기본적인 WHERE절: 원하는 데이터만 보고싶을 때
SELECT * FROM usertbl WHERE name = "김경호";

-- 관계 연산자 사용
SElECT userid, name FROM usertbl WHERE birthyear >= 1970 AND height >=182;
SELECT name, height FROM usertbl WHERE height BETWEEN 180 AND 1823;
SELECT name, addr FROM usertbl WHERE addr IN ('경남', '전남', '전북');
SELECT name, height FROM usertbl WHERE name LIKE '김%';

-- 서브쿼리: 쿼리문 안에 또 쿼리문이 들어있는 것 (1 = 2)
SELECT name , height FROM usertbl WHERE height > 177;
SELECT name, height FROM usertbl WHERE height > (SELECT height FROM usertbl WHERE name = '김경호');

-- 어느 하나 결과만 만족해도 가능 ('경남' 사용자 중 한 명이라도 만족하는 키 이상.)
SELECT name, height, addr FROM usertbl WHERE height >= ANY (SELECT height FROM usertbl where addr = '경남');

-- =ANY는 IN과 동일
SELECT name, height, addr FROM usertbl WHERE height = ANY (SELECT height FROM usertbl where addr = '경남');
SELECT name, height, addr FROM usertbl WHERE height IN (SELECT height FROM usertbl WHERE addr = '경남');

-- ALL 모두 만족 (주소가 '경남'인 모든 사용자들의 키보다 큰 키를 가진 모든 사용자들의 이름과 키.)
SELECT name, height FROM usertbl WHERE height > ALL (SELECT height FROM usertbl WHERE addr = '경남');