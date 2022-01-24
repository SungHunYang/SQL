--VIEW
CREATE VIEW NOT_K05 AS (SELECT PLAYER_ID,PLAYER_NAME, TEAM_ID, "POSITION" FROM PLAYER WHERE TEAM_ID != 'K05');
SELECT * FROM NOT_K05 WHERE "POSITION" ='MF';
DROP VIEW NOT_K05;

-- TABLE ���������� �����
CREATE TABLE NOT_K05 AS (SELECT PLAYER_ID,PLAYER_NAME, TEAM_ID, "POSITION" FROM PLAYER WHERE TEAM_ID != 'K05');
DROP TABLE NOT_K05;

--INSERT ������ �ϱ�
CREATE TABLE EMP_A (
	EMP_NUM NUMBER,
	EMP_NAME VARCHAR2(300)
);
CREATE TABLE EMP_B (
	EMP_NUM NUMBER,
	EMP_NAME VARCHAR2(300)
);
INSERT ALL
	INTO EMP_A VALUES('101','�̼���')
	INTO EMP_B VALUES('101','���̾��')
SELECT * FROM DUAL; -- INSERT ALL �Ϸ��� �ǹ� ���� ���� ������ �ʿ��ϴ�.
INSERT ALL
	INTO EMP_A VALUES('102','ȫ�浿')
	INTO EMP_B VALUES('102','ĸƾ')
SELECT * FROM DUAL;
-- �ٸ� ���̺� ���� �����ؼ� �߰�
INSERT INTO EMP_A (SELECT * FROM EMP_B); -- EMP_B�� �ִ°� ���� EMP_A�� ������.
SELECT * FROM EMP_A;
-- ���� �ڱ� ������ �����ϸ� ������ 2��� �þ��.
DROP TABLE EMP_A;
DROP TABLE EMP_B;

-- ALL
--SELECT * FROM EMP WHERE SAL >= (SELECT MAX(SAL) FROM EMP); --> �̰ſ� �Ȱ��� �����̴�.
SELECT HEIGHT FROM PLAYER;
SELECT * FROM EMP WHERE SAL >= ALL(SELECT SAL FROM EMP); -- �ִ밪���� ũ�ų� ���� ���̴ϱ� 1���� ���´�.

--ANY
SELECT * FROM EMP WHERE SAL> ANY(SELECT SAL FROM EMP);

--T_EMP2���� ���������� �ּҿ����ں��� �޿��� �� �޴� ������
-- �̸�, ���� �޿� �˻�
SELECT NAME �̸�, POST ����, PAY �޿� FROM T_EMP2
WHERE PAY > ANY(SELECT PAY FROM T_EMP2 WHERE POST = '����')

--�л��� �� 4�г��� �ּ� ������ ���� �� ������ �л���
-- �̸� �г� ������ �˻�
SELECT NAME �̸�, GRADE �г�, WEIGHT ������ FROM T_STUDENT
WHERE WEIGHT < ALL(SELECT WEIGHT FROM T_STUDENT WHERE GRADE=4);

--EXISTS
SELECT * FROM PLAYER
WHERE EXISTS(SELECT TEAM_ID FROM PLAYER WHERE TEAM_ID='K04'); 
-- WHERE�� �ڿ��� ���� �Ǹ鼭 WHERE���� ���� �� ó�� �׳� ���� �� ������ �ȴ�, ��� EXISTS �ڿ��� �ƹ��͵� ��� ������ ������ �ƹ��͵� �ȳ����� �ȴ�.
-- ���� EXISTS�� ��¥ �ڿ��� �ִ��� �������� Ȯ���� �� �׷����� ����Ѵ�.
SELECT * FROM PLAYER
WHERE TEAM_ID IN (SELECT TEAM_ID FROM PLAYER WHERE TEAM_ID='K04');

































