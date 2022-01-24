--서브 퀄
SELECT AVG(HEIGHT) FROM PLAYER;
SELECT PLAYER_NAME, HEIGHT, AVG(HEIGHT) FROM PLAYER;

--- SELECT절 서브쿼리
SELECT PLAYER_NAME, HEIGHT, 
(SELECT AVG(HEIGHT) FROM PLAYER) 
FROM PLAYER; -- 서브 쿼리]

-- FROM절 서브쿼리
--PLAYER 테이블에서 TEAM_ID = 'K01' 인 선수중에 POSITION이 'GK'인 선수
SELECT * FROM PLAYER WHERE TEAM_ID='K01';
SELECT ROWNUM,T.* FROM  -- ROWNUM은 각행 번호 보여주는 것
	(SELECT * FROM PLAYER WHERE TEAM_ID='K01') T
WHERE "POSITION"='GK';

-- WHERE절 서브쿼리
--선수들중 평균키보다 작은 선수들 검색
SELECT * FROM PLAYER WHERE HEIGHT<AVG(HEIGHT); -- 이거 안됌 그룹함수는 여기 못씀
SELECT AVG(HEIGHT) FROM PLAYER;
SELECT * FROM PLAYER WHERE HEIGHT <(SELECT AVG(HEIGHT) FROM PLAYER);
----------------------------------------------------------------------------------------------------------------------------

--선수들의 전체 키 평균과 포지션별 키 평균 구하기
SELECT 
"POSITION" '포지션', AVG(HEIGHT) '포지션별 평균', (SELECT AVG(HEIGHT) FROM PLAYER) '전체 평균'
FROM PLAYER IS NOT NULL GROUP BY "POSITION";
--선수들 중 닉네임이 없는 선수들은 정태민 선수의 닉네임으로 바꾸기
UPDATE PLAYER 
SET NICKNAME = (SELECT NICKNAME FROM PLAYER WHERE PLAYER_NAME = '정태민')
WHERE NICKNAME IS NULL;
--선수들중 평균키보다 작으면서 평균 몸무게보다 더 나가는 선수들 삭제
DELETE FROM PLAYER
WHERE HEIGHT<(SELECT AVG(HEIGHT) FROM PLAYER) AND WEIGHT > (SELECT AVG(WEIGHT) FROM PLAYER);
--정남일 선수가 속한 팀의 선수들검색
SELECT * FROM PLAYER WHERE TEAM_ID = (SELECT TEAM_ID FROM PLAYER WHERE PLAYER_NAME = '정남일' );
--선수들 중 키가 평균키보다 크고 k01팀에 속한 선수들 검색
SELECT * FROM PLAYER WHERE TEAM_ID = 'K01' AND HEIGHT > (SELECT AVG(HEIGHT) FROM PLAYER);
--사원들(EMP) 중 이름에 L이 있는 사원들의 부서명과 지역 검색
SELECT P.ENAME "사원명", P.DEPTNO "사원번호",T.DNAME "부서명", T.LOC "지역" FROM EMP P JOIN DEPT T ON T.DEPTNO = P.DEPTNO
WHERE P.ENAME LIKE('%L%');
SELECT * FROM DEPT;
--이윤나 학생이 속한 과 조교수의 급여보다 급여를 더 받는 교수들 검색
SELECT * FROM T_PROFESSOR 
WHERE PAY > (SELECT PAY FROM T_PROFESSOR WHERE "POSITION" ='조교수'
AND DEPTNO = (SELECT DEPTNO1 FROM T_STUDENT WHERE NAME ='이윤나'));

-- GROUP에게 조건을 줄때 HAVING // 데이터 자체에 조건을 줄때 WHERE ★★★★★★★★★★★
--각 팀별로 김장관 선수보다 늦게 태어난 선수의 수 검색
SELECT TEAM_ID, COUNT(*) FROM PLAYER 
WHERE BIRTH_DATE > (SELECT BIRTH_DATE FROM PLAYER WHERE PLAYER_NAME='김장관')
GROUP BY TEAM_ID;

--PLAYER/ 왕선재 선수와 생일이 같은 선수들 검색(팀 아이디로 정렬)
SELECT * FROM PLAYER WHERE TO_CHAR(BIRTH_DATE,'MM-DD') = TO_CHAR((SELECT BIRTH_DATE FROM PLAYER WHERE PLAYER_NAME='왕선재'),'MM-DD') ORDER BY TEAM_ID;
--PLAYER/ 정현수 선수가 속한 팀의 선수들 중 키가 평균키보다 큰 선수들 검색(컬럼 IN (값1,값2...))
-- WHERE 절의 등호나 부등호는 오른쪽의 값이 반드시 한개만 와야만 한다.
-- 그래서 여러개 일때는 IN 써야 한다.
SELECT * FROM PLAYER  WHERE HEIGHT > (SELECT AVG(HEIGHT) FROM PLAYER) AND TEAM_ID IN (SELECT TEAM_ID FROM PLAYER WHERE PLAYER_NAME ='정현수');
-- JOBS EMPLOYEES / JOB_TITLE중 MANAGER 라는 문자열 ㅣ포함된 직원들
-- 평균연봉을 JOB_TITLE별로 검색
-- 검색하는 거!!에 다른 테이블꺼가 있으면 JOIN이 필요한거다.
SELECT JOB_ID FROM JOBS WHERE JOB_TITLE LIKE('%Manager%');
SELECT * FROM EMPLOYEES;

SELECT J.JOB_TITLE, AVG(SALARY) 
FROM EMPLOYEES E, JOBS J 
WHERE E.JOB_ID IN (SELECT J.JOB_ID FROM JOBS WHERE JOB_TITLE LIKE('%Manager%')) AND E.JOB_ID = J.JOB_ID GROUP BY J.JOB_TITLE;

--PLAYER / 축구선수들 중 각 팀별로 키가 가장 큰 선수들 검색
-- IN을 이용하면 두개이상을 비교할 수도 있다.
-- TEAM_ID와 HEIGHT를 꺼내 오면서 --> IN 뒤에 있는 테이블(각 팀별 최대키)과 비교하면서 맞는것만 출력
SELECT * FROM PLAYER 
WHERE (TEAM_ID,HEIGHT) IN (SELECT TEAM_ID, MAX(HEIGHT) FROM PLAYER GROUP BY TEAM_ID ) -- 각 팀별 최대
ORDER BY TEAM_ID;
--STADIUM/ 경기장 중 경기일정이 20120501~20120503 사이에 있는 경기장 검색
SELECT * FROM SCHEDULE;
SELECT * FROM STADIUM 
WHERE STADIUM_ID IN (SELECT STADIUM_ID FROM SCHEDULE WHERE SCHE_DATE BETWEEN '20120501' AND '20120503');

--EMPLYOEES/ DEN의 전화번호와 앞 3자리가 같은 사원들 검색
SELECT * FROM EMPLOYEES WHERE SUB_STAR(PHONE_NUMBER,3) = SUB_STAR((SELECT PHONE_NUMBE FROM EMPLOYEES WHERE LAST_NAME ='DEN' ),3);
--EMPLOYEES / 평균 급여보다 적게 받는 사원들의 급여 10프로 인상시키기
--김영조 교수와, 김영조 교수보다 입사일이 늦지만 급여가 높은 교수들의 교수번호, 이름 , 급여 검색









