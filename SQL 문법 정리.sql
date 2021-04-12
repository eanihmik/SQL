SHOW DATABASES;    # 어떤 데이터베이스가 있는가
USE world;    # 사용할 데이터베이스 선택
SHOW TABLES;    # 선택한 데이터베이스 안에 어떤 테이블이 있는가
SHOW TABLE STATUS;    # 테이블 설명 포함
DESCRIBE city;
DESC citylanguage;    # DECRIBE <-> DESC
SELECT COUNT(*) FROM city;    # 전체 행 수
/*
열 보기
*/
SELECT * FROM city;    # * = 모든 열
SELECT Name, Population FROM city;
/*
조건
*/
SELECT * FROM city
WHERE CountryCode = 'Kor'
AND Population >= 1000000;
SELECT * FROM city
WHERE Population BETWEEN 7000000 AND 8000000;
SELECT * FROM city
WHERE Name IN ('Seoul', 'New York', 'Tokyo');
/*
LIKE
*/
SELECT * FROM city
WHERE Name LIKE 'KO_';    # _ = 한 글자
SELECT * FROM city
WHERE Name LIKE 'K_';
SELECT * FROM city
WHERE Name LIKE 'Tel%';    # % = 뭐든
/*
이중 조건
*/
SELECT * FROM city
WHERE CountryCode = (
SELECT CountryCode FROM city
WHERE Name = 'Seoul');
# ANY, SOME, ALL
SELECT Population FROM city
WHERE District = 'New York';
SELECT * FROM city
WHERE Population > ANY(
SELECT Population FROM city
WHERE District = 'New York');    # ANY = 하나라도 참이면, ANY <-> SOME
SELECT * FROM city
WHERE Population > ALL(
SELECT Population FROM city
WHERE District = 'New York');    # ALL = 전부 참이여야
/*
ORDER BY
*/
SELECT * FROM city
ORDER BY Population;    # ASC 생략 가능
SELECT * FROM city
ORDER BY CountryCode ASC, Population DESC;
SELECT * FROM city
WHERE CountryCode = 'KOR'
ORDER BY Population DESC;
DESC Country;    # 이건 descending 아니고 describe임!!
SELECT * FROM Country
ORDER BY SurfaceArea DESC;
/*
중복 제거
*/
SELECT DISTINCT CountryCode FROM city;
/*
LIMIT
*/
SELECT * FROM city
ORDER BY Population DESC
LIMIT 20;
/*
GROUP BY
*/
SELECT CountryCode, MAX(Population) FROM city    # MAX, MIN, AVG
GROUP BY CountryCode;    # CountryCode별로 Population 최댓값
SELECT CountryCode, MAX(Population)
AS 'Average Population'    # 열 이름 예쁘게
FROM city
GROUP BY CountryCode;
/*
HAVING(GROUP BY 뒤에만 나오는 조건)
*/
SELECT CountryCode, Name, MAX(Population)
FROM city
GROUP BY CountryCode
HAVING MAX(Population) > 8000000;
/*
ROLL UP
*/
SELECT CountryCode, Name, SUM(Population)
FROM city
GROUP BY CountryCode, Name    # CountryCode, Name별 Population
WITH ROLLUP;    # CountryCode별 총 Population 중간집계도 띄워줌
/*
테이블 합치기
*/
SELECT * FROM CITY
JOIN country ON city.CountryCode = country.Code;    # city 테이블의 CountryCode와 country 테이블의 Code 값이 일치하면 같은 행으로 합쳐짐
SELECT * FROM CITY
JOIN country ON city.CountryCode = country.Code
JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode;    # 여러 개 JOIN도 가능
/*
문자열(SELECT 빼먹지 말기!!!)
*/
SELECT LENGTH('Naehi');    # 문자열 길이
SELECT LENGTH('내히');
SELECT CONCAT('MyS', 'QL', ' Open S', 'ource');    # 이어붙이기(띄어쓰기 없이)
SELECT CONCAT('MyS', 'QL', NULL, ' Open S', 'ource');    # NULL 하나라도 있으면 결과값 NULL
SELECT LOCATE('def', 'abcdefgh');    # 문자열 위치(맨 앞 0 아니고 1)
SELECT LEFT('MySQL is an open source relational database management system', 5),    # 맨 앞 5글자
RIGHT('MySQL is an open source relational database management system', 6);    # 맨 뒤 6글자
SELECT LOWER('MySQL is an open source relational database management system'),    # 전체 소문자로
UPPER('MySQL is an open source relational database management system');    # 전체 대문자로
SELECT REPLACE('MSSQL', 'MS', 'My');    # 문자열, 교체될 부분, 교체할 문자열
SELECT TRIM('#' FROM '###My#SQL####');    # 앞 뒤로 특정 문자 제거
SELECT TRIM('      MySQL     ');    # 지정 안해주면 공백 제거
SELECT TRIM(LEADING '#' FROM '###MySQL####');    # 앞에만 제거
SELECT TRIM(TRAILING '#' FROM '###MySQL####');    # 뒤에만 제거
SELECT FORMAT(1232123213.12323, 3);    # , 찍어주고 소수점 자리수(지정 안해주면 에러 남)
SELECT FLOOR(10.95), CEIL(10.95), ROUND(10.95);    # 버림, 올림, 반올림
SELECT FLOOR(10.45), CEIL(10.45), ROUND(10.45, 1);    # 소수점 자리 수는 반올림만 선택 가능
SELECT SQRT(4), POW(2, 3), EXP(1), LOG(2.718), SIN(PI()/2), COS(PI()), TAN(PI()/4), ABS(-1);    # math
SELECT RAND();    # [0, 1] 랜덤 값
SELECT ROUND(RAND()*100, 0);    # [0, 100] 정수 랜덤 값
/*
시간
*/
SELECT NOW(), CURDATE(), CURTIME();
SELECT DATE(NOW()), YEAR(NOW()), MONTH(NOW()), DAY(NOW()), HOUR(NOW()), MINUTE(NOW()), SECOND(NOW());
SELECT MONTHNAME(NOW()), DAYNAME(NOW());
SELECT DAYOFMONTH(NOW()), DAYOFWEEK(NOW()), DAYOFYEAR(NOW());
SELECT DATE_FORMAT(NOW(), '%D %y %a %d %m %M %j');    # 4th(Day) 21(year) Thu(a) 04(day) 03(month) March(Month) 63(j - day of year)
/*
만들기
*/
CREATE TABLE city2
AS SELECT * FROM city;    # world 데이터베이스에 city랑 똑같은 테이블 city2 생성
SHOW TABLES;
CREATE DATABASE naehi;    # 데이터베이스 생성
SHOW DATABASES;
USE naehi;
CREATE TABLE test(
id INT NOT NULL PRIMARY KEY,
col1 INT NULL,
col2 FLOAT NULL,
col3 VARCHAR(45) NULL);    # 직접 테이블 만들기(workbench 왼쪽 Tables에서 만들 수도 있음)
SHOW TABLE STATUS;
DESC test;
SELECT * FROM test;
/*
만든 테이블 수정
*/
ALTER TABLE test
ADD col4 INT NULL;    # 열 추가
DESC test;
ALTER TABLE test
MODIFY col4 VARCHAR(20) NULL;    # 열 변경
DESC test;
ALTER TABLE test
DROP col1;    # 열 삭제
DESC test;
/*
값 입력(workbench 결과값에서 넣어도 됨)
*/
SELECT * FROM test;
INSERT INTO test
VALUE(1, 1.1, 'TEST', '테스트');
SELECT * FROM test;
CREATE TABLE test2(
id INT NOT NULL PRIMARY KEY,
col1 FLOAT NULL,
col2 VARCHAR(45) NULL,
col3 VARCHAR(20) NULL);
INSERT INTO test2
SELECT * FROM test;    # test2에 test 값들 입력
SELECT * FROM test2;
UPDATE test
SET col2=1.0, col3='test' WHERE id=1;    # test 테이블 id=1인 행 값 수정
SELECT * FROM test;
DELETE FROM test WHERE id=1;
SELECT * FROM test;
TRUNCATE TABLE test2;    # 껍데기만 두고 값 다 삭제
SELECT * FROM test2;
DROP TABLE test;    # 테이블 자체 삭제
SHOW TABLES;
DROP DATABASE naehi;    # 데이터베이스 삭제
SHOW DATABASES;
/*
인덱스
*/
SHOW INDEX FROM test;    # Primary Key는 디폴트로 unique index 지정됨
CREATE INDEX Col1Idx ON test(col1);    # test테이블의 col1열에 인덱스 생성
SHOW INDEX FROM test;
CREATE UNIQUE INDEX Col1UIdx ON test(col1);
SHOW INDEX FROM test;
CREATE UNIQUE INDEX Col2Idx ON test(col2);
SHOW INDEX FROM test;
ALTER TABLE test
DROP INDEX Col2Idx;    # 인덱스 삭제
SHOW INDEX FROM test;
DROP INDEX Col1Idx ON test;    # ALTER TABLE 없이 인덱스 삭제
SHOW INDEX FROM test;
/*
뷰
*/
CREATE VIEW allView AS
SELECT city.Name, country.Name, countrylanguage.Language
FROM city
JOIN country ON city.CountryCode = country.Code
JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode
WHERE city.CountryCode = 'KOR';    # 세 개 테이블 합친 뒤에 한국 정보만 나타낸 뷰 생성
SELECT * FROM allView;