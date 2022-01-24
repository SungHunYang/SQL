-- FOREIGN KEY
CREATE TABLE A(
	NUM NUMBER(5) PRIMARY KEY,
	SDATA VARCHAR2(300)
); -- �θ����̺�
DROP TABLE A;
CREATE TABLE B(
	DATA1 VARCHAR2(300),
	DATA2 VARCHAR2(300),
	NUM NUMBER(5),
	CONSTRAINT FK_TEST FOREIGN KEY(NUM) REFERENCES A(NUM)
	--			        �ڱ� ���̺�NUM        ���� ���̺� NUM
	--    			����  PRIMARY KEY��  FOREIGN KEY�� �ȴ� 
	--				�ֳĸ�  FOREIGN KEYŰ�� ��� ���̺� �ϳ��� �־�� �ϱ�(�ߺ��� ���� �ʾƾ�) �����̴�.
); -- �ڽ� ���̺�
DROP TABLE B;

--- ������û �ǽ�
--
CREATE TABLE STUDENT( -- �л��� ���� ������ ��� ����
-- NUM �� JUMIN�� ���� ū ���̴� JUMIN�� ���� ������� �ٸ��� �ο��Ǿ��ִ°Ŷ� ���� ���� ������ ������ �ʰ� ������ �Ǵ°Ŵ�. 
-- �׷��� NUM�� ����� �� �ִ°� �ƴ϶� �л����� �����ϱ� ���� �������� �־� ���� �ű� ������ Ư���ϰ� �⺻Ű���� �ϴ� ���̴�. �ǹ� ���� �������.
	NUM NUMBER(4) PRIMARY KEY ,
	JUMIN CHAR(13) UNIQUE , -- ����ũ�� �⺻Ű�� �ٸ��� �Ǽ��� ���� �ʵ��� �Ŵ� ����
	NAME VARCHAR2(100) NOT NULL, -- �ߺ��� �����ϳ� ��������� �ȵȴ�. PK �� FK�� �ٸ��� ����ũ�� �� ���� �׳� �߸����� �ʰ� �Ŵ�  ���� ���� �� ���̹Ƿ� CONSTRAINT �� �ʿ���� �̷��� ������ �ȴ�.
	AGE NUMBER(3),
	MAJOR VARCHAR2(100),
	ADDR VARCHAR2(100)
);
CREATE TABLE SUBJECT( -- ������ ���� ������ ��� ���� 
	NAME VARCHAR(300) NOT NULL,
	DEPT VARCHAR(300),
	PROF VARCHAR(300) NOT NULL,
	MAXSTU NUMBER(2),
	CODE NUMBER(4) PRIMARY KEY -- ��� CODE �� NUM�� PK�� ���� ���� ������ ���� ���� ���̴�. PK �����ϴ� �� �˰���??
);
ALTER TABLE SUBJECT RENAME COLUMN PROFNUM TO NUM;
ALTER TABLE SUBJECT ADD CONSTRAINT SUB_PROF_FK
FOREIGN KEY(NUM) REFERENCES PROFESSOR(NUM);

CREATE TABLE PROFESSOR(
	NUM VARCHAR2(300) PRIMARY KEY,
	NAME VARCHAR2(200),
	DEPT VARCHAR2(100)
);

CREATE TABLE LIST( -- � �л��� � ������ ��û �ߴ��� ��û������ ������ ��� ����
	NUM NUMBER(4),
	CODE NUMBER(4),
	CONSTRAINT  LIST_STU_FK FOREIGN KEY(NUM) REFERENCES STUDENT(NUM),
	CONSTRAINT  LIST_SUB_FK FOREIGN KEY(CODE) REFERENCES SUBJECT(CODE)
);

CREATE TABLE TEST3(
	GENDER CHAR(1) CHECK(GENDER IN ('M','W')), -- üũ ���� ���� M �̳� W �� �ƴϸ� ������ ����.
	NUMDATA NUMBER(2) CHECK(NUMDATA>=10 AND NUMDATA <=90),
	STRDATA VARCHAR2(300) DEFAULT 'DEFAULT VALUE'
);
DROP TABLE TEST3;

-- K���� �౸��� ���� ���� ���α׷�.
CREATE TABLE TEAM(
	TEAM VARCHAR(300),
	GRADE NUMBER(1) UNIQUE,
	TID NUMBER(2) PRIMARY KEY
);

CREATE TABLE SUNSU(
	NAME VARCHAR(300) NOT NULL,
	PID NUMBER(2) PRIMARY KEY,
	MGR VARCHAR(300),
	TID NUMBER(2) NOT NULL,
	CONSTRAINT T_FK FOREIGN KEY(TID) REFERENCES TEAM(TID)
);
CREATE TABLE SCHEDUE(
	DAT DATE,
	T1ID NUMBER(2),
	T2ID NUMBER(2),
	SID VARCHAR2(300),
	CONSTRAINT T1_FK FOREIGN KEY(T1ID) REFERENCES TEAM(TID),
	CONSTRAINT T2_FK FOREIGN KEY(T2ID) REFERENCES TEAM(TID),
	CONSTRAINT S_FK FOREIGN KEY(SID) REFERENCES STADIUM(SID)
);

CREATE TABLE STADIUM(
	SID VARCHAR2(300) PRIMARY KEY,
	SSEAT NUMBER(6) CHECK(SSEAT>0)
);









