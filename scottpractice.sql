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
order by sal desc;   --내림차순 정렬

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
WHERE sal<2000 OR sal>3000;

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
--문자함수: upper, lower, substr, instr, replace, lpad, rpad, concat
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

SELECT 'oracle',LPAD('oracle', 10, '#'),RPAD('oracle',10,'*'),LPAD('oracle',10)
FROM dual;

SELECT RPAD('001103-',14,'*')
FROM dual;

SELECT concat(empno, ename), empno || '' || ename
FROM emp;

---숫자---
SELECT
    ROUND(1234.5678),
    ROUND(1234.5678,0),
    ROUND(1234.5678,1),
    ROUND(1234.5678,2),
    ROUND(1234.5678,-1)
FROM dual;

SELECT
    TRUNC(1234.5678),
    TRUNC(1234.5678,0),
    TRUNC(1234.5678,1),
    TRUNC(1234.5678,2)
FROM dual;  

SELECT
CEIL(3.14),     --자신보다 큰 가장 가까운 정수 4
FLOOR(3.14),    --자신보다 작은 가장 가까운 정수 3
CEIL(-3.14),    -- -3
FLOOR(-3.14)    -- -4
FROM dual;

SELECT MOD(5,2), MOD(10,4)
FROM dual;

SELECT *
FROM emp
WHERE MOD(empno, 2) = 1;

--날짜 데이터를 다루는 날짜 함수
--오늘
select sysdate
from dual;

--어제
select sysdate -1
from dual;

--내일
select sysdate +1
from dual;

--차이가 일수 반환
select sysdate - hiredate as 근무일수
from emp;

--근속년수
select trunc((sysdate-hiredate)/365) as 근무일수
from emp;
--포맷 모델
--CC: 네 자리 연도의 끝 두 자리를 기준으로 사용(2022년은 2050년 이하이므로 반올림 할 경우 2001년으로 처리).
--YYYY: 날짜 데이터의 해당 연, 월, 일의 7월 1일을 기준(2022년 10월 19일 일 경우, 2023년으로 처리).
--Q: 각 분기의 두 번째 달의 16일 기준(아직 11월 15일이 넘지 않았으므로 22년 10월 1일).
--DDD: 해당 일의 정오(12:00:00)를 기준(정오가 넘지 않았으므로 22년 10월 19일).
--HH: 해당일의 시간을 기준(22년 10월 19일 10:49 이므로 반올림해도 22년 10월 19일).
select sysdate,
    round(sysdate, 'CC') as format_CC,
    round(sysdate, 'YYYY') as format_YYYY,
    round(sysdate, 'Q') as format_Q,
    round(sysdate, 'DDD') as format_DDD,
    round(sysdate, 'HH') as format_HH  
from dual;

select sysdate,
    trunc(sysdate, 'CC') as format_CC,
    trunc(sysdate, 'YYYY') as format_YYYY,
    trunc(sysdate, 'Q') as format_Q,
    trunc(sysdate, 'DDD') as format_DDD,
    trunc(sysdate, 'HH') as format_HH  
from dual;

--자료형변환 함수
--to_char()
--to_number()
--to_date()

--날짜를 문자
select sysdate, to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS') as 현재시간
from dual;

select hiredate, to_char(hiredate, 'YYYY-MM-DD HH24:MI:SS') as 입사일자
from emp;

--숫자를 문자
select to_char(123456, '999,999')
from dual;

select to_char(123456, 'L999,999')
from dual;

select sal, to_char(sal, 'L999,999')
from emp;

--문자를 숫자로
select '20000' - 10000
from dual;

select 20000 - '10000'
from dual;

select '20000' - '5000'
from dual;

--to_number() 형변환을 해야한다.
select '20,000' - '5,000'
from dual;

select to_number('20,000','999,999') - to_number('5,000','999,999')
from dual;

--문자를 날짜로
select to_date('20221019','YYYY/MM/DD')
from dual;

select *
from emp
where hiredate < to_date('19820101','YYYY-MM-DD');

--null데이터 처리
--nvl(null, 바꾸고싶은 데이터)
--nvl은 null 데이터에 타입과 같은 타입을 변경해야 한다.
--nvl(숫자,숫자), nvl(문자,문자)
select ename 사원명,sal,sal*12 + nvl(comm,0) as 연봉,comm
from emp;

select *
from emp
where mgr is null;

select ename, job, mgr
from emp
where mgr is null;

select ename, job, nvl(mgr,'CEO') as mgr
from emp
where mgr is null;

--ORA-01722: 수치가 부적합합니다
--01722. 00000 -  "invalid number"
--*Cause:    The specified number was invalid.
--*Action:   Specify a valid number.

select ename, job, nvl(to_char(mgr,'9999'),'CEO') as mgr
from emp
where mgr is null;

select comm, nvl2(comm,'O','X')
from emp;

--조건문 표현 함수
--decode()  → switch
--case  → if
select ename,job,deptno,
decode(deptno, 10,'AAA',20,'BBB',30,'CCC','기타') as 부서명
from emp;

-- 범위를 조건으로 설정할 수 있다.
case
    when 조건식 then 실행문
    when 조건식 then 실행문
    when 조건식 then 실행문
    else 실행문
end as 별칭

select ename,job,deptno,
    case
    when deptno = 10 then 'AAA'
    when deptno = 20 then 'BBB'
    when deptno = 30 then 'CCC'
    else '기타'
end as 부서명
from emp;

select ename, job, sal,
case
    when sal between 3000 and 5000 then '임원'
    when sal >= 2000 and sal < 3000 then '관리자'
    when sal > 500 and sal < 2000 then '사원'
    else '기타'
end as 직무
from emp;

--문제풀기
--Q1
select empno, rpad(substr(empno,1,2),4,'*') as MASKING_EMPNO, ename, rpad(substr(ename, 1,1),5,'*') as MASKING_ENAME
from emp
where length(ename) >= 5 and length(ename) < 6;

--Q2
select empno, ename, sal, trunc(sal / 21.5,2) as DAY_PAY, round(((sal / 21.5)/8),1) TIME_PAY
from emp;

-Q3
select empno, ename, mgr,
case
    when mgr is null then '0000'
    when substr(mgr, 1, 2) = 75 then '5555'
    when substr(mgr, 1, 2) = 76 then '6666'
    when substr(mgr, 1, 2) = 77 then '7777'
    when substr(mgr, 1, 2) = 78 then '8888'
    else to_char(mgr)
end as CHG_MGR
from emp;

select sum(sal)
from emp;

select avg(sal)
from emp;

select count(*), count(comm)
from emp;

select max(sal), min(sal)
from emp;

--불가능
select ename, max(sal)
from emp;

select max(sal)
from emp;

--sum(),avg(),count(),max(),min()
--일반컬럼과 같이 사용 불가
--크기비교가 가능한 모든 타입에 사용 가능하다.

--select 컬럼명
--from 테이블명
--where 조건식
--group by 기준컬럼
--order by 컬럼명 정렬방식 → 맨 마지막에 작성

select avg(sal), 10 as deptno
from emp
where deptno = 10 
UNION ALL
select avg(sal), 20 as deptno
from emp
where deptno = 20
UNION ALL
select avg(sal), 30 as deptno
from emp
where deptno = 30;

select deptno
from emp
group by deptno;

select avg(sal)
from emp
group by deptno;

select deptno, avg(sal)
from emp
group by deptno;

select deptno, job, avg(sal)
from emp
group by deptno, job
order by deptno, job;

--select 컬럼명
--from 테이블명
--where 조건식
--group by 기준컬럼
--having 조건식
--order by 컬럼명 정렬방식 → 맨 마지막에 작성

select deptno, avg(sal)
from emp
group by deptno
having avg(sal) >= 2000;
--group by 에 의해서 조회 결과에 조건을 준다
--조건식을 작성할 때 그룹함수를 사용한다.

select deptno, avg(sal)
from emp
where deptno != 10
group by deptno
having avg(sal) >= 2000;

--조인(Join)
--2개 이상의 테이블에서 데이터를 조회
--from절에 두 개 이상의 테이블을 작성한다.
--cross join (where절 없이 조인)
--equi join (where 등가연산자: =)
--non equi join(where 범위연산자: and, or)
--self join (where 하나의 테이블을 사용한다)
--out join (where에 누락되는 데이터를 같이 조회하기위한 연산자: (+))

select emp.ename,emp.job,emp.deptno,dept.dname,dept.loc
from emp,dept
where emp.deptno = dept.deptno;

select ename,job,emp.deptno,dname,loc
from emp,dept
where emp.deptno = dept.deptno;

select ename,job,e.deptno,dname,loc
from emp e,dept d   --테이블에 별칭 부여
where e.deptno = d.deptno;

select ename,job,e.deptno,dname,loc
from emp e,dept d   --테이블에 별칭 부여
where e.deptno = d.deptno
and sal >= 3000;

select ename,sal,grade
from emp e,salgrade s
where e.sal between s.losal and s.hisal;
--where e.sal >= s.losal and e.sal <= s.hisal;

--사원번호, 이름, 급여, 부서번호, 부서명, 급여등급
select empno, ename, sal, d.deptno, dname, grade
from emp e, dept d, salgrade s
where e.deptno = d.deptno
and e.sal between s.losal and s.hisal;

--self join
select *
from emp;

select e.empno, e.ename, e.mgr, m.ename as 사수
from emp e, emp m   --반드시 별칭부여
where e.mgr = m.empno;

--scott 같은 부서에 근무하는 사원
select ename, deptno
from emp;


select work.ename, friend.ename
from emp work, emp friend
where work.deptno = friend.deptno
and work.ename = 'SCOTT'
and friend.ename = 'SCOTT';

select ename, mgr
from emp;

select *
from emp;

--외부조인
--등가 시 누락되는 데이터를 같이 조회하기 위해서 사용

select e.empno, e.ename, e.mgr, m.ename
from emp e, emp m   --반드시 별칭 부여
where e.mgr = m.empno(+);   --데이터가 없는 테이블쪽에 (+)를 붙인다.

select ename, sal, d.deptno, dname
from emp e, dept d
where e.deptno(+) = d.deptno;

--ANSI-JOIN(표준조인 방식)
--cross join
--inner join(equi, non equi)
--outer join( (+) ) //  [left, right, full] 방향 표시
--natural join
select ename, sal, dname, loc
from emp e inner join dept d
on e.deptno = d.deptno;

select ename, sal, dname, loc
from emp e inner join dept d
using(deptno)   --
where ename = 'SCOTT';

select e.empno, e.ename, e.mgr, m.ename
from emp e inner join emp m
on e.mgr = m.empno;

select e.empno, e.ename, e.sal, s.grade
from emp e inner join salgrade s
on e.sal between s.losal and s.hisal;

select e.empno, e.ename, e.mgr, m.ename
from emp e left outer join emp m -- 데이터가 있는 쪽을 지정한다.
on e.mgr = m.empno;

select e.empno, e.ename, e.sal, d.deptno, d.dname, s.grade
from emp e inner join dept d
on e.deptno = d.deptno
inner join salgrade s
on e.sal between s.losal and s.hisal;

select e.ename, e.sal, d.deptno, d.dname
from emp e right outer join dept d
on e.deptno = d.deptno;

--select ename, sal, d.deptno, dname
--from emp e, dept d
--where e.deptno(+) = d.deptno;

--1번문제
select d.deptno, d.dname, e.empno, e.ename, e.sal
from emp e inner join dept d
on e.deptno = d.deptno
and e.sal > 2000
order by d.deptno, sal, empno;

select deptno, d.dname, e.empno, e.ename, e.sal
from emp e inner join dept d
using(deptno)
where e.sal > 2000
order by deptno, sal, empno;

--2번문제
select d.deptno, dname, trunc(avg(sal)) as AVG_SAL, max(sal) as MAX_SAL, min(sal) as MIN_SAL, count(d.deptno) as CNT
from emp e inner join dept d
on e.deptno = d.deptno
group by d.deptno, dname;

--3번문제
select d.deptno, dname, empno, ename, job, sal
from emp e right outer join dept d
on e.deptno = d.deptno
order by d.deptno, ename;

--4번문제
select d.deptno, d.dname, e.empno, e.ename, e.mgr, e.sal, e.deptno, s.losal, s.hisal, s.grade, e.mgr as MGR_EMPNO, m.ename AS MGR_ENAME
from emp e right outer join dept d
on e.deptno = d.deptno
left outer join emp m
on e.mgr = m.empno
left outer join salgrade s
on e.sal between s.losal and s.hisal
order by d.deptno, e.empno;

select deptno
from emp
where ename = 'SCOTT';

select dname
from dept
where deptno = 20;

select dname
from dept
where deptno = (
    select deptno
    from emp
    where ename = 'SCOTT'
);

select ename, max(sal)
from emp;

select ename, sal
from emp
where sal = (
    select max(sal)
    from emp
);

--DALLAS
--이름, 부서번호

select ename, deptno
from emp
where deptno = (
    select deptno
    from dept
    where loc = 'DALLAS'
);

--자신의 직속상관이 KING인 사원의 이름과 급여를 조회하세요(서브쿼리)
select *
from emp;

select ename, sal
from emp
where mgr = (
    select empno
    from emp
    where ename = 'KING'
);

-- 다중행 서브쿼리
--in: 결과 중에 하나만 만족하면 된다.
-- > any: 결과 중에 가장 작은값보다 크면 된다
-- > all: 결과 중에 가장 큰 값보다 크면 된다

--in 연산자
select *
from emp
where sal in (5000, 3000, 2850);

select *
from emp
where sal in (
    select max(sal)
    from emp
    group by deptno
);

--any 연산자
select *
from emp
where sal > any (   --항상 부등호를 사용해야 한다.
    select max(sal)
    from emp
    group by deptno
);

select *
from emp
where sal < any (   --항상 부등호를 사용해야 한다.
    select max(sal)
    from emp
    group by deptno
);

--all 연산자
select ename, sal
from emp
where sal > all(select sal
    from emp
    where deptno = 30);
    
select *
from emp
where (deptno, sal) in (
    select deptno, max(sal)
    from emp
    group by deptno
);