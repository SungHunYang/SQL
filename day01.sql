-- ���� �ּ�
/*
 ���� �� �ּ�
 */
SELECT SYSDATE FROM DUAL; -- ctrl + enter �ϸ� ����

CREATE TABLE TEST( -- ���̺� ����
	STRDATA VARCHAR2(300),
	INTDATA NUMBER(4),
	FLOATDATA NUMBER(10,3),
	TIMEDATA DATE
); -- ���� ���̺��� �ؿ��� �����ϰ� �ٽ� ����� ������ �ؿ��ٰ� �ٽ� �����ؼ� ���� �ʿ� ���� �׳� ���⿡�ٰ� ctrl + enter �̰� �ؼ� �ٽ� ����� �ȴ�.

-- ���̺� ����
DROP TABLE TEST;

-- ���̺� ����

-- �÷� �߰�
ALTER TABLE TEST ADD(CHRDATA CHAR(1));
-- �÷� ����
ALTER TABLE TEST MODIFY(CHRDATA CHAR(3));
-- �÷� ����
ALTER TABLE TEST DROP(CHRDATA);
-- ���̺�� ����
ALTER TABLE TEST RENAME TO TEST2;

CREATE TABLE TEST( -- ������ TEST�� TEST2 �� ���� �ؼ� ���� TEST�� �� ������
	PK VARCHAR2(300) PRIMARY KEY  -- �̷��� �ϸ� PRIMARY KEY �� �̸��� �������� �����Ǽ� ����ϱ� �����
);
-- ��������
DROP TABLE TEST;
CREATE TABLE TEST(
	PK VARCHAR2(300) CONSTRAINT TEST_PK PRIMARY KEY -- �̰� �̸��� �ٲ�µ� �������� ������
);
DROP TABLE TEST;
CREATE TABLE TEST(
	PK VARCHAR2(300), 
	CONSTRAINT TEST_PK PRIMARY KEY(PK) -- �÷��� �÷���� ���� �� ���� ���������� �ؿ� �� ��� �������� �ö�
);

-- ���� ������ �̹� ������ ���̺� �߰��ϱ�
CREATE TABLE TEST(
	PK VARCHAR2(300)
);

ALTER TABLE TEST ADD CONSTRAINT TEST_PK
PRIMARY KEY(PK); -- �̷��� ���� �ص� �ǰ� ���ص� �ȴ�. ; �������� ���ٷ� �ν�

-- �����Ǿ� �ִ� ���̺��� �������� �����ϱ�
ALTER TABLE TEST DROP CONSTRAINT TEST_PK;

-- ���̺� �ִ� ���������� ������Ű��(�����ϱ�)
ALTER TABLE TEST DISABLE CONSTRAINT TEST_PK; -- ���� ��Ű��
ALTER TABLE TEST ENABLE CONSTRAINT TEST_PK; -- ���� ��Ű��

-- �÷��� ����
ALTER TABLE TEST RENAME COLUMN PK TO P_KEY;


-- ���̺� ���� �ǽ�
-- �ڵ��� ���̺�
CREATE TABLE CAR(
	BRAND VARCHAR2(300),
	PRICE NUMBER(9),
	COLOR VARCHAR2(300)
);
ALTER TABLE CAR MODIFY(PRICE NUMBER(10));
DROP TABLE CAR;
-- å ���̺� ( �帣 ������ ���� ���ǻ� ISBN(���̺� �������� �߰��ϱ� , �������Ǳ��� �߰��ϱ�))
CREATE TABLE BOOK(
	JANG VARCHAR2(300),
	NAME VARCHAR2(300),
	AUTHOR VARCHAR2(300),
	COMPANY VARCHAR2(300)
);
ALTER TABLE BOOK ADD (ISBN NUMBER(4));
ALTER TABLE BOOK ADD CONSTRAINT KE PRIMARY KEY(ISBN);

-- ��ȭ ���̺�(��ȭ��ȣ, ����, ����, ���, �帣)
CREATE TABLE MOVIE(
	MOVIENUM NUMBER(5),
	TITLE VARCHAR2(300),
	DIRECTOR VARCHAR2(300),
	ACTOR VARCHAR2(300),
	GENRE VARCHAR2(300),
	CONSTRAINT NUM_KEY PRIMARY KEY(MOVIENUM)
);

DROP TABLE MOVIE;









