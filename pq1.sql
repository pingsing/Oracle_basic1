--실습 4-1, EMP 테이블 구성 살펴보기
desc emp;

--실습 4-2, DEPT 테이블 구성 살펴보기
desc dept;

--실습 4-3, SALGRADE 테이블 구성 살펴보기
desc salgrade;

--실습 4-4, EMP 테이블 전체 열 조회하기
select * from emp;

--실습 4-5, 열을 쉼표로 구분하여 출력하기
select empno, ename, deptno
from emp;

--실습 4-6, DISTINCT로 열의 중복 제거하기
select distinct deptno
from emp;

--실습 4-7, 여러 개 열을 명시하여 중복 제거하기
select distinct job, deptno
from emp;

--실습 4-8, 직책, 부서 번호 출력하기(ALL 사용)
select all job, deptno
from emp;

--실습 4-9, 열에 연산식을 사용하여 출력하기
select ename, sal, sal*12+comm, comm
from emp;

--실습 4-10, 곱하기를 사용하지 않고 사원의 연간 총 수입 출력하기
select ename, sal, sal+sal+sal+sal+sal+sal+sal+sal+sal+sal+sal+sal+comm, comm
from emp;

--실습 4-11, 별칭을 사용하여 사원의 연간 총 수입 출력하기
select ename, sal, sal*12+comm as ANNSAL, comm
from emp;

--실습 4-12, EMP 테이블의 모든 열을 급여 기준으로 오름차순 정렬하기
select *
from emp
order by sal;

--실습 4-13, EMP 테이블의 모든 열을 급여 기준으로 내림차순 정렬하기
select *
from emp
order by sal desc;

--실습 4-14, EMP 테이블의 전체 열을 부서 번호(오름차순)와 급여(내림차순)로 정렬하기
select *
from emp
order by deptno asc, sal ,desc;

--Q2
select job
from emp
group by job;

--Q3
select empno as EMPLOYEE_NO, ename as EMPLOYEE_NAME, mgr as MANAGER, sal as SALARY, comm as COMMISSION, deptno as DEPARTMENT_NO
from emp
order by DEPARTMENT_NO desc, EMPLOYEE_NAME asc; 

--실습 5-1, EMP 테이블의 모든 열 출력하기
select *
from emp;

--실습 5-2, 부서 번호가 30인 데이터만 출력하기
select *
from emp
where deptno = 30;

--1min pt, 다음 SQL문의 결과로 사원 번호가 7782인 사원 정보만 나오도록 코드를 채워 보세요.
select *
from emp
where empno = 7782;

--실습 5-3, AND 연산자로 여러 개의 조건식 사용하기
select *
from emp
where deptno = 30
and job = 'SALESMAN';

--1min pt, 사원 번호가 7499이고 부서 번호가 30인 사원 정보만 나오도록 코드를 채워 보세요.
select *
from emp
where empno = 7499
and deptno = 30;

--실습 5-4,OR 연산자로 여러 개의 출력 조건 사용하기
select *
from emp
where deptno = 30
or job = 'CLERK';

--실습 5-5, 곱셉 산술 연산자를 사용한 예
select *
from emp
where sal * 12 = 36000;


--실습 5-6, 대소 비교 연산자를 사용하여 출력하기
select *
from emp
where sal >= 3000;

--실습 5-7, 문자를 대소 비교 연산자로 비교하기(비교 문자열이 문자 하나일 때).
select *
from emp
where ename >= 'F';

--실습 5-8, 문자열을 대소 비교 연산자로 비교하기(비교 문자열이 문자 여러 개일 때)
select *
from emp
where ename <= 'FORZ';

--실습 5-9, 등가 비교 연산자(!=)를 사용하여 출력하기
select *
from emp
where sal != 3000;

--실습 5-10, 등가 비교 연산자(<>)를 사용하여 출력하기
select *
from emp
where sal <> 3000;

--실습 5-11, 등가 비교 연산자(^=)를 사용하여 출력하기
select *
from emp
where sal ^= 3000;

--실습 5-12, NOT 연산자를 사용하여 출력하기
select *
from emp
where not sal = 3000;

--실습 5-13, OR 연산자를 사용하여 여러 개 조건을 만족하는 데이터 출력하기
select *
from emp
where job = 'MANAGER'
or job = 'SALESMAN'
or job = 'CLERK';

--실습 5-14, IN 연산자를 사용하여 출력하기
select *
from emp
where job in ('MANAGER', 'SALESMAN', 'CLERK');

--실습 5-15. 등가 비교 연산자와 AND 연산자를 사용하여 출력하기
select *
from emp
where job != 'MANAGER'
and job <> 'SALESMAN'
and job ^= 'CLERK';

--실습 5-16, IN 연산자와 논리 부정 연산자를 사용하여 출력하기
select *
from emp
where job not in('MANAGER', 'SALESMAN', 'CLERK');

--실습 5-17, 대소 비교 연산자와 AND 연산자를 사용하여 출력하기
select *
from emp
where sal >= 2000
and sal <= 3000;

--실습 5-18, BETWEEN A AND B 연산자를 사용하여 출력하기
select *
from emp
where sal between 2000 and 3000;

--실습 5-19, BETWEEN A AND B 연산자와 NOT 연산자를 사용하여 출력하기
select *
from emp
where sal not between 2000 and 3000;

--실습 5-20, LIKE 연산자 사용하여 출력하기
select *
from emp
where ename like 'S%';

--실습 5-21, 사원 이름의 두 번째 글자가 L인 사원만 출력하기
select *
from emp
where ename like '_L%';

--실습 5-22, 사원 이름에 AM이 포함되어 있는 사원 데이터만 출력하기
select *
from emp
where ename like '%AM%';

--실습 5-23, 사원 이름에 AM이 포함되어 있지 않은 사원 데이터 출력하기
select *
from emp
where ename not like '%AM%';

--실습 5-24, 별칭을 사용하여 열 이름 출력하기
select ename, sal, sal*12+comm as ANNSAL, comm
from emp;

--실습 5-25, 등가 비교 연산자로 NULL 비교하기
select *
from emp
where comm = NULL;

--실습 5-26, IS NULL 연산자를 사용하여 출력하기
select *
from emp
where comm is null;

--실습 5-27, 직속 상관이 있는 사원 데이터만 출력하기
select *
from emp
where mgr is not null;

--실습 5-28, AND 연산자와 IS NULL 연산자 사용하기
select *
from emp
where sal > null
and comm is null;

--실습 5-29, OR 연산자와 IS NULL 연산자 사용하기
select *
from emp
where sal > null
or comm is null;

--실습 5-30, 집합 연산자(UNION)를 사용하여 출력하기
select empno, ename, sal, deptno
from emp
where deptno = 10
UNION
select empno, ename, sal, deptno
from emp
where deptno = 20;

--실습 5-31, 집합 연산자(UNION)를 사용하여 출력하기(출력 열 개수가 다를 때)
select empno, ename, sal, deptno
from emp
where deptno = 10
UNION
select empno, ename, sal
from emp
where deptno = 20;

--실습 5-32, 집합 연산자(UNION)를 사용하여 출력하기(출력 열의 자료형이 다를 때)
select empno, ename, sal, deptno
from emp
where deptno = 10
UNION
select ename, empno, deptno, sal
from emp
where deptno = 20;

--실습 5-33, 집합 연산자(UNION)를 사용하여 출력하기(출력 열의 자료형이 같을 때)
select empno, ename, sal, deptno
from emp
where deptno = 10
UNION
select sal, job, deptno, sal
from emp
where deptno = 20;

--실습 5-34, 집합 연산자(UNION)를 사용하여 출력하기(출력 결과 데이터가 같을 때)
select empno, ename, sal, deptno
from emp
where deptno = 10
UNION
select empno, ename, sal, deptno
from emp
where deptno = 10;

--실습 5-35, 집합 연산자(UNION)를 사용하여 출력하기(출력 결과 데이터가 같을 때)
select empno, ename, sal, deptno
from emp
where deptno = 10
UNION ALL   --중복 값도 출력
select empno, ename, sal, deptno
from emp
where deptno = 10;

--실습 5-36. 집합 연산자(MINUS)를 사용하여 출력하기
select empno, ename, sal, deptno
from emp
MINUS
select empno, ename, sal, deptno
from emp
where deptno = 10;

--실습 5-37, 집합 연산자(INTERSECT)를 사용하여 출력하기
select empno, ename, sal, deptno
from emp
intersect
select empno, ename, sal, deptno
from emp
where deptno = 10;

--Q1. EMP 테이블을 사용하여 다음과 같이 사원 이름(ENAME)이 S로 끝나는 사원 데이터를 모두 출력
--하는 SQL문을 작성해 보세요.
select *
from emp
where ename like '%S';

--Q2. EMP 테이블을 사용하여 30번 부서(DEPTNO)에서 근무하고 있는 사원 중에 직책(JOB)이
--SALESMAN인 사원의 번호, 이름, 직책, 급여, 부서 번호를 출력하는 SQL문을 작성해 보세요.
select empno, ename, job, sal, deptno
from emp
where deptno = 30 and job = 'SALESMAN';

--Q3. EMP 테이블을 사용하여 20번, 30번 부서에 근무하고 있는 사원 중 급여(SAL)가 2000 초
--과인 사원을 다음 두 가지 방식의 SELECT문을 사용하여 사원 번호, 이름, 급여, 부서번호를
--출력하는 SQL문을 작성해 보세요.

--1. 집합 연산자를 사용하지 않은 방식
select *
from emp
where (deptno = 20 or deptno = 30) and sal > 2000;

--2. 집합 연산자를 사용한 방식
select *
from emp
where deptno = 20 or deptno = 30
intersect
select *
from emp
where sal > 2000;

--Q4. 이번에는 NOT BETWEEN A AND B 연산자를 쓰지 않고, 급여(SAL) 열 값이 2000 이상 3000
--이하 범위 이외의 값을 가진 데이터만 출력하도록 SQL문을 작성해 보세요.
select * from emp
where not (sal >= 2000 and sal <= 3000);

--Q5. 사원 이름에 E가 포함되어 있는 30번 부서의 사원 중 급여가 1000~2000 사이가 아닌
--사원 이름, 사원 번호, 급여, 부서 번호를 출력하는 SQL문을 작성해 보세요.
select ename, empno, sal, deptno from emp
where ename like '%E%' and deptno = 30
intersect
select ename, empno, sal, deptno from emp
where sal not between 1000 and 2000;

--Q6. 추가 수당이 존재하지 않고 상급자가 있고 직책이 MANAGER, CLERK인 사원 중에서 사원 이름
--의 두 번째 글자가 L이 아닌 사원의 정보를 출력하는 SQL문을 작성해 보세요.
select * from emp
where comm is null and
mgr is not null and
job in ('MANAGER', 'CLERK') and
ename not like '_L%';

--함수란?
--함수(function)는 수학에서 정의한 개념으로 x와 y 변수가 존재하고 x 값이 변하면 그 변화에 따라 
--어떤 연산 또는 가공을 거쳐 y 값도 함께 변할 때 이 y를 함수라고 합니다. x 값의 변화에 따라 y값이
--종속적으로 변하기 때문에 '따름수'라고도 합니다.

--실습 6-1, UPPER, LOWER, INITCAP 함수 사용하기
select ename, upper(ename), lower(ename), initcap(ename) from emp;

