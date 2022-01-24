-- 한줄 주석
/*
 여러 줄 주석
 */
SELECT SYSDATE FROM DUAL; -- ctrl + enter 하면 실행

CREATE TABLE TEST( -- 테이블 생성
	STRDATA VARCHAR2(300),
	INTDATA NUMBER(4),
	FLOATDATA NUMBER(10,3),
	TIMEDATA DATE
); -- 만일 테이블을 밑에서 삭제하고 다시 만들고 싶으면 밑에다가 다시 복붙해서 만들 필요 없이 그냥 여기에다가 ctrl + enter 이거 해서 다시 만들면 된다.

-- 테이블 삭제
DROP TABLE TEST;

-- 테이블 수정

-- 컬럼 추가
ALTER TABLE TEST ADD(CHRDATA CHAR(1));
-- 컬럼 수정
ALTER TABLE TEST MODIFY(CHRDATA CHAR(3));
-- 컬럼 삭제
ALTER TABLE TEST DROP(CHRDATA);
-- 테이블명 변경
ALTER TABLE TEST RENAME TO TEST2;

CREATE TABLE TEST( -- 위에서 TEST를 TEST2 로 수정 해서 여기 TEST로 쓸 수있음
	PK VARCHAR2(300) PRIMARY KEY  -- 이렇게 하면 PRIMARY KEY 에 이름이 랜덤으로 생성되서 사용하기 어려움
);
-- 제약조건
DROP TABLE TEST;
CREATE TABLE TEST(
	PK VARCHAR2(300) CONSTRAINT TEST_PK PRIMARY KEY -- 이건 이름이 바뀌는데 가독성이 떨어짐
);
DROP TABLE TEST;
CREATE TABLE TEST(
	PK VARCHAR2(300), 
	CONSTRAINT TEST_PK PRIMARY KEY(PK) -- 컬럼은 컬럼대로 위에 쭉 적고 제약조건은 밑에 쭉 적어서 가독성이 올라감
);

-- 제약 조건을 이미 생성된 테이블에 추가하기
CREATE TABLE TEST(
	PK VARCHAR2(300)
);

ALTER TABLE TEST ADD CONSTRAINT TEST_PK
PRIMARY KEY(PK); -- 이렇게 엔터 해도 되고 안해도 된다. ; 전까지는 한줄로 인식

-- 생성되어 있는 테이블의 제약조건 삭제하기
ALTER TABLE TEST DROP CONSTRAINT TEST_PK;

-- 테이블에 있는 제약조건을 정지시키기(시작하기)
ALTER TABLE TEST DISABLE CONSTRAINT TEST_PK; -- 정지 시키기
ALTER TABLE TEST ENABLE CONSTRAINT TEST_PK; -- 시작 시키기

-- 컬럼명 변경
ALTER TABLE TEST RENAME COLUMN PK TO P_KEY;


-- 테이블 생성 실습
-- 자동차 테이블
CREATE TABLE CAR(
	BRAND VARCHAR2(300),
	PRICE NUMBER(9),
	COLOR VARCHAR2(300)
);
ALTER TABLE CAR MODIFY(PRICE NUMBER(10));
DROP TABLE CAR;
-- 책 테이블 ( 장르 도서명 저자 출판사 ISBN(테이블 수정으로 추가하기 , 제약조건까지 추가하기))
CREATE TABLE BOOK(
	JANG VARCHAR2(300),
	NAME VARCHAR2(300),
	AUTHOR VARCHAR2(300),
	COMPANY VARCHAR2(300)
);
ALTER TABLE BOOK ADD (ISBN NUMBER(4));
ALTER TABLE BOOK ADD CONSTRAINT KE PRIMARY KEY(ISBN);

-- 영화 테이블(영화번호, 제목, 감독, 배우, 장르)
CREATE TABLE MOVIE(
	MOVIENUM NUMBER(5),
	TITLE VARCHAR2(300),
	DIRECTOR VARCHAR2(300),
	ACTOR VARCHAR2(300),
	GENRE VARCHAR2(300),
	CONSTRAINT NUM_KEY PRIMARY KEY(MOVIENUM)
);

DROP TABLE MOVIE;









