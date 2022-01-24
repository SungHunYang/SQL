--���� ��
SELECT AVG(HEIGHT) FROM PLAYER;
SELECT PLAYER_NAME, HEIGHT, AVG(HEIGHT) FROM PLAYER;

--- SELECT�� ��������
SELECT PLAYER_NAME, HEIGHT, 
(SELECT AVG(HEIGHT) FROM PLAYER) 
FROM PLAYER; -- ���� ����]

-- FROM�� ��������
--PLAYER ���̺��� TEAM_ID = 'K01' �� �����߿� POSITION�� 'GK'�� ����
SELECT * FROM PLAYER WHERE TEAM_ID='K01';
SELECT ROWNUM,T.* FROM  -- ROWNUM�� ���� ��ȣ �����ִ� ��
	(SELECT * FROM PLAYER WHERE TEAM_ID='K01') T
WHERE "POSITION"='GK';

-- WHERE�� ��������
--�������� ���Ű���� ���� ������ �˻�
SELECT * FROM PLAYER WHERE HEIGHT<AVG(HEIGHT); -- �̰� �ȉ� �׷��Լ��� ���� ����
SELECT AVG(HEIGHT) FROM PLAYER;
SELECT * FROM PLAYER WHERE HEIGHT <(SELECT AVG(HEIGHT) FROM PLAYER);
----------------------------------------------------------------------------------------------------------------------------

--�������� ��ü Ű ��հ� �����Ǻ� Ű ��� ���ϱ�
SELECT 
"POSITION" '������', AVG(HEIGHT) '�����Ǻ� ���', (SELECT AVG(HEIGHT) FROM PLAYER) '��ü ���'
FROM PLAYER IS NOT NULL GROUP BY "POSITION";
--������ �� �г����� ���� �������� ���¹� ������ �г������� �ٲٱ�
UPDATE PLAYER 
SET NICKNAME = (SELECT NICKNAME FROM PLAYER WHERE PLAYER_NAME = '���¹�')
WHERE NICKNAME IS NULL;
--�������� ���Ű���� �����鼭 ��� �����Ժ��� �� ������ ������ ����
DELETE FROM PLAYER
WHERE HEIGHT<(SELECT AVG(HEIGHT) FROM PLAYER) AND WEIGHT > (SELECT AVG(WEIGHT) FROM PLAYER);
--������ ������ ���� ���� ������˻�
SELECT * FROM PLAYER WHERE TEAM_ID = (SELECT TEAM_ID FROM PLAYER WHERE PLAYER_NAME = '������' );
--������ �� Ű�� ���Ű���� ũ�� k01���� ���� ������ �˻�
SELECT * FROM PLAYER WHERE TEAM_ID = 'K01' AND HEIGHT > (SELECT AVG(HEIGHT) FROM PLAYER);
--�����(EMP) �� �̸��� L�� �ִ� ������� �μ���� ���� �˻�
SELECT P.ENAME "�����", P.DEPTNO "�����ȣ",T.DNAME "�μ���", T.LOC "����" FROM EMP P JOIN DEPT T ON T.DEPTNO = P.DEPTNO
WHERE P.ENAME LIKE('%L%');
SELECT * FROM DEPT;
--������ �л��� ���� �� �������� �޿����� �޿��� �� �޴� ������ �˻�
SELECT * FROM T_PROFESSOR 
WHERE PAY > (SELECT PAY FROM T_PROFESSOR WHERE "POSITION" ='������'
AND DEPTNO = (SELECT DEPTNO1 FROM T_STUDENT WHERE NAME ='������'));

-- GROUP���� ������ �ٶ� HAVING // ������ ��ü�� ������ �ٶ� WHERE �ڡڡڡڡڡڡڡڡڡڡ�
--�� ������ ����� �������� �ʰ� �¾ ������ �� �˻�
SELECT TEAM_ID, COUNT(*) FROM PLAYER 
WHERE BIRTH_DATE > (SELECT BIRTH_DATE FROM PLAYER WHERE PLAYER_NAME='�����')
GROUP BY TEAM_ID;

--PLAYER/ �ռ��� ������ ������ ���� ������ �˻�(�� ���̵�� ����)
SELECT * FROM PLAYER WHERE TO_CHAR(BIRTH_DATE,'MM-DD') = TO_CHAR((SELECT BIRTH_DATE FROM PLAYER WHERE PLAYER_NAME='�ռ���'),'MM-DD') ORDER BY TEAM_ID;
--PLAYER/ ������ ������ ���� ���� ������ �� Ű�� ���Ű���� ū ������ �˻�(�÷� IN (��1,��2...))
-- WHERE ���� ��ȣ�� �ε�ȣ�� �������� ���� �ݵ�� �Ѱ��� �;߸� �Ѵ�.
-- �׷��� ������ �϶��� IN ��� �Ѵ�.
SELECT * FROM PLAYER  WHERE HEIGHT > (SELECT AVG(HEIGHT) FROM PLAYER) AND TEAM_ID IN (SELECT TEAM_ID FROM PLAYER WHERE PLAYER_NAME ='������');
-- JOBS EMPLOYEES / JOB_TITLE�� MANAGER ��� ���ڿ� �����Ե� ������
-- ��տ����� JOB_TITLE���� �˻�
-- �˻��ϴ� ��!!�� �ٸ� ���̺��� ������ JOIN�� �ʿ��ѰŴ�.
SELECT JOB_ID FROM JOBS WHERE JOB_TITLE LIKE('%Manager%');
SELECT * FROM EMPLOYEES;

SELECT J.JOB_TITLE, AVG(SALARY) 
FROM EMPLOYEES E, JOBS J 
WHERE E.JOB_ID IN (SELECT J.JOB_ID FROM JOBS WHERE JOB_TITLE LIKE('%Manager%')) AND E.JOB_ID = J.JOB_ID GROUP BY J.JOB_TITLE;

--PLAYER / �౸������ �� �� ������ Ű�� ���� ū ������ �˻�
-- IN�� �̿��ϸ� �ΰ��̻��� ���� ���� �ִ�.
-- TEAM_ID�� HEIGHT�� ���� ���鼭 --> IN �ڿ� �ִ� ���̺�(�� ���� �ִ�Ű)�� ���ϸ鼭 �´°͸� ���
SELECT * FROM PLAYER 
WHERE (TEAM_ID,HEIGHT) IN (SELECT TEAM_ID, MAX(HEIGHT) FROM PLAYER GROUP BY TEAM_ID ) -- �� ���� �ִ�
ORDER BY TEAM_ID;
--STADIUM/ ����� �� ��������� 20120501~20120503 ���̿� �ִ� ����� �˻�
SELECT * FROM SCHEDULE;
SELECT * FROM STADIUM 
WHERE STADIUM_ID IN (SELECT STADIUM_ID FROM SCHEDULE WHERE SCHE_DATE BETWEEN '20120501' AND '20120503');

--EMPLYOEES/ DEN�� ��ȭ��ȣ�� �� 3�ڸ��� ���� ����� �˻�
SELECT * FROM EMPLOYEES WHERE SUB_STAR(PHONE_NUMBER,3) = SUB_STAR((SELECT PHONE_NUMBE FROM EMPLOYEES WHERE LAST_NAME ='DEN' ),3);
--EMPLOYEES / ��� �޿����� ���� �޴� ������� �޿� 10���� �λ��Ű��
--�迵�� ������, �迵�� �������� �Ի����� ������ �޿��� ���� �������� ������ȣ, �̸� , �޿� �˻�









