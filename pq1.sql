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

select ename, sal, sal+sal+sal+sal+sal+sal+sal+sal+sal+sal+sal+sal+comm, comm
from emp;