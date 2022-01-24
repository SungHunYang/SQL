--DML
CREATE TABLE CAR(
	BRAND VARCHAR2(300),
	COLOR VARCHAR2(300),
	PRICE NUMBER(10)
);
--INSERT
INSERT INTO CAR
VALUES('Ferrari',6500,'Red');
--�÷��� �ۼ��� ��쿡�� �� �÷��� �ش��ϴ� ���鸸 ������ ���༭ �����Ѵ�.
INSERT INTO CAR (PRICE)
VALUES(7000);

--UPDATE
UPDATE CAR
SET BRAND = 'K7', COLOR='WHITE'
WHERE PRICE = 7000;

INSERT INTO CAR
VALUES('Genesis',7000,'Black');

UPDATE CAR
SET PRICE = 65000000
WHERE BRAND ='Genesis';

UPDATE CAR
SET PRICE = 650000000
WHERE BRAND ='Ferrari';
--DELETE
DELETE FROM CAR
WHERE COLOR='Red';

DELETE FROM CAR
WHERE PRICE <=7000;
--���̺� ���� ��ü ����
DELETE FROM CAR; -- �̷��� ������ ������ ���� �� ���� �ȴ�. ��� �ٽ� �ǵ����ų� �ҷ��� �� �ִ�. ������ ����
TRUNCATE TABLE CAR; -- ��� DML�� �ƴ϶� DDL�̴� , �ӵ��� �ְ� ������ ���� ����, ��� �ٽ� �ǵ����ų� �ҷ��� �� ����. ���� �Ұ���

--SELECT
SELECT * FROM CAR ; -- * --> ��� ��
SELECT PRICE FROM CAR WHERE BRAND = 'Ferrari';

-- �ǽ�
-- ���̵�, �н�����, �̸�, ����
-- �Է� �޾Ҵٰ� �����ϰ� ���̺� ���� �ֱ�
-- 3�� INSERT( apple : ���� / banana : ���ϳ� / cherry : ������ / durian : �ֵθ�)
-- ��ü�� ��й�ȣ�� aaaa1111�� ����
-- �ֵθ��� Ż�� ��Ű��
CREATE TABLE T_USER -- Ű���� �̸��� ���̺������ �� ���� "" ���
(
	ID VARCHAR2(300),
	PW VARCHAR2(300),
	NAME VARCHAR2(300),
	AGE NUMBER(3),
	CONSTRAINT ID_PK PRIMARY KEY (ID)
);

INSERT INTO T_USER VALUES('apple','abcd1234','����',10);
INSERT INTO T_USER VALUES('banana','abcd1234','���ϳ�',20);
INSERT INTO T_USER VALUES('cherry','abcd1234','��ü��',17);
INSERT INTO T_USER VALUES('durian','abcd1234','�ֵθ�',28);

SELECT * FROM T_USER;

UPDATE T_USER
SET PW ='aaaa1111'
WHERE ID ='cherry';

DELETE FROM T_USER
WHERE ID='durian';

-- 3���� �л��� ������û �Ϸ��Ű��
-- STUDENT, SUBJECT >> LIST
-- PROFESSOR >> SUBJECT
SELECT * FROM STUDENT;
SELECT * FROM SUBJECT;
SELECT * FROM PROFESSOR;
SELECT * FROM LIST;

INSERT INTO PROFESSOR
VALUES ('p001','���ټ�','����Ʈ����');
INSERT INTO PROFESSOR
VALUES ('p002','�ѵ���','����Ʈ����');
INSERT INTO PROFESSOR
VALUES ('p003','ȫ�浿','�濵');
INSERT INTO PROFESSOR
VALUES ('p004','�̼���','�ؾ�����');

INSERT INTO SUBJECT
VALUES ('DBMS','����Ʈ����','p001',35,001);
INSERT INTO SUBJECT
VALUES ('Python','����Ʈ����','p002',35,002);
INSERT INTO SUBJECT
VALUES ('�źϼ�������','�ؾ�����','p004',35,003);
INSERT INTO SUBJECT
VALUES ('JAVA','����Ʈ����','p003',35,004);

INSERT INTO STUDENT(NUM,JUMIN,NAME,MAJOR)
VALUES (1901,'9901011000001','����','����Ʈ����');
INSERT INTO STUDENT(NUM,JUMIN,NAME,MAJOR)
VALUES (1902,'9901012000001','���ϳ�','����Ʈ����');
INSERT INTO STUDENT(NUM,JUMIN,NAME,MAJOR)
VALUES (1801,'9901011000011','��ü��','�ؾ�����');

INSERT INTO LIST VALUES(1901,002);
INSERT INTO LIST VALUES(1902,002);
INSERT INTO LIST VALUES(1801,003);

--CASCADE --> �����ϴ°ű��� ����°�
DELETE FROM STUDENT WHERE NUM=1902;

-- �౸ �ó�����
SELECT * FROM PLAYER;
SELECT * FROM TEAM;
SELECT * FROM SCHEDULE;
SELECT * FROM STADIUM;
-- ����  - ȸ����ġ
SELECT * FROM DEPT;
SELECT * FROM EMP;
-- ���� - �μ� - ��ġ
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM LOCATIONS;
SELECT * FROM JOBS;
-- �б� - �л�
SELECT * FROM T_STUDENT;
SELECT * FROM T_PROFESSOR;
SELECT * FROM T_DEPARTMENT;
-- �̰͵� ��Ʈ�� ���� �𸣰ڴµ�
SELECT * FROM T_EMP;
SELECT * FROM T_DEPT;

-----------------------------------------------------------------------------------------------------------

--PLAYER ���̺��� TEAM_ID�� K01�� ���� �˻�
SELECT * FROM PLAYER WHERE TEAM_ID ='K01';
--PLAYER ���̺��� TEAM_ID�� K01�� �ƴ� ������ �̸��� ������ �˻�
SELECT TEAM_ID,PLAYER_NAME,WEIGHT FROM PLAYER WHERE TEAM_ID !='K01';
--PLAYER ���̺��� WEIGHT�� 80������ ������ �̸��� Ű�� ������ �˻�
SELECT PLAYER_NAME,WEIGHT FROM PLAYER WHERE WEIGHT<=80;
--PLAYER ���̺��� HEIGHT�� 170�̻��� ���� �˻�
SELECT * FROM PLAYER WHERE HEIGHT>=170;
--PLAYER ���̺��� WEIGHT�� 70�̻� 80������ ���� �˻�
SELECT * FROM PLAYER WHERE WEIGHT>=70 AND WEIGHT<=80;
--PLAYER ���̺��� HEIGHT�� 170�����̰� WEIGHT�� 70�̻��� �����˻�
SELECT * FROM PLAYER WHERE HEIGHT<=170 AND WEIGHT>=70;
--PLAYER ���̺��� TEAM_ID�� K03�� JOIN_YYY�� 2011�� ���� �˻�
SELECT * FROM PLAYER WHERE TEAM_ID ='K03' AND JOIN_YYYY = 2011;
--PLAYER ���̺��� BIRTH_DATE�� 1987�� �����̰� TEAM_ID�� K06�� ���� �˻�
-- �̰� ����Ʈ �� Ȯ���ϱ�! �̷��� �ϴ°Ŵ�
-- TO_DATE�� �����ϸ� ���� �ð��� �ʴ����� ������ ������ ���� ���� ���� ���ڰ� ũ��!
SELECT * FROM PLAYER WHERE BIRTH_DATE >=TO_DATE('1988-01-01','YYYY-MM-DD') AND TEAM_ID='K06';
--PLAYER ���̺��� TEAM_ID�� K04�̰� JOIN_YYYY�� 2011�̰ų� 2012�� ���� �˻�
SELECT * FROM PLAYER WHERE TEAM_ID='K04'AND (JOIN_YYYY=2011 OR JOIN_YYYY=2012); -- �ٸ� ������δ� JOIN_YYYY IN ('2011','2012') �̰͵� ����
--PLAYER ���̺��� POSITION�� DF�� ������ KO5 ���� ���� �������� �̸��� ������, ���ȣ �˻�
SELECT PLAYER_NAME,"POSITION",BACK_NO FROM PLAYER WHERE "POSITION"='DF' AND TEAM_ID='K05';






