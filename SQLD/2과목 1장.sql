SHOW DATABASES;
CREATE DATABASE sqld_kleague;
USE sqld_kleague;
SHOW TABLE STATUS;

/*
[DDL]

테이블명은 문자로 시작
NULL 지정 안해주면 default는 NULL
같은 테이블 안에서는 칼럼명 다르게, 다른 테이블엔 같은 칼럼 ok
*/

# 예제1
CREATE TABLE PLAYER (
PLAYER_ID CHAR(7),
PLAYER_NAME VARCHAR(20) NOT NULL,    # column level constraint
TEAM_ID CHAR(3) NOT NULL,
E_PLAYER_NAME VARCHAR(40),
NICKNAME VARCHAR(30),
JOIN_YYYY CHAR(4),
POSITION VARCHAR(10),
BACK_NO INT,
NATION VARCHAR(20),
BIRTH_DATE DATETIME,
SOLAR CHAR(1),
HEIGHT FLOAT,
WEIGHT FLOAT,
CONSTRAINT PLAYER_ID_PK PRIMARY KEY (PLAYER_ID));    # table level constraint
DESC PLAYER;

# 예제2
CREATE TABLE TEAM (
TEAM_ID CHAR(3),
REGION_NAME VARCHAR(8) NOT NULL,
TEAM_NAME VARCHAR(40) NOT NULL,
E_TEAM_NAME VARCHAR(50),
ORIG_YYYY CHAR(4),
STADIUM_ID CHAR(3) NOT NULL,
ZIP_CODE1 CHAR(3),
ZIP_CODE2 CHAR(3),
ADDRESS VARCHAR(80),
DDD VARCHAR(3),
TEL VARCHAR(10),
FAX VARCHAR(10),
HOMEPAGE VARCHAR(50),
OWNER VARCHAR(10),
CONSTRAINT TEAM_ID_PK PRIMARY KEY (TEAM_ID));
DESC TEAM;

# 예제3
CREATE TABLE TEAM_TEMP AS
SELECT * FROM TEAM;
DESC TEAM_TEMP;    # PRIMARY KEY는 복사 안됨

# 예제4
ALTER TABLE PLAYER
ADD ADDRESS VARCHAR(80);
DESC PLAYER;

# 예제5
ALTER TABLE PLAYER
DROP ADDRESS;
DESC PLAYER;

# 예제6
DESC TEAM_TEMP;
ALTER TABLE TEAM_TEMP
MODIFY ORIG_YYYY VARCHAR(8) DEFAULT '20020129' NOT NULL;    # DEFAULT 지정돼 있어도 NULL YES로 나옴
DESC TEAM_TEMP;

# 예제7
ALTER TABLE TEAM_TEMP
RENAME COLUMN TEAM_ID TO ID;
DESC TEAM_TEMP;
ALTER TABLE TEAM_TEMP
RENAME COLUMN ID TO TEAM_ID;
DESC TEAM_TEMP;

# 예제8
DESC PLAYER;
ALTER TABLE PLAYER
DROP PRIMARY KEY;    # SQL Server, Oracle에서는 DROP CONSTRAINT PLAYER_ID_PK;
DESC PLAYER;

# 예제9
ALTER TABLE PLAYER
ADD CONSTRAINT PLAYER_FK FOREIGN KEY (TEAM_ID) REFERENCES TEAM(TEAM_ID);
DESC PLAYER;

# 예제10
DROP TABLE TEAM;    # 에러, TEAM 테이블의 데이터 역시 삭제 불가능

# 예제11
SHOW TABLE STATUS;
RENAME TABLE TEAM TO T;
SHOW TABLE STATUS;
RENAME TABLE T TO TEAM;
SHOW TABLE STATUS;

# 예제12
DROP TABLE PLAYER;    # Oracle: [CASCADE CONSTRAINT]
SHOW TABLE STATUS;

# 예제13
TRUNCATE TABLE TEAM;
DESC TEAM;    # 구조 그대로

/*
[DML]
*/

# 예제1











CREATE DATABASE sqld_excercises;
USE sqld_excercises;

#7
CREATE TABLE 기관분류 (
분류id VARCHAR(10) NOT NULL PRIMARY KEY,
분류명 VARCHAR(10) NOT NULL,
등록일자 VARCHAR(10) NULL);
DESC 기관분류;
ALTER TABLE 기관분류
MODIFY COLUMN 분류명 VARCHAR(30) NOT NULL;
ALTER TABLE 기관분류 
MODIFY COLUMN 등록일자 DATE NOT NULL;
