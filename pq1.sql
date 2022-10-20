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