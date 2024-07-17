USE sqldb;
CREATE VIEW v_usertbl
	AS SELECT userID, uName AS name, addr FROM usertbl;
SELECT * FROM v_usertbl;

CREATE VIEW v_userbuytbl
	AS SELECT U.userID, U.uName AS name, B.prodName, U.addr, U.mobile2 AS '연락처'
    FROM usertbl U
		INNER JOIN buytbl B
        ON U.userID = B.userID;
SELECT * FROM v_userbuytbl;

SHOW VARIABLES LIKE 'innodb_data_file_path';

CREATE TABLESPACE ts_a ADD DATAFILE 'ts_a.ibd';
CREATE TABLESPACE ts_b ADD DATAFILE 'ts_b.ibd';
CREATE TABLESPACE ts_c ADD DATAFILE 'ts_c.ibd';

CREATE TABLE table_c (SELECT * FROM employees.salaries);
ALTER TABLE table_c TABLESPACE ts_c;