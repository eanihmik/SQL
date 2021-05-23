# SQLD
5월 29일 SQLD 시험에 합격해봅시당 !

<details>
<summary> 2과목 2장.sql (CLICK) </summary>

**\[예제1] 다음 조건의 형태로 선수 테이블을 생성한다.** <br>
테이블명: PLAYER <br>
테이블 설명: K-리그 선수들의 정보를 가지고 있는 테이블 <br>
칼럼명
- PLAYER_ID(선수ID) 문자 고정 자릿수 7자리
- PLAYER_NAME(선수명) 문자 가변 자릿수 20자리
- TEAM_ID(팀ID) 문자 고정 자릿수 3자리
- E_PLAYER_NAME(영문선수명) 문자 가변 자릿수 40자리
- NICKNAME(선수별명) 문자 가변 자릿수 30자리
- JOIN_YYYY(입단년도) 문자 고정 자릿수 4자리
- POSITION(포지션) 문자 가변 자릿수 10자리
- BACK_NO(등번호) 숫자 2자리
- NATION(국적) 문자 가변 자릿수 20자리
- BIRTH_DATE(생년월일) 날짜
- SOLAR(양/음) 문자 고정 자릿수 1자리
- HEIGHT(신장) 숫자 3자리
- WEIGHT (몸무게) 숫자 3자리

제약조건
- 기본키(PRIMARY KEY) → PLAYER_ID(제약조건명은 PLAYER_ID_PK)
- 값이 반드시 존재(NOT NULL) → PLAYER_NAME, TEAM_ID

**\[예제2] 다음 조건의 형태로 팀 테이블을 생성한다.** <br>
테이블명: TEAM <br>
테이블 설명: K-리그 선수들의 소속팀에 대한 정보를 가지고 있는 테이블 <br>
칼럼명
- TEAM_ID(팀 고유 ID) 문자 고정 자릿수 3자리
- REGION_NAME(연고지 명) 문자 가변 자릿수 8자리
- TEAM_NAME(한글 팀 명) 문자 가변 자릿수 40자리
- E_TEAM_NAME(영문 팀 명) 문자 가변 자릿수 50자리
- ORIG_YYYY(창단년도) 문자 고정 자릿수 4자리
- STADIUM_ID(구장 고유 ID) 문자 고정 자릿수 3자리
- ZIP_CODE1(우편번호 앞 3자리) 문자 고정 자릿수 3자리
- ZIP_CODE2(우편번호 뒷 3자리) 문자 고정 자릿수 3자리
- ADDRESS(주소) 문자 가변 자릿수 80자리
- DDD(지역번호) 문자 가변 자릿수 3자리
- TEL(전화번호) 문자 가변 자릿수 10자리
- FAX (팩스번호) 문자 가변 자릿수 10자리
- HOMEPAGE(홈페이지) 문자 가변 자릿수 50자리
- OWNER(구단주) 문자 가변 자릿수 10자리

제약조건
- 기본 키(PRIMARY KEY) → TEAM_ID(제약조건명은 TEAM_ID_PK)
- NOT NULL → REGION_NAME, TEAM_NAME, STADIUM_ID(제약조건명은 미적용)

**\[예제3] 팀(TEAM) 테이블과 같은 내용으로 TEAM_TEMP라는 복사 테이블을 만들어 본다.**

**\[예제4] PLAYER 테이블에 ADDRESS(데이터 유형은 가변 문자로 자릿수 80자리로 설정한다.) 칼럼을 추가한다.**

**\[예제5] 앞에서 PLAYER 테이블에 새롭게 추가한 ADDRESS 칼럼을 삭제한다.**

**\[예제6] TEAM_TEMP 테이블의 ORIG_YYYY 칼럼의 데이터 유형을 CHAR(4) → VARCHAR2(8)으로 변경하고, 향후 입력되는 데이터의 DEFAULT 값으로 '20020129'을 적용하고, 모든 행의 ORIG_YYYY 칼럼에 NULL이 없으므로 제약조건을 NULL → NOT NULL로 변경한다.**

**\[예제7] TEAM_TEMP 테이블의 TEAM_ID 칼럼명을 다른 이름으로 변경하고, 다시 TEAM_ID 칼럼으로 변경한다.**

**\[예제8] PLAYER 테이블의 기본키 제약조건을 삭제한다.**

**\[예제9] PLAYER 테이블에 TEAM 테이블과의 외래키 제약조건을 추가한다. 제약조건명은 PLAYER_FK로 하고, PLAYER 테이블의 TEAM_ID 칼럼이 TEAM 테이블의 TEAM_ID를 참조하는 조건이다.**

**\[예제10] PLAYER 테이블이 참조하는 TEAM 테이블을 제거해본다.**

**\[예제11] RENAME 문장을 이용하여 TEAM 테이블명을 다른 이름으로 변경하고, 다시 TEAM 테이블로 변경한다.**

**\[예제12] PLAYER 테이블을 제거한다.**

**\[예제13] TRUNCATE TABLE을 사용하여 TEAM 테이블의 모든 행을 삭제하고 테이블 구조를 확인한다.**

</details>
