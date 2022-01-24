--JOIN
SELECT P.PLAYER_NAME, T.TEAM_NAME FROM PLAYER P, TEAM T;
SELECT P.PLAYER_NAME, T.TEAM_NAME FROM PLAYER P
	INNER JOIN TEAM T ON P.TEAM_ID = T.TEAM_ID; -- INNER��� Ű���� ���� ����
	--WHERE T.TEAM_NAME = '������ũ';
	
-- ANSI ����	
SELECT P.PLAYER_NAME, T.TEAM_NAME FROM PLAYER P
	JOIN TEAM T ON P.TEAM_ID = T.TEAM_ID;
	
-- ����Ŭ ����
SELECT P.PLAYER_NAME, T.TEAM_NAME FROM PLAYER P, TEAM T
WHERE P.TEAM_ID = T.TEAM_ID;
------------------------------------------------------------------------------------

-- EMP, DEPT / �����, �μ��� , ����
SELECT P.ENAME "�����", T.DNAME "�μ���",T.LOC "����" FROM EMP P JOIN DEPT T ON P.DEPTNO = T.DEPTNO;

--PLAYER, TEAM / ������ ������ ����� �� ��ȭ��ȣ
SELECT T.TEAM_NAME "����", P.PLAYER_NAME "������",T.TEL "��ȭ��ȣ" FROM PLAYER P JOIN TEAM T ON P.TEAM_ID = T.TEAM_ID WHERE P.PLAYER_NAME = '������';
--SELECT T.TEAM_NAME "����", P.PLAYER_NAME "������",T.TEL "��ȭ��ȣ" FROM PLAYER P JOIN TEAM T ON P.TEAM_ID = T.TEAM_ID AND P.PLAYER_NAME = '������';
-- �̰͵� ����  WHERE�� ��ſ� ON���� �����൵ �Ǵ°�쿡�� ON���� �����ش�.

--EMPLOYEES, JOBS / �̸�, �̸���, ����, ������
SELECT E.FIRST_NAME||'-'||E.LAST_NAME "�̸�", E.EMAIL "�̸���",J.JOB_TITLE "������", J.JOB_ID "����"
FROM EMPLOYEES E JOIN JOBS J ON E.JOB_ID = J.JOB_ID;

--T_STUDENT, T_DEPARTMENT / �л��̸�, 1���� �а���ȣ, 1���� �а��̸�
SELECT T.NAME "�л��̸�", T.DEPTNO1 "1���� �а���ȣ", D.DNAME "1���� �а��̸�"
FROM T_STUDENT T JOIN T_DEPARTMENT D ON T.DEPTNO1 = D.DEPTNO;

--T_STUDENT, T_PROFESSOR / �л��̸�, �������� ��ȣ, �������� �� ������ Ȯ��
SELECT T.NAME "�л��̸�", P.PROFNO "�������� ��ȣ", P.NAME "���� ���� ��"
FROM T_STUDENT T JOIN T_PROFESSOR P ON T.PROFNO = P.PROFNO;
-- NULL �̰ų� ���ǿ� �������� �ʴ°� �ƿ� ���� ������.

--T_STUDENT, T_DEPARTMENT, T_PROFESSOR / �л��� �̸�, �а��̸�, �������� �̸�
SELECT T.NAME "�л��̸�", D.DNAME "�а��̸�", P.NAME "���� ���� ��"
FROM T_STUDENT T JOIN T_PROFESSOR P ON T.DEPTNO1 = P.DEPTNO JOIN T_DEPARTMENT D  ON T.DEPTNO1 = D.DEPTNO;

--�� ����

SELECT * FROM EMP;
SELECT * FROM SALGRADE;
SELECT
	E.ENAME �����, E.SAL �޿�, S.GRADE ���
FROM EMP E JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

SELECT 
*
FROM PLAYER P INNER JOIN TEAM T ON P.TEAM_ID = T.TEAM_ID;

-- �ߺ� ���� �ʰ� �ϸ�,
SELECT 
*
FROM PLAYER P JOIN TEAM T USING(TEAM_ID);
-- NATURAL �� ����ϰ� �Ǹ� �˾Ƽ� ��ġ�°� JOIN ���ش�. USING�� ���ֵ� ���� �˾Ƽ� ���ִϱ�!
SELECT * FROM PLAYER
	NATURAL JOIN TEAM;
	
--OUTER JOIN
--RIGHT OUTER JOIN
-- LEFT ���� RIGHT ������ JOIN�� �������� �����ʰ� ���ϴ��� ���ʰ� ���ϴ��� ���ϴ� �Ŵ�.
SELECT 
NVL(T.TEAM_NAME,'Ȩ�� ����') ����, S.STADIUM_NAME �����
FROM TEAM T RIGHT OUTER JOIN STADIUM S ON T.TEAM_ID = S.HOMETEAM_ID;
--LEFT OUTER JOIN
SELECT 
NVL(T.TEAM_NAME,'Ȩ�� ����') ����, S.STADIUM_NAME �����
FROM STADIUM S LEFT OUTER JOIN TEAM T ON T.TEAM_ID = S.HOMETEAM_ID;

-- ����Ŭ ���� �̰� RIGHT OUTER JOIN �̴�. (+)�� �����̸� RIGHT , �������̸� LEFT �ݴ��.
SELECT 
NVL(T.TEAM_NAME,'Ȩ�� ����') ����, S.STADIUM_NAME �����
FROM TEAM T, STADIUM S WHERE T.TEAM_ID(+) = S.HOMETEAM_ID;

--CROSS JOIN
--���� ���� ����, �̷л����� ����
SELECT P.PLAYER_NAME, T.TEAM_NAME FROM PLAYER P CROSS JOIN TEAM T;
-- �̰� �ΰ� ������
SELECT P.PLAYER_NAME, T.TEAM_NAME FROM PLAYER P, TEAM T;


--OUTER JOIN 
SELECT T.NAME "�л��̸�", NVL(TO_CHAR(P.PROFNO),'�����ȵ�') "�������� ��ȣ", NVL(P.NAME,'�����ȵ�') "���� ���� ��"
FROM T_STUDENT T LEFT OUTER JOIN T_PROFESSOR P ON T.PROFNO = P.PROFNO;

-- ������, �Ŵ��� ��
SELECT FROM EMP;
SELECT E1.ENAME "������", E2.ENAME "�Ŵ�����"  FROM EMP E1 JOIN EMP E2 ON E1.MGR = E2.EMPNO;

SELECT * FROM T_STUDENT;
SELECT * FROM T_PROFESSOR;
--T_EMP2 T_POST / ����� �̸��� ����, ���� ����, �ش� ������ ���ѱݾ�, ���ѱݾ�
SELECT 
E.NAME "����̸�", E.POST "��� ����", E.PAY "���� ����", P.S_PAY "���� �ݾ�", P.E_PAY "���� �ݾ�"
FROM T_EMP2 E JOIN T_POST P ON E.POST = P.POST;
--T_CUSTOMER, T_GIFT / ���� �� �ִ� ��ǰ�� ��ȸ�Ͽ� ���̸�, ����Ʈ , ��ǰ��
SELECT
C.C_NAME "�� �̸�", C.C_POINT "�� ����Ʈ", G.G_NAME "��ǰ��"
FROM T_CUSTOMER C JOIN T_GIFT G ON C.C_POINT BETWEEN G.G_START AND G.G_END;
--���� �������� ��ȸ�� ��ǰ�� �̸��� �ʿ���� �˻�
SELECT
G_NAME "��ǰ��", COUNT(*)
FROM T_CUSTOMER C JOIN T_GIFT G ON C.C_POINT BETWEEN G.G_START AND G.G_END GROUP BY G_NAME;

--T_STUDENT, T_EXAM, T_CREDIT / �л����� �̸�, ���� ����
SELECT
S.NAME "�л��̸�", E.TOTAL "����", C.GRADE "����"
FROM T_STUDENT S JOIN T_EXAM01 E ON S.STUDNO = E.STUDNO JOIN T_CREDIT C ON E.TOTAL BETWEEN C.MIN_POINT AND C.MAX_POINT;
--T_DEPT2 / �μ���� �� ���� �μ��� �˻�
SELECT
D1.DNAME "�μ���", D2.AREA "����"
FROM T_DEPT2 D1 JOIN T_DEPT2 D2 ON D1.DCODE = D2.PDEPT;
--T_PROFESSOR / ������ȣ, �����̸�, �Ի���, �ڽź��� �Ի����� ���� ����� �ο��� / �ο��� ������������ ����
-- ���� �������� �÷����� GROUP BY�� �Ǿ����� ������ ���� �� ����! ���� �Ȼ����°� ���δ� GROUP BY�� �־� �����°Ŵ�.
SELECT
	P1.PROFNO ������ȣ,
	P1.NAME �����̸�,
	P1.HIREDATE �Ի���,
	COUNT(P2.HIREDATE) �ο���
FROM T_PROFESSOR P1 LEFT OUTER JOIN T_PROFESSOR P2 ON P1.HIREDATE > P2.HIREDATE GROUP BY P1.PROFNO,P1.NAME,P1.HIREDATE ORDER BY 4;

