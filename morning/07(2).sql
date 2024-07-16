USE sqldb;
SELECT * FROM usertbl;
SELECT * FROM buytbl;

-- INNER JOIN: 두 테이블 간의 공통된 데이터만을 반환하는 조인 방식
SELECT *
	FROM buytbl
		INNER JOIN usertbl
			ON buytbl.userID = usertbl.userID
	WHERE buytbl.userID = 'JYP';
    
    -- LEFT OUTER JOIN: 왼쪽 테이블의 모든 행과 오른쪽 테이블의 일치하는 행을 반환
    USE sqldb;
    SELECT U.userID, U.name, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
		FROM usertbl U
			LEFT OUTER JOIN buytbl B
				ON U.userID = B.userID
			ORDER BY U.userID;
            
-- 3개 테이블 조인
USE sqldb;
CREATE TABLE stdtbl(
stdName VARCHAR(10) NOT NULL PRIMARY KEY,
addr CHAR(4) NOT NULL
);
SELECT * FROM stdtbl;

CREATE TABLE clubtbl(
clubName VARCHAR(10) NOT NULL PRIMARY KEY,
roomNo CHAR(4) NOT NULL
);
SELECT * FROM clubtbl;

CREATE TABLE stdclubtbl(
num int AUTO_INCREMENT NOT NULL PRIMARY KEY,
stdName VARCHAR(10) NOT NULL,
clubName VARCHAR(10) NOT NULL,
-- stdName 열이 stdtbl 테이블의 stdName 열을 참조하는 외래 키(foreign key)임을 나타냅니다.
-- 즉, stdclubtbl 테이블의 stdName 값은 stdtbl 테이블의 stdName 값과 일치해야 합니다.
FOREIGN KEY(stdName) REFERENCES stdtbl(stdName),
FOREIGN KEY(clubName) REFERENCES clubtbl(clubName)
);
SELECT * FROM stdclubtbl, stdtbl, clubtbl;

SELECT S.stdName, S.addr, SC.clubName, C.roomNo
	FROM stdtbl S
		INNER JOIN stdclubtbl SC
			ON S.stdName = SC.stdName
		INNER JOIN clubtbl C
			ON SC.clubName = C.clubName
	ORDER BY S.stdName;

SELECT C.clubName, C.roomNo, SC.stdName, S.addr
	FROM clubtbl C
		INNER JOIN stdclubtbl SC
			ON C.clubName = SC.clubName
		INNER JOIN stdtbl S
			ON SC.stdName = S.stdName
	ORDER BY C.clubName;
    
    -- CROSS JOIN:  employees 테이블의 행 수와 titles 테이블의 행 수를 곱한 만큼의 행이 결과 집합에 포함
    USE employees;
    SELECT COUNT(*) AS '데이터개수'
		FROM employees
			CROSS JOIN titles;