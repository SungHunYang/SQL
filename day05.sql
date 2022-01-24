--문자 함수

-- 문자열 붙임, 자르기
--CONCAT() / SUBSTR()
SELECT CONCAT('FLO','WER') FROM DUAL; -- 문자열 대신에 컬럼도 적을 수 있다. || 과 동일
-- 무조건 2개만 연결 할 수 있음
SELECT SUBSTR('FLOWER',3), SUBSTR('FLOWER',2,3) FROM DUAL;
--SUBSTR('문자열',N) : N번째 글자부터 끝까지 잘라내기
--SUBSTR('문자열',N,M) : N번째 글자부터 N 길이 만큼 잘라내기
-- SUBSTR에서 숫자는 인덱스 번호라고 생각하면 된다. 대신 1번부터 시작하는 인덱스

--'BUSTAXIMETROCYCLE' ---> BUSCYCLE
SELECT CONCAT(SUBSTR('BUSTAXIMETROCYCLE',1,3),SUBSTR('BUSTAXIMETROCYCLE',13)) NAME FROM DUAL;

--문자열 길이
--LENGTH('문자열') : 해당 문자열의 길이
SELECT LENGTH('HELLO') FROM DUAL;

SELECT * FROM T_STUDENT WHERE LENGTH(ID)<6;

--INITCAP() : 맨 첫글자만 대문자로 변환
--UPPER(), LOWER() : 전체 대문자로, 소문자로 변환

--INSTR('문자열','찾는문자열',N,M) : N번째 부터 M번째로 등장하는 찾는 문자열의 위치를 반환 (없으면 0으로 리턴)
SELECT INSTR('A*B*C*D*E*','*',1,1) FROM DUAL; 
SELECT INSTR('A*B*C*D*E*','*',1,3) FROM DUAL;
SELECT INSTR('A*B*C*D*E*','*',-1,3) FROM DUAL; -- 음수는 반대 방향으로 세고 , 맨 끝이 인덱스가 -1


--T-STUDENT 테이블 / 1전공이 101인 학생의 이름, 전화 번호, 지역 번호

SELECT NAME 이름, TEL "전화 번호", SUBSTR(TEL,1,INSTR(TEL,')',1,1)-1) "지역번호", DEPTNO1 "전공" FROM T_STUDENT WHERE DEPTNO1=101;
--SUBSTR(TEL,1,INSTR(TEL,')',1,1)-1) "지역번호" 숫자만 나오게 하려고  INSTR(TEL,')',1,1) 통해서 ' ) '  이전의 숫자만 나오게 한거다.

--LPAD(), RPAD() : 문자열의 왼쪽, 오른쪽에 문자열 채워넣기

--LTRIM(), RTRIM() : 문자열 제거 왼쪽에서 잘라냄, 오른쪽에서 잘라냄
-- 보통 공백 지울 때 사용
SELECT LTRIM('     데이터',' ') FROM DUAL;
SELECT RTRIM('데이터            ',' ') FROM DUAL;

--REPLACE('문자열1','문자열2','문자열3') : 문자열1에서 문자열2를 찾아서 문자열3으로 변경
SELECT REPLACE('슈퍼맨 슈퍼우먼 슈퍼마켓 슈퍼주니어 슈퍼파워','슈퍼','베트') "이름" FROM DUAL;

--T_STUDENT / 102 학과의 학생의 성만 #으로 바꿔서 검색
SELECT REPLACE(NAME,SUBSTR(NAME,1,1),'#') "이름", DEPTNO1 "학과" FROM T_STUDENT WHERE DEPTNO1 = 102;

--T_STUDENT의 전화번호 가운데 자리만 '###'으로 바꿔서 검색

--------------------------------------------------------------------------------------------------------

--숫자 함수

--ABS() : 절대값
SELECT ABS(-10) FROM DUAL;
--SIGN() : 부호판별
SELECT SIGN(1000), SIGN(0), SIGN(-412) FROM DUAL; --  '0'은 0 / '-' 는 -1 / '+' 는  1
--MOD(N,M) : N을 M으로 나눈 나머지
SELECT MOD(10,3) FROM DUAL;
--CEIL(), FLOOR() : 올림 , 내림
SELECT CEIL(3.14), FLOOR(3.14) FROM DUAL;
SELECT CEIL(-3.14), FLOOR(-3.14) FROM DUAL; -- 이게 올림 내림인데 수학적으로 나온다기 보다는 올림(값보다 큰 최근접정수), 내림(값보다 작은 최근접정수) 음수일때 헷갈리지 않게 조심

--ROUND() : 반올림
--ROUND(숫자,N) : N은 써도 되고 안써도 되는데 나오기 바라는 자릿수를 집어 넣으면 된다. N을 안쓰면 정수
SELECT ROUND(3.141592,3) FROM DUAL;
--TRUNC() : 버림
SELECT TRUNC(3.141592,2) FROM DUAL;

SELECT FLOOR(-3.14), TRUNC(-3.14) FROM DUAL;

--POWER() : 제곱수
SELECT POWER(2,3) FROM DUAL;
SELECT POWER(2,1/2) FROM DUAL; --루트

--SYSDATE : 현재시간
SELECT SYSDATE - HIREDATE FROM T_PROFESSOR; -- SYSDATE 현재 시간  / 그래서 두개를 뺴면 지금까지 흐른 시간이 나온다.
----------------------------------------------------------------------------------------------------

-- NULL처리 함수

--NVL(컬럼명, 대체할값) : 컬럼의 값이 NULL인 경우 대체할 값으로 대신 사용
--T_PROFESSOR / 이름, 급여, 보너스, 연봉(급여*12 + 보너스)
SELECT 
	NAME 이름,
	PAY 급여,
	NVL(BONUS,0) 보너스,
	PAY*12+NVL(BONUS,0) 연봉
FROM T_PROFESSOR;

--NVL2(컬럼명,값1,값2) : 컬럼의 값이 NULL인 경우 값2로 대체, NULL이 아닌 경우 값1( 컬럼값 그대로 쓰고싶으면 값1에 컬럼명 넣으면 된다.)
SELECT 
	NAME 이름,
	PAY 급여,
	NVL2(BONUS,BONUS,0) 보너스 -- 이거 할때 문자열과 숫자 형식 잘맞춰서 해야한다. 문자열끼리 아니면 숫자끼리 이렇게
FROM T_PROFESSOR;

------------------------------------------------------------------------------------------------------------

-- 형변환 함수

-- 자동 형변환(묵시적 형변환)
-- [숫자]와 [숫자로 이루어진 문자열]을 연산하게 되면 자동적으로 숫자로 변환해준다.
SELECT 1+'1' FROM DUAL;

--강제 형변환(명시적 형변환)
--형변환 함수 이용

--TO_CHAR (숫자 -> 문자) / (날짜 -> 문자)
--TO_CHAR(숫자,'FORMAT') -> FORMAT은 선택
SELECT TO_CHAR(650000000,'9,999,999,999') FROM DUAL;
SELECT TO_CHAR(1234,'99999.999999') FROM DUAL;
SELECT TO_CHAR(1234,'99999') FROM DUAL; -- 자리수 넘어가면 빈자리로 표시
SELECT TO_CHAR(1234,'099999') FROM DUAL; -- 0을 넣으면 빈자리는 0으로 된다.
SELECT TO_CHAR(SYSDATE) FROM DUAL;
SELECT TO_CHAR(SYSDATE,'YYYY') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'RRRR') FROM DUAL; -- R로 하면 좀더 확실하게 표현됨
SELECT TO_CHAR(SYSDATE,'YEAR') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'MON') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'MONTH') FROM DUAL;

--TO_NUMBER (문자 -> 숫자)
SELECT TO_NUMBER('10.1') FROM DUAL;

--TO_DATE (문자 -> 날짜)
SELECT TO_DATE('2002-05-31','YYYY-MM-DD') FROM DUAL;

------------------------------------------------------------------------------------------

--그룹 함수

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
--PLAYER 테이블에서 키로 오름차순 정렬 후 같은 그룹은 이름으로 오름차순 정렬
SELECT PLAYER_NAME, HEIGHT FROM PLAYER ORDER BY HEIGHT, PLAYER_NAME; -- HEIGHT로 정렬 한뒤 , PLAYER_NAME으로 정렬

-- 검색된 컬럼중 2번째 컬럼(HEIGHT) 기준으로 정렬
SELECT PLAYER_NAME, HEIGHT FROM PLAYER ORDER BY 2; 
-- ORDER BY는 컬럼의 별칭으로도 사용 가능
SELECT PLAYER_NAME 선수이름, HEIGHT 키 FROM PLAYER ORDER BY 키;

--선수들중 각 팀별 최대키
SELECT 
	TEAM_ID,
	 MAX(HEIGHT)
FROM PLAYER GROUP BY TEAM_ID;

SELECT TEAM_ID, HEIGHT, PLAYER_NAME
FROM PLAYER;

------------------------------------------------------------

-- T_PROFESSOR / 학과 별로 교수들의 평균 보너스 검색 / 평균 보너스는 소수점 2째자리까지 검색
SELECT 
	DEPTNO "학과",
	ROUND(AVG(NVL(BONUS,0)),2) "보너스 평균"
FROM T_PROFESSOR GROUP BY DEPTNO ORDER BY DEPTNO;

--EMPLOYEES
--JOB_ID 별로 평균 SALARY가 10000미만인 JOB_ID를
--SALARY 합계, 평균, 최대값, 최소값, 명수 검색
--JOB_ID 알파벳 순으로 정렬
SELECT JOB_ID, SUM(SALARY) "합계",AVG(SALARY) "평균", MAX(SALARY) "최대값", MIN(SALARY) "최소값", COUNT(SALARY) "명 수"
FROM EMPLOYEES HAVING AVG(SALARY)< 10000 GROUP BY JOB_ID ORDER BY JOB_ID;

--T_PROFESSOR
--부서별 평균 급여를 검색하되 평균 급여가 450보다 많은 부서만 검색
SELECT 
DEPTNO "부서", AVG(PAY) "평균 급여"
FROM T_PROFESSOR HAVING AVG(PAY)>450 GROUP BY DEPTNO;

SELECT * FROM T_PROFESSOR;
--PLAYER
--몸무게가 80이상인 선수들의 평균키가 180이상인 포지션 검색
SELECT
"POSITION" "포지션", AVG(NVL(HEIGHT,0)) "평균키"
FROM PLAYER WHERE NVL(WEIGHT,0)>=80  HAVING AVG(NVL(HEIGHT,0))>=180 GROUP BY "POSITION";

SELECT * FROM PLAYER;
--T_PROFESSOR
--학과별 그리고 직급별로 교수들의 평균 급여 검색
SELECT 
DEPTNO "학과", "POSITION" "직급", AVG(PAY) "평균 급여"
FROM T_PROFESSOR GROUP BY DEPTNO,"POSITION" ORDER BY DEPTNO,"POSITION";
--T_EMP
--매니저(MGR) 별로 관리하는 직원들의
--매니저, 직원수, 급여총액, 급여평균, 교통비(COMM) 평균검색
--단, 사장님은 제외
SELECT 
MGR "매니저", AVG(EMPNO) "직원수", AVG(SAL) "급여평균", SUM(SAL) "급여총액", AVG(NVL(COMM,0)) "교통비 평균"
FROM T_EMP GROUP BY MGR;
SELECT * FROM T_EMP;
--T_PROFESSOR / 직위가 정교수 혹은 조교수인 사람들을
--과별로 과번호, 소속교수 총수, 근속일 평균, 급여 평균, 보너스 평균 검색
SELECT 
DEPTNO "학과", COUNT(DEPTNO) "소속교수 총수", TO_CHAR(TRUNC(AVG(SYSDATE-HIREDATE)))||'일' "근속일 평균", AVG(PAY) "급여평균", AVG(NVL(BONUS,0)) "보너스 평균"
FROM T_PROFESSOR WHERE "POSITION"='정교수' OR "POSITION"='조교수' GROUP BY DEPTNO ORDER BY DEPTNO;
--T_STUDENT / 학과별로 학과번호, 최대몸무게와 최소몸무게의 차이 검색
--차이가 30이상인 학과만 검색
SELECT 
DEPTNO1 "학과번호", TO_NUMBER(MAX(WEIGHT)-MIN(WEIGHT)) "최대 최소 차이"
FROM T_STUDENT GROUP BY DEPTNO1 HAVING TO_NUMBER(MAX(WEIGHT)-MIN(WEIGHT))>=30 ;









