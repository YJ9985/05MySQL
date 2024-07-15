USE sqldb;
SELECT * FROM buytbl;

-- cast, convert: 특정 데이터 타입으로 값을 변환
SELECT CAST(AVG(amount) AS SIGNED INTEGER) AS '평균 구매 개수' FROM buytbl;
SELECT CONVERT(AVG(amount), SIGNED INTEGER) AS '평균 구매 개수' FROM buytbl;

-- cast, convert 없이 형 변환
SELECT '100' + '200'; # 문자와 문자 더하기
SELECT CONCAT('100', '200'); #문자와 문자 연결
SELECT CONCAT (100, '200'); #정수와 문자 연결: 정수가 문자로 변환
SELECT 1 > '2mega'; # 정수 2로 변환되어 비교
SELECT 3 > '2MEGA';
SELECT 0 = 'mega2'; #문자 0으로 변환

SELECT IF (100>200, '참이다', '거짓이다');
SELECT CASE 3
	WHEN 1 THEN '일'
    WHEN 2 THEN '이'
    WHEN 3 THEN '삼'
END AS 'CASE연습';

SELECT ASCII('A'), CHAR(65);

-- CONCAT_WS: 구분자와 문자 이어줌
SELECT CONCAT('2025','/','01','/','01');
SELECT CONCAT_WS('/', '2025', '01', '01');

-- 문자열 함수
SELECT FORMAT(23411, 2);
SELECT BIN(3);
SELECT INSERT ('abcdefg', 3, 2, 12);
SELECT INSERT ('abcdefg', 3, 0, 12);
SELECT RIGHT ('abcdefg', 3), LEFT('abcdefg', 3);
SELECT UPPER('abcdefg'), LOWER('ABCDEFG');

-- 'ABCDE' 문자열을 길이 2만큼 왼쪽을 'FG' 문자열로 채우려고 시도
SELECT LPAD('ABCDE', 7, 'FG');
SELECT RPAD('ABC', 5, 'DE');

SELECT LTRIM('  SDF');
SELECT RTRIM('  S DW  ');
SELECT TRIM(BOTH 'A' FROM 'AADSDFAA');

SELECT REPLACE('이것이 MYSQL이다.', '이것이', 'THIS IS');
SELECT REVERSE('THIS IS MYSQL');

-- SUBSTRING('', 시작위치, 길이)
SELECT SUBSTRING('HELLO', 1, 2);
SELECT SUBSTRING('HELLO', 3 , 3);

-- 날짜 및 시간함수
SELECT ADDDATE('2024-06-19', 100);
SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();
SELECT SYSDATE();
SELECT YEAR(NOW()) AS current_year;
SELECT DATE(CURDATE()), TIME(CURTIME());