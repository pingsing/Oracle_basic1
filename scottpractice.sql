--DQL(질의어) 데이터조회
--select 컬럼명
--from 테이블명

--전체데이터
select empno, ename, job, mgr, hiredate, sal, comm, deptno
from emp;

--부분컬럼 데이터
select empno, ename, sal
from emp;

select deptno
from emp;

select DISTINCT deptno
from emp;

select job
from emp;

select DISTINCT (job)
from emp;

select ename, sal
from emp;

-- +, -, *, / 나머지 연산자는 없다
-- 컬럼을 대상으로 연산한다.
-- null 값은 연산이 불가하다.
-- 컬럼에 별칭을 사용할 수 있다.
select ename, sal, sal * 12
from emp;

select ename as 사원명, sal, sal * 12+nvl(comm,0) as 연봉, comm
from emp;

--데이터 정렬
--select 컬럼명
--from 테이블명
--order by 컬럼명(정렬 기준이 되는 값) asc(오름차순)/desc(내림차순)

select *
from emp
order by sal asc;   --오름차순 정렬

select *
from emp
order by sal asc;   --내림차순 정렬

select *
from emp
order by sal;   --오름차순은 생략이 가능하다.
--숫자(1~10), 날짜(과거~최근날짜), 문자(사전순서)

--조건검색
--select 컬럼명
--from 테이블명
--where 조건식; <, >, =, != / <>, <=. >=. and, or

SELECT *
FROM emp
WHERE sal >= 3000;  --급여가 3000 이상인 사원

SELECT *
FROM emp
WHERE deptno = 30;

--and 두가지 이상의 조건이 모두 참인 경우

SELECT *
FROM emp
WHERE deptno = 30 and job = 'SALESMAN' and empno = 7499;

SELECT *
FROM emp
WHERE ename = 'FORD';    --소문자 ford는 없다

--날짜를 조건절에 사용할 때
--' '
--날짜도 크기가 있다
--80/12/20 → 1980 12 20 시간 분 초 요일

SELECT *
FROM emp
WHERE hiredate < '1982/01/01';

--OR 두개 이상의 조건중에 하나 이상 참인 경우
SELECT *
FROM emp
WHERE deptno = 10 or sal >= 2000;

--NOT 논리부정 연산자

SELECT *
FROM emp
WHERE sal != 3000;

SELECT *
FROM emp
WHERE not sal = 3000;

--AND, OR
--범위 조건을 표현 할 때 사용

SELECT *
FROM emp
WHERE sal >= 1000 and sal <= 3000;

SELECT *
FROM emp
WHERE sal <= 1000 OR sal >= 3000;

--BETWEEN AND
SELECT *
FROM emp
WHERE sal >= 1000 and sal <= 3000;

SELECT *
FROM emp
WHERE sal BETWEEN 1000 AND 3000;

--IN
SELECT *
FROM emp
WHERE sal = 800 OR sal = 3000 OR sal = 5000;

SELECT *
FROM emp
WHERE sal IN(800, 3000, 5000);

--LIKE 연산자
--값의 일부만 가지고 데이터를 조회한다.
-- 와일드카드를 사용한다 (%, _)
SELECT *
FROM emp
WHERE ename = 'FORD';

SELECT *
FROM emp
WHERE ename LIKE 'F%';  --F%: F뒤에 어떤 문자건 상관 없다.

SELECT *
FROM emp
WHERE ename LIKE '%D';

SELECT *
FROM emp
WHERE ename LIKE '%C';

--LIKE
--%, _
SELECT *
FROM emp
WHERE ename LIKE '%O%';

SELECT *
FROM emp
WHERE ename LIKE '___D';

SELECT *
FROM emp
WHERE ename LIKE 'S___%';

--NULL 연산자
--IS NULL / IS NOT NULL
SELECT *
FROM emp
WHERE COMM = null;  --null은 비교 불가

SELECT *
FROM emp
WHERE COMM IS null;

SELECT *
FROM emp
WHERE COMM IS NOT null;

--집합연산자
--두개의 SELECT 구문을 사용한다
--컬럼의 개수가 동일해야 한다.
--컬럼의 타입이 동일해야 한다.
--컬럼의 이름은 상관없다.
--합집합, 교집합, 처집합

SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno = 10;

SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno = 20;

SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno = 10
UNION   --합집합
SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno = 20;

SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno = 10
UNION ALL  --합집합, 조건식을 모두 더한 데이터
SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno = 20;

SELECT empno, ename, sal, deptno
FROM emp
MINUS   --차집합, 조건식을 뺀 나머지의 데이터
SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno = 10;

SELECT empno, ename, sal, deptno
FROM emp
INTERSECT   -- 교집합, 공통으로 포함하는 요소로 이루어진 데이터
SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno = 10;

--WHERE
--비교연산자, 논리연산자, LIKE, IS NULL, IS NOT NULL, UNION, UNION ALL, MINUS, INTERSECT
-- <, >, <=, >=, =, !=
-- AND, OR, NOT, BETWEEN A AND B, IN
-- LIKE(%, _)
-- IS NULL, IS NOT NULL
-- UNION, UNION ALL, MINUS, INTERSECT

--1번문제
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE ename LIKE '%S';

--2번문제
SELECT empno, ename, job, sal, deptno
FROM emp
WHERE deptno = 30 AND job LIKE 'SALESMAN';

--3번문제
SELECT empno, ename, sal, deptno
FROM emp
WHERE (deptno = 20 or deptno = 30) AND sal > 2000;

SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno = 20 AND sal>2000
UNION
SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno = 30 AND sal>2000;

--4번문제
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE sal<2000 or sal>3000;

--5번문제
SELECT ename, empno, sal, deptno
FROM emp
WHERE ename LIKE '%E%' AND deptno = 30
INTERSECT
SELECT ename, empno, sal ,deptno
FROM emp
WHERE sal NOT BETWEEN 1000 AND 2000;

--6번문제
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE comm IS null 
AND mgr IS NOT null
AND job IN('MANAGER', 'CLERK')
AND ename NOT LIKE '_L%';

--함수
--문자함수
--숫자함수
--날짜함수

SELECT 'Welcome', UPPER('Welcome')
FROM dual;

SELECT LOWER(ename), UPPER(ename)
FROM emp;

SELECT *
FROM emp
WHERE ename = 'FORD';

SELECT *
FROM emp
WHERE LOWER(ename) = 'scott';

SELECT ename,LENGTH(ename)
FROM emp;

SELECT 'Welcome to Oracle', substr('Welcome to Oracle', 2, 3), substr('Welcome to Oracle', 10)
FROM dual;

SELECT 'Welcome to Oracle', substr('Welcome to Oracle', -3, 3), substr('Welcome to Oracle', -17)
FROM dual;

SELECT INSTR('Welcome to Oracle', 'o')
FROM dual;

SELECT INSTR('Welcome to Oracle', 'o', 6)
FROM dual;

SELECT INSTR('Welcome to Oracle', 'e', 3, 2)
FROM dual;

SELECT 'Welcome to Oracle',replace('Welcome to Oracle', 'to', 'of')
FROM dual;

SELECT 'oracle',LPAD('oracle', 10, '#'),RPAD('oracle',10,'*')
FROM dual;