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

