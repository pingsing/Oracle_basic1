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
from emp e full outer join emp m -- 데이터가 있는 쪽을 지정한다.
on e.mgr = m.empno;

select e.empno, e.ename, e.sal, d.deptno, d.dname, s.grade
from emp e inner join dept d
on e.deptno = d.deptno
inner join salgrade s
on e.sal between s.losal and s.hisal;

select e.ename, e.sal, d.deptno, d.dname
from emp e inner join dept d
on e.deptno = d.deptno;

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

-- 서브쿼리
-- select 구문을 중첩해서 사용하는 것(where)

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

--DML(데이터조작어): insert, update, delete
--insert: 테이블에 데이터 삽입
--insert into 테이블명 (컬럼명1, 컬럼명2,...)
--values (값1, 값2, ...)
--컬럼과 값의 타입과 갯수가 일치해야 한다.
--작성 순서대로 1:1 매칭된다.

--테이블 생성하기
create table dept_temp
as
select * from dept;

select *
from dept_temp;

--테이블 데이터 삽입
insert into dept_temp (deptno, dname, loc)
values (50,'DATABASE','SEOUL');

insert into dept_temp --컬럼 생략, 모든 컬럼에 데이터를 넣겠다는 의미
values (70,'HTML','SEOUL');

insert into dept_temp (deptno, dname)  --묵시적 NULL 데이터 삽입
values(60,'JSP');

insert into dept_temp   --컬럼생략, 명시적 NULL 데이터 삽입
values (80, NULL, 'SEOUL');

create table emp_temp
as
select * from emp
where 1 != 1;

select *
from emp_temp;

insert into emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (9999, '홍길동', 'PRESIDENT', NULL, '2001/01/01', 5000, 1000, 10);

insert into emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (3111, '심청이', 'MANAGER', 9999, SYSDATE, 4000, NULL, 30);

--update: 컬럼의 데이터를 변경(수정)
--update 테이블명
--set 컬럼명 = 값, 컬럼명 = 값 ...
--where 조건식
--조건식을 사용하지 않으면 해당 컬럼이 모두 변경된다.

drop table dept_temp2;  -- 테이블 삭제

create table dept_temp2
as
select * from dept;

select *
from dept_temp2;

update dept_temp2
set loc = 'SEOUL';

update dept_temp2
set dname = 'DATABASE', loc = 'SEOUL'
where deptno = 40;

--delete(데이터 삭제)
--delete from 테이블명
--where 조건식
--조건절을 사용하지 않으면 모든 데이터가 삭제된다.

drop table emp_temp2;

create table emp_temp2
as
select * from emp;

select *
from emp_temp2;

delete from emp_temp2
where ename = 'SCOTT';

--TCL(데이터의 영구저장 또는 취소)
--트랜젝션
--commit, rollback, savepoint

--commit: 데이터 영구저장(테이블이 데이터 반영)
--create구문을 사용해서 객체 생성할 때

--rollback: 데이터 변경 취소(테이블이 데이터 미반영), 원상복구
--천재지변, 절전 등 자동

--drop, 테이블 제거
drop table dept01;

--delete, 테이블 항목 제거
delete from dept01;

--truncate, 롤백이 불가능한 delete
truncate table dept01;

create table dept01
as
select * from dept;

select *
from dept01;

--commit
commit;

--rollback
rollback;

--DDL(데이터 정의어): table을 생성, 삭제, 변경할 때 사용한다.
--create(생성), alter(변경), drop(삭제)

create table 테이블명(  --table(객체)
    컬럼명1 타입,    --column(속성)
    컬럼명2 타입,
    컬럼명3 타입
);

-- 테이블 생성
create table emp_pt(
    --사원번호, 사원이름, 직책, 관리자, 입사일자, 급여, 성과급, 부서번호
    empno number(4),
    ename varchar2(10), --byte
    job varchar2(9),
    mgr number(4),
    hiredate date,
    sal number(7,2),
    comm number(7,2),
    deptno number(2)
);

select *
from emp_pt1;

insert into emp_pt1(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (9999, '이순신', 'PRESIDENT', NULL, '2001/01/01', 5000, 1000, 10);

--테이블의 복사
create table dept_ddl
as
select * from dept;

--테이블의 일부분 복사
create table dept_30
as
select * from dept
where deptno = 30;

create table dept_m
as
select dname, loc
from dept;

select * from dept_d;

--테이블의 구조만 복사
create table dept_d
as
select * from dept
where 1 != 1;

--테이블 변경(컬럼의 정보 수정)
--새로운 컬럼추가, 
--alter

create table emp_alter
as
select * from emp;

select * from emp_alter;

--add, 컬럼 추가
alter table emp_alter
add address varchar2(100);

--rename, 컬럼 이름 변경
alter table emp_alter
rename column address to addr;

--modify, 타입 크기 늘리기
alter table emp_alter
modify empno number(10);

desc emp_alter;

--drop, 컬럼 삭제, 롤백 불가.
alter table emp_alter
drop column addr;

drop table emp_alter;

select *
from emp_alter;


--문제 풀기

create table CHAP10HW_EMP as select * from emp;
create table CHAP10HW_DEPT as select * from dept;
create table CHAP10HW_SALGRADE as select * from salgrade;

select * from chap10hw_dept;

--Q1
insert into chap10hw_dept
values (50, 'ORACLE', 'BUSAN');

insert into chap10hw_dept
values(60, 'SQL', 'ILSAN');

insert into chap10hw_dept
values(70, 'SELECT', 'INCHEON');

insert into chap10hw_dept
values(80, 'DML', 'BUNDANG');

select * from chap10hw_emp order by deptno;

--Q2
insert into chap10hw_emp
values(7201, 'TEST_USER1', 'MANAGER', 7788, '2016-01-02', 4500, NULL, 50);

insert into chap10hw_emp
values(7202, 'TEST_USER2', 'CLERK', 7201, '2016-02-21', 1800, NULL, 50);

insert into chap10hw_emp
values(7203, 'TEST_USER3', 'ANALYST', 7201, '2016-04-11', 3400, NULL, 60);

insert into chap10hw_emp
values(7204, 'TEST_USER4', 'SALESMAN', 7201, '2016-05-31', 2700, 300, 60);

insert into chap10hw_emp
values(7205, 'TEST_USER5', 'CLERK', 7201, '2016-07-20', 2600, NULL, 70);

insert into chap10hw_emp
values(7206, 'TEST_USER6', 'CLERK', 7201, '2016-09-08', 2600, NULL, 70);

insert into chap10hw_emp
values(7207, 'TEST_USER7', 'LECTURER', 7201, '2016-10-28', 2300, NULL, 80);

insert into chap10hw_emp
values(7208, 'TEST_USER8', 'STUDENT', 7201, '2018-03-09', 1200, NULL, 80);

--Q3
update chap10hw_emp
set deptno = 70
where sal > (select avg(sal) from chap10hw_emp where deptno = 50);

--Q4
update chap10hw_emp
set deptno = 80, sal = sal * 1.1
where hiredate > (select min(hiredate) from chap10hw_emp where deptno = 60);

select *
from chap10hw_salgrade;

--Q5
delete from chap10hw_emp
where empno in (select e.empno from chap10hw_emp e, chap10hw_salgrade s where e.sal between s.losal and s.hisal and s.grade = 5);


--사용자 테이블 조회
desc user_tables;

select table_name
from user_tables;

select table_name
from all_tables;

select owner, table_name
from all_tables;

--index(검색속도를 향상하기 위해 사용하는 객체)
--select 구문의 검속을 향상시킨다.
--전체 레코드의 3% ~ 5% 정도일 때.
--index 객체를 컬럼에 생성해서 사용한다.

create index 인덱스명
on 테이블명(컬럼명);

create table emp01
as
select * from emp;

select *
from emp01;

insert into emp01
select * from emp01;

insert into emp01(empno, ename)
values (1111, 'BTS');

select empno, ename
from emp01
where ename = 'BTS';

--인덱스 생성
create index idx_emp01_ename
on emp01(ename);

select empno, ename
from emp01
where ename = 'BTS';

drop index idx_emp01_ename;

--버린 테이블 조회
show recyclebin;

flashback table emp_alter
to before drop;

--제약조건(무결성): 잘못된 값이 데이터로 사용되는 것을 방지
--not null
--unique
--primary key(기본키)
--foreign key
--1. 부모와 자식의 관계를 가지는 테이블에 자식쪽 테이블에 컬럼에 설정한다.
--2. 부모쪽 테이블의 컬럼은 반드시 primary key 또는 unique 조건이 있어야 한다.
--3. null데이터를 허용한다.
--check
--default

--emp, dept
insert into emp
values (1111, 'aaa', 'MANAGER', 9999, SYSDATE, 1000, NULL, 50);

--ORA-02291: 무결성 제약조건(SCOTT.FK_DEPTNO)이 위배되었습니다- 부모 키가 없습니다

drop table emp02;

delete from emp02;

--constraint: 제약조건 별칭 부여
--constraint 제약조건을 알아볼 수 있는 별칭
create table emp02(
    empno number(4) constraint emp01_empno_pk primary key, --not null unique,
    ename varchar2(10) constraint emp01_ename_nn not null,
    job varchar2(9),
    deptno number(2)
);

insert into emp02
values (null, null, 'MANAGER', 30);

select * from emp02;

insert into emp02
values (1111, '홍길동', 'MANAGER', 30);

insert into emp02
values (2222, '홍길동', 'MANAGER', 30);

insert into emp02
values (null, '김유신', 'SALESMAN', 20);
--ORA-01400: NULL을 ("SCOTT"."EMP02"."EMPNO") 안에 삽입할 수 없습니다

insert into emp02
values (2222, '옥동자', 'SALESMAN', 10);
--ORA-00001: 무결성 제약 조건(SCOTT.SYS_C0011065)에 위배됩니다

create table emp07(
empno number(4) constraint emp07_empno_pk primary key,
ename varchar2(9) constraint emp07_ename_nn not null,
job varchar(9),
deptno number(2) constraint emp07_deptno_fk references dept07(deptno)
);

create table dept07(
deptno number(2) constraint dept07_deptno_pk primary key,
dname varchar2(20) constraint dept07_dname_nn not null,
loc varchar2(20) constraint  dept07_loc_nn not null
);

select * from dept07;
select * from emp07;

--서브쿼리문을 사용한 데이터 삽입
insert into dept07
select * from dept;

insert into emp07
select empno, ename, job, deptno from emp;

insert into emp07
values (1111, 'aaa', 'MANAGER', 50);

select * from emp08;

create table emp08(
empno number(4) primary key,
ename varchar2(10) not null,
sal number(7) constraint emp08_sal_ck check(sal between 500 and 5000),
gender varchar2(2) constraint emp08_gender_ck check(gender in ('M','F'))
);

insert into emp08
values (1111, 'hong', 1000, 'M');

insert into emp08
values (2222, 'kim', 200, 'M');

insert into emp08
values (3333, 'park', 1500, 'A');

create table dept08(
    deptno number(2) primary key,
    dname varchar2(10) not null,
    loc varchar2(15) default 'SEOUL'
);

select * from dept08;

insert into dept08(deptno, dname)
values (10,'SALES');

insert into dept08(deptno, dname, loc)
values (20,'SALES', 'BUSAN');

--제약조건 설정방식
--컬럼 레벨의 설정(not null은 컬럼 레벨에서만 적용할 수 있다.)
--테이블 레벨의 설정(not null을 적용할 수 없다.)

create table emp09(
    empno number(4),
    ename varchar2(20) constraint emp09_ename_nn not null,
    job varchar2(20),
    deptno number(20),
    
    constraint emp09_empno_pk primary key(empno),
    constraint emp09_job_uk unique(job),
    constraint emp09_deptno_fk foreign key(deptno) references dept(deptno) 
);

insert into emp09
values (3333,'hong','PRESIDENT',80);

--복합키(기본키를 두 개의 컬럼을 사용하는 경우)
--테이블 레벨 방식으로만 적용할 수 있다.)
--1. 테이블 안에서 정의하는 방식
--2. alter 명령어 사용방식

create table member(
    name varchar2(10),
    address varchar2(30),
    hphone varchar2(10),
    
    constraint member_name_address_pk primary key(name, address)
);

select * from emp10;

create table emp10 (
    empno number(4),
    ename varchar2(20),
    job varchar2(20),
    deptno number(20)
);

alter table emp10
    --add, 제약조건 추가
    add constraint emp10_empno_pk primary key(empno);

alter table emp10
    add constraint emp10_empno_fk foreign key(deptno) references dept(deptno);
    
-- not null은 변경의 개념(null → not null)
alter table emp10
    --modify, 제약조건 변경
    --컬럼 명은 앞에다가
    modify job constraint emp10_job_nn not null;
    
alter table emp10
    modify ename constraint emp10_ename_nn not null;
    
alter table emp10
    --drop, 제약조건 삭제
    drop constraint emp10_empno_pk; --제약조건명(constraint) 또는 제악조건(primary key)


create table emp11 (
    empno number(4),
    ename varchar2(20),
    job varchar2(20),
    deptno number(20)
);

alter table emp11 
    add constraint emp11_empno_pk primary key(empno);
    
alter table emp11 
    add constraint emp11_deptno_fk foreign key(deptno) references dept11(deptno);    

create table dept11 (
    deptno number(2),
    dname varchar2(10),
    loc varchar2(15)
);

alter table dept11
    add constraint dept11_deptno_pk primary key(deptno);

insert into dept11
select * from dept;

select * from dept11;

insert into emp11
select empno, ename,job, deptno
from emp;

select * from emp11;

delete from dept11
where deptno = 10;
-- 무결성 제약조건(SCOTT.EMP11_DEPTNO_FK)이 위배되었습니다- 자식 레코드가 발견되었습니다

alter table dept11
disable primary key cascade;

alter table dept11
drop primary key cascade;

create table dept_const(
    deptno number(2),
    dname varchar2(14),
    loc varchar(13)
);

alter table dept_const
    add constraint deptconst_deptno_pk primary key(deptno);

alter table dept_const
    add constraint deptconst_dname_unq unique(dname);
    
alter table dept_const
    modify loc constraint deptconst_loc_nn not null;
    
create table emp_const(
    empno number(4),
    ename varchar2(10),
    job varchar2(9),
    tel varchar2(20),
    hiredate date,
    sal number(7, 2),
    comm number(7, 2),
    deptno number(2)
);

alter table emp_const
    add constraint empconst_empno_pk primary key(empno);
    
alter table emp_const
    modify ename constraint empconst_ename_nn not null;
    
alter table emp_const
    add constraint empconst_tel_unq unique(tel);
    
alter table emp_const
    add constraint empconst_sal_chk check(sal between 1000 and 10000);
    
alter table emp_const
    add constraint empconst_deptno_fk foreign key(deptno) references dept_const(deptno);
    
--객체: table, index, view
--create or replace view 뷰테이블명([alias])
--as
--서브쿼리(select)
--[with check option]
--[with read only]

create table dept_copy
as
select * from dept;

create table emp_copy   --복사되는 테이블은 제약조건은 넘어오지 않는다.
as
select * from emp;

alter table emp_copy
add constraint emp_copy_deptno_fk foreign key(deptno) references dept(deptno);

select * from emp_copy; --14

create or replace view emp_view30
as
select empno, ename, sal, deptno from emp_copy
where deptno = 30;

grant create view -- view 테이블을 생성할 수 있는 권한부여, system에서 작동
to scott;

select * from emp_view30;
select * from emp_copy;

insert into emp_view30
values (1111, 'hong', 1000, 30);

insert into emp_view30 (empno, ename, sal)
values (2222, 'hong', 2000);

insert into emp_view30 (empno, ename, sal,deptno)
values (2222, 'hong', 2000, 50);

insert into emp_view30 (empno, ename, sal,deptno)
values (2222, 'hong', 2000, 30);

create or replace view emp_view(사원번호, 사원명, 급여, 부서번호)
as
select empno, ename, sal, deptno
from emp_copy;

select * from emp_view;

select *
from emp_view
where 부서번호 = 20;
--where deptno = 20; 별칭을 부여하면 원래 컬럼명 사용 불가능


--복합뷰
create or replace view emp_dept_view
as
select empno, ename, sal, e.deptno, dname, loc
from emp e inner join dept d
on e.deptno = d.deptno
order by empno desc;

select *
from emp_dept_view;

--부서별 최소급여와 최대급여
--dname min_sal max_sal

create or replace view sal_view
as
select dname, min(sal) as min_sal, max(sal) as max_sal
from emp e inner join dept d
on e.deptno = d.deptno
group by d.dname;

select *
from sal_view;