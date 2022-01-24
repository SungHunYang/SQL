--SEQUENCE
CREATE TABLE TEST(
	NUM NUMBER(10),
	STRDATA VARCHAR2(300)
);
INSERT INTO TEST VALUES(1,'A');
SELECT * FROM TEST;

TRUNCATE TABLE TEST;

CREATE SEQUENCE TEST_SEQ
START WITH 1
INCREMENT BY 1;

INSERT INTO TEST VALUES(TEST_SEQ.NEXTVAL,'A');-- ��������.NEXTVAL�ϸ� �ѹ� ���̰� ���� �����Ѵ�.
INSERT INTO TEST VALUES(TEST_SEQ.NEXTVAL,'B');
INSERT INTO TEST VALUES(TEST_SEQ.NEXTVAL,'C');
INSERT INTO TEST VALUES(TEST_SEQ.NEXTVAL,'D');
--------------------------------------------------------------------------------------------------------------------
SELECT * FROM PLAYER;
SELECT PLAYER_ID, PLAYER_NAME FROM PLAYER;
SELECT 3+5 FROM DUAL; -- ���� ������, ���� ���� �����ִ�

---AS
SELECT PLAYER_ID �������̵�, PLAYER_NAME AS �����̸� FROM PLAYER; -- AS�� ��������
-- ��Ī�� ���Ⱑ ���� ���⸦ �ٸ� �ϳ��� �ν��� �׷��� �� ����ǥ" "�� ���������
SELECT PLAYER_ID "���� ���̵�", PLAYER_NAME AS "���� �̸�" FROM PLAYER;
-- .(����������) : A.b --> A ���� b / A�� b
SELECT PLAYER.PLAYER_NAME, TEAM.TEAM_NAME FROM TEAM,PLAYER;
SELECT P.PLAYER_NAME �����̸�, T.TEAM_NAME ���̸� FROM TEAM T,PLAYER P;
SELECT * FROM PLAYER;
SELECT * FROM STADIUM;
SELECT * FROM TEAM;
--PLAYER ���̺��� ���ȣ, �������� �˻�
SELECT BACK_NO ���ȣ, NICKNAME �������� FROM PLAYER;
--STADIUM�� TEAM ���̺��� �ּҿ� ��ȭ��ȣ�˻�
SELECT S.ADDRESS �ּ�, T.TEL ��ȭ��ȣ FROM STADIUM S, TEAM T;
--PLAYER, TEAM ���̺��� �Ҽ����ڵ�, ���̸� �˻�
SELECT P.TEAM_ID �Ҽ����ڵ�, T.TEAM_NAME ���̸� FROM PLAYER P, TEAM T;
-- NULL : �������, ����Ŭ���� ����ִ� ���� ǥ���� �� ���̴�Ű����
-- NULL �񱳸� �� ���� =,!= �� �ƴ϶�[ IS, IS NOT ]�̿�
SELECT BACK_NO "�� ��ȣ", NICKNAME "���� ����" FROM PLAYER
WHERE NICKNAME IS NOT NULL;

---����
SELECT TEAM_ID "�� �ڵ�",TEAM_NAME "�� �̸�",DDD||'-'||TEL "��ȭ��ȣ" FROM TEAM; -- '-' �� �־ �� �޶�ٴ°� �������ش�.

--BETWEEN
--������ �� 1987�� ~ 1989��� ������ ���� �˻��ϱ�
SELECT* FROM PLAYER
WHERE BIRTH_DATE BETWEEN TO_DATE('1987-01-01','YYYY-MM-DD');


--LIKE
--SELECT * FROM T_USER WHERE JUMIN LIKE('______2%');
--������ �� �达�� �̾��� ���� �˻�
SELECT * FROM PLAYER WHERE PLAYER_NAME LIKE('��%') OR PLAYER_NAME LIKE('��%');
--����� �� ��⵵�� �ִ� ������� �̸� �˻�
SELECT STADIUM_NAME FROM STADIUM WHERE ADDRESS LIKE('%��⵵%');
--������ �� �̾��鼭 k06���� ���� ������ �˻�
SELECT * FROM PLAYER WHERE TEAM_ID = 'K06' AND PLAYER_NAME LIKE('��%');
--������ �� �̸��� ������ ������ �˻�
SELECT * FROM PLAYER WHERE PLAYER_NAME LIKE('__');
--������ �� ������� 2000��� ������ �����鸸 �˻�
SELECT * FROM T_PROFESSOR WHERE HIREDATE <= TO_DATE('2000-01-01','YYYY-MM-DD');
SELECT * FROM T_PROFESSOR WHERE TO_CHAR(HIREDATE,'YYYY') LIKE('19__');

--CASE��
SELECT * FROM EMP;
SELECT ENAME,SAL,
CASE
	WHEN SAL>=3000 THEN 'HIGH'
	WHEN SAL>=1000 THEN 'MID'  -- ���� ���ǹ����� �ѹ� �ɷ����ϱ� SAL<3000 AND �� �� �ʿ� ����
	ELSE 'LOW'
END "Ŭ����"
FROM EMP;

SELECT * FROM EMP;
--EMP ����� �� 2000�̻� �޿��� ���ʽ� 1000
--1000�̻� 2000�̸� �� ��� 500
-- �������� 0
--�����, �޿�, ���ʽ� �˻�
SELECT ENAME "�����", SAL "�޿�",
CASE
	WHEN SAL >=2000 THEN 1000
	WHEN SAL >=1000 THEN 500
	ELSE 0
END "���ʽ�"
FROM EMP;
--����忡�� �¼��� 0�̻� 30000�����̸� ũ�⸦ S
-- 30000�ʰ� 50000�����̸� M
-- 50000�ʰ� �̸� L
-- �ּ�, �̸�, �¼���, ũ�� �˻�
SELECT ADDRESS "�ּ�", STADIUM_NAME "�̸�", SEAT_COUNT "�¼� ��",
CASE
	WHEN SEAT_COUNT >50000 THEN 'L'
	WHEN SEAT_COUNT >30000 THEN 'M'
	ELSE 'S'
END "ũ��"
FROM STADIUM;
-- �������� �����԰� 50~70�̸� L, 71~80�̸� M, NULL�̸� �̵�� �׿ܿ��� H
-- �����̸�, ������, Ű, ü�ް˻�
SELECT PLAYER_NAME "�����̸�", WEIGHT "������", HEIGHT "Ű",
CASE
	WHEN WEIGHT BETWEEN 50 AND 70 THEN 'L'
	WHEN WEIGHT BETWEEN 71 AND 80 THEN 'M'
	WHEN WEIGHT IS NULL THEN '�̵��'
	ELSE 'H'
END "ü��"
FROM PLAYER;
--NULL ó���ϱ�
-- �������� �̸��� �����Ը� �˻��ϵ� �����԰� NULL�̶�� 0���� �ƴ϶�� �״�� �˻�
SELECT 
PLAYER_NAME "���� �̸�",
CASE
	 WHEN WEIGHT IS NULL THEN 0
	 ELSE WEIGHT
END "������"
FROM PLAYER;
--NVL(�÷���,��ü�Ұ�) : �ش� �÷��� �����Ͱ� NULL�ΰ�� ���� ��ü�� ������ ��� ����Ѵ�.
SELECT NVL(WEIGHT,0) FROM PLAYER;

--����ȭ�ǽ�
--���Ϲ� ���� ��ü (���̺� ���� :3 / �÷� :3~5)
--�°�, �����, ���Ϲ�
CREATE TABLE CUSTOMER(
	NAME VARCHAR2(300),
	ID VARCHAR2(300),
	AIR VARCHAR2(300),
	PHONE VARCHAR2(300),
	CONSTRAINT PK_ID PRIMARY KEY (ID),
	CONSTRAINT FK_AIR FOREIGN KEY (AIR) REFERENCES AIRPLANE(AIR_CODE)
);

CREATE TABLE AIRPLANE(
	AIR_CODE VARCHAR2(300),
	AIR_NAME VARCHAR2(300),
	HANGGONG VARCHAR2(300),
	CONSTRAINT PK_CODE PRIMARY KEY(AIR_CODE)
);

CREATE TABLE JIM(
	NUM VARCHAR2(300),
	CODE VARCHAR2(300),
	WEIGHT VARCHAR2(300),
	KIND VARCHAR2(300),
	CONSTRAINT FK_CODE FOREIGN KEY(CODE) REFERENCES AIRPLANE(AIR_CODE),
	CONSTRAINT PK_NUM PRIMARY KEY(NUM)
);

CREATE TABLE LIST(
	ID VARCHAR2(300),
	NUM VARCHAR2(300),
	CONSTRAINT FK_ID FOREIGN KEY(ID) REFERENCES CUSTOMER(ID),
	CONSTRAINT FK_NUM FOREIGN KEY(NUM) REFERENCES JIM(NUM)
);





















