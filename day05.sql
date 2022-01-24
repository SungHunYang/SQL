--���� �Լ�

-- ���ڿ� ����, �ڸ���
--CONCAT() / SUBSTR()
SELECT CONCAT('FLO','WER') FROM DUAL; -- ���ڿ� ��ſ� �÷��� ���� �� �ִ�. || �� ����
-- ������ 2���� ���� �� �� ����
SELECT SUBSTR('FLOWER',3), SUBSTR('FLOWER',2,3) FROM DUAL;
--SUBSTR('���ڿ�',N) : N��° ���ں��� ������ �߶󳻱�
--SUBSTR('���ڿ�',N,M) : N��° ���ں��� N ���� ��ŭ �߶󳻱�
-- SUBSTR���� ���ڴ� �ε��� ��ȣ��� �����ϸ� �ȴ�. ��� 1������ �����ϴ� �ε���

--'BUSTAXIMETROCYCLE' ---> BUSCYCLE
SELECT CONCAT(SUBSTR('BUSTAXIMETROCYCLE',1,3),SUBSTR('BUSTAXIMETROCYCLE',13)) NAME FROM DUAL;

--���ڿ� ����
--LENGTH('���ڿ�') : �ش� ���ڿ��� ����
SELECT LENGTH('HELLO') FROM DUAL;

SELECT * FROM T_STUDENT WHERE LENGTH(ID)<6;

--INITCAP() : �� ù���ڸ� �빮�ڷ� ��ȯ
--UPPER(), LOWER() : ��ü �빮�ڷ�, �ҹ��ڷ� ��ȯ

--INSTR('���ڿ�','ã�¹��ڿ�',N,M) : N��° ���� M��°�� �����ϴ� ã�� ���ڿ��� ��ġ�� ��ȯ (������ 0���� ����)
SELECT INSTR('A*B*C*D*E*','*',1,1) FROM DUAL; 
SELECT INSTR('A*B*C*D*E*','*',1,3) FROM DUAL;
SELECT INSTR('A*B*C*D*E*','*',-1,3) FROM DUAL; -- ������ �ݴ� �������� ���� , �� ���� �ε����� -1


--T-STUDENT ���̺� / 1������ 101�� �л��� �̸�, ��ȭ ��ȣ, ���� ��ȣ

SELECT NAME �̸�, TEL "��ȭ ��ȣ", SUBSTR(TEL,1,INSTR(TEL,')',1,1)-1) "������ȣ", DEPTNO1 "����" FROM T_STUDENT WHERE DEPTNO1=101;
--SUBSTR(TEL,1,INSTR(TEL,')',1,1)-1) "������ȣ" ���ڸ� ������ �Ϸ���  INSTR(TEL,')',1,1) ���ؼ� ' ) '  ������ ���ڸ� ������ �ѰŴ�.

--LPAD(), RPAD() : ���ڿ��� ����, �����ʿ� ���ڿ� ä���ֱ�

--LTRIM(), RTRIM() : ���ڿ� ���� ���ʿ��� �߶�, �����ʿ��� �߶�
-- ���� ���� ���� �� ���
SELECT LTRIM('     ������',' ') FROM DUAL;
SELECT RTRIM('������            ',' ') FROM DUAL;

--REPLACE('���ڿ�1','���ڿ�2','���ڿ�3') : ���ڿ�1���� ���ڿ�2�� ã�Ƽ� ���ڿ�3���� ����
SELECT REPLACE('���۸� ���ۿ�� ���۸��� �����ִϾ� �����Ŀ�','����','��Ʈ') "�̸�" FROM DUAL;

--T_STUDENT / 102 �а��� �л��� ���� #���� �ٲ㼭 �˻�
SELECT REPLACE(NAME,SUBSTR(NAME,1,1),'#') "�̸�", DEPTNO1 "�а�" FROM T_STUDENT WHERE DEPTNO1 = 102;

--T_STUDENT�� ��ȭ��ȣ ��� �ڸ��� '###'���� �ٲ㼭 �˻�

--------------------------------------------------------------------------------------------------------

--���� �Լ�

--ABS() : ���밪
SELECT ABS(-10) FROM DUAL;
--SIGN() : ��ȣ�Ǻ�
SELECT SIGN(1000), SIGN(0), SIGN(-412) FROM DUAL; --  '0'�� 0 / '-' �� -1 / '+' ��  1
--MOD(N,M) : N�� M���� ���� ������
SELECT MOD(10,3) FROM DUAL;
--CEIL(), FLOOR() : �ø� , ����
SELECT CEIL(3.14), FLOOR(3.14) FROM DUAL;
SELECT CEIL(-3.14), FLOOR(-3.14) FROM DUAL; -- �̰� �ø� �����ε� ���������� ���´ٱ� ���ٴ� �ø�(������ ū �ֱ�������), ����(������ ���� �ֱ�������) �����϶� �򰥸��� �ʰ� ����

--ROUND() : �ݿø�
--ROUND(����,N) : N�� �ᵵ �ǰ� �Ƚᵵ �Ǵµ� ������ �ٶ�� �ڸ����� ���� ������ �ȴ�. N�� �Ⱦ��� ����
SELECT ROUND(3.141592,3) FROM DUAL;
--TRUNC() : ����
SELECT TRUNC(3.141592,2) FROM DUAL;

SELECT FLOOR(-3.14), TRUNC(-3.14) FROM DUAL;

--POWER() : ������
SELECT POWER(2,3) FROM DUAL;
SELECT POWER(2,1/2) FROM DUAL; --��Ʈ

--SYSDATE : ����ð�
SELECT SYSDATE - HIREDATE FROM T_PROFESSOR; -- SYSDATE ���� �ð�  / �׷��� �ΰ��� ���� ���ݱ��� �帥 �ð��� ���´�.
----------------------------------------------------------------------------------------------------

-- NULLó�� �Լ�

--NVL(�÷���, ��ü�Ұ�) : �÷��� ���� NULL�� ��� ��ü�� ������ ��� ���
--T_PROFESSOR / �̸�, �޿�, ���ʽ�, ����(�޿�*12 + ���ʽ�)
SELECT 
	NAME �̸�,
	PAY �޿�,
	NVL(BONUS,0) ���ʽ�,
	PAY*12+NVL(BONUS,0) ����
FROM T_PROFESSOR;

--NVL2(�÷���,��1,��2) : �÷��� ���� NULL�� ��� ��2�� ��ü, NULL�� �ƴ� ��� ��1( �÷��� �״�� ��������� ��1�� �÷��� ������ �ȴ�.)
SELECT 
	NAME �̸�,
	PAY �޿�,
	NVL2(BONUS,BONUS,0) ���ʽ� -- �̰� �Ҷ� ���ڿ��� ���� ���� �߸��缭 �ؾ��Ѵ�. ���ڿ����� �ƴϸ� ���ڳ��� �̷���
FROM T_PROFESSOR;

------------------------------------------------------------------------------------------------------------

-- ����ȯ �Լ�

-- �ڵ� ����ȯ(������ ����ȯ)
-- [����]�� [���ڷ� �̷���� ���ڿ�]�� �����ϰ� �Ǹ� �ڵ������� ���ڷ� ��ȯ���ش�.
SELECT 1+'1' FROM DUAL;

--���� ����ȯ(����� ����ȯ)
--����ȯ �Լ� �̿�

--TO_CHAR (���� -> ����) / (��¥ -> ����)
--TO_CHAR(����,'FORMAT') -> FORMAT�� ����
SELECT TO_CHAR(650000000,'9,999,999,999') FROM DUAL;
SELECT TO_CHAR(1234,'99999.999999') FROM DUAL;
SELECT TO_CHAR(1234,'99999') FROM DUAL; -- �ڸ��� �Ѿ�� ���ڸ��� ǥ��
SELECT TO_CHAR(1234,'099999') FROM DUAL; -- 0�� ������ ���ڸ��� 0���� �ȴ�.
SELECT TO_CHAR(SYSDATE) FROM DUAL;
SELECT TO_CHAR(SYSDATE,'YYYY') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'RRRR') FROM DUAL; -- R�� �ϸ� ���� Ȯ���ϰ� ǥ����
SELECT TO_CHAR(SYSDATE,'YEAR') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'MON') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'MONTH') FROM DUAL;

--TO_NUMBER (���� -> ����)
SELECT TO_NUMBER('10.1') FROM DUAL;

--TO_DATE (���� -> ��¥)
SELECT TO_DATE('2002-05-31','YYYY-MM-DD') FROM DUAL;

------------------------------------------------------------------------------------------

--�׷� �Լ�

SELECT
	AVG(HEIGHT),
	MAX(HEIGHT),
	MIN(HEIGHT),
	SUM(HEIGHT),
	COUNT(NVL(HEIGHT,0))
FROM PLAYER;

--ORDER BY
SELECT PLAYER_NAME, HEIGHT FROM PLAYER ORDER BY HEIGHT;
SELECT PLAYER_NAME, HEIGHT FROM PLAYER ORDER BY HEIGHT DESC;
--PLAYER ���̺��� Ű�� �������� ���� �� ���� �׷��� �̸����� �������� ����
SELECT PLAYER_NAME, HEIGHT FROM PLAYER ORDER BY HEIGHT, PLAYER_NAME; -- HEIGHT�� ���� �ѵ� , PLAYER_NAME���� ����

-- �˻��� �÷��� 2��° �÷�(HEIGHT) �������� ����
SELECT PLAYER_NAME, HEIGHT FROM PLAYER ORDER BY 2; 
-- ORDER BY�� �÷��� ��Ī���ε� ��� ����
SELECT PLAYER_NAME �����̸�, HEIGHT Ű FROM PLAYER ORDER BY Ű;

--�������� �� ���� �ִ�Ű
SELECT 
	TEAM_ID,
	 MAX(HEIGHT)
FROM PLAYER GROUP BY TEAM_ID;

SELECT TEAM_ID, HEIGHT, PLAYER_NAME
FROM PLAYER;

------------------------------------------------------------

-- T_PROFESSOR / �а� ���� �������� ��� ���ʽ� �˻� / ��� ���ʽ��� �Ҽ��� 2°�ڸ����� �˻�
SELECT 
	DEPTNO "�а�",
	ROUND(AVG(NVL(BONUS,0)),2) "���ʽ� ���"
FROM T_PROFESSOR GROUP BY DEPTNO ORDER BY DEPTNO;

--EMPLOYEES
--JOB_ID ���� ��� SALARY�� 10000�̸��� JOB_ID��
--SALARY �հ�, ���, �ִ밪, �ּҰ�, ��� �˻�
--JOB_ID ���ĺ� ������ ����
SELECT JOB_ID, SUM(SALARY) "�հ�",AVG(SALARY) "���", MAX(SALARY) "�ִ밪", MIN(SALARY) "�ּҰ�", COUNT(SALARY) "�� ��"
FROM EMPLOYEES HAVING AVG(SALARY)< 10000 GROUP BY JOB_ID ORDER BY JOB_ID;

--T_PROFESSOR
--�μ��� ��� �޿��� �˻��ϵ� ��� �޿��� 450���� ���� �μ��� �˻�
SELECT 
DEPTNO "�μ�", AVG(PAY) "��� �޿�"
FROM T_PROFESSOR HAVING AVG(PAY)>450 GROUP BY DEPTNO;

SELECT * FROM T_PROFESSOR;
--PLAYER
--�����԰� 80�̻��� �������� ���Ű�� 180�̻��� ������ �˻�
SELECT
"POSITION" "������", AVG(NVL(HEIGHT,0)) "���Ű"
FROM PLAYER WHERE NVL(WEIGHT,0)>=80  HAVING AVG(NVL(HEIGHT,0))>=180 GROUP BY "POSITION";

SELECT * FROM PLAYER;
--T_PROFESSOR
--�а��� �׸��� ���޺��� �������� ��� �޿� �˻�
SELECT 
DEPTNO "�а�", "POSITION" "����", AVG(PAY) "��� �޿�"
FROM T_PROFESSOR GROUP BY DEPTNO,"POSITION" ORDER BY DEPTNO,"POSITION";
--T_EMP
--�Ŵ���(MGR) ���� �����ϴ� ��������
--�Ŵ���, ������, �޿��Ѿ�, �޿����, �����(COMM) ��հ˻�
--��, ������� ����
SELECT 
MGR "�Ŵ���", AVG(EMPNO) "������", AVG(SAL) "�޿����", SUM(SAL) "�޿��Ѿ�", AVG(NVL(COMM,0)) "����� ���"
FROM T_EMP GROUP BY MGR;
SELECT * FROM T_EMP;
--T_PROFESSOR / ������ ������ Ȥ�� �������� �������
--������ ����ȣ, �Ҽӱ��� �Ѽ�, �ټ��� ���, �޿� ���, ���ʽ� ��� �˻�
SELECT 
DEPTNO "�а�", COUNT(DEPTNO) "�Ҽӱ��� �Ѽ�", TO_CHAR(TRUNC(AVG(SYSDATE-HIREDATE)))||'��' "�ټ��� ���", AVG(PAY) "�޿����", AVG(NVL(BONUS,0)) "���ʽ� ���"
FROM T_PROFESSOR WHERE "POSITION"='������' OR "POSITION"='������' GROUP BY DEPTNO ORDER BY DEPTNO;
--T_STUDENT / �а����� �а���ȣ, �ִ�����Կ� �ּҸ������� ���� �˻�
--���̰� 30�̻��� �а��� �˻�
SELECT 
DEPTNO1 "�а���ȣ", TO_NUMBER(MAX(WEIGHT)-MIN(WEIGHT)) "�ִ� �ּ� ����"
FROM T_STUDENT GROUP BY DEPTNO1 HAVING TO_NUMBER(MAX(WEIGHT)-MIN(WEIGHT))>=30 ;









