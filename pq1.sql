--�ǽ� 4-1, EMP ���̺� ���� ���캸��
desc emp;

--�ǽ� 4-2, DEPT ���̺� ���� ���캸��
desc dept;

--�ǽ� 4-3, SALGRADE ���̺� ���� ���캸��
desc salgrade;

--�ǽ� 4-4, EMP ���̺� ��ü �� ��ȸ�ϱ�
select * from emp;

--�ǽ� 4-5, ���� ��ǥ�� �����Ͽ� ����ϱ�
select empno, ename, deptno
from emp;

--�ǽ� 4-6, DISTINCT�� ���� �ߺ� �����ϱ�
select distinct deptno
from emp;

--�ǽ� 4-7, ���� �� ���� ����Ͽ� �ߺ� �����ϱ�
select distinct job, deptno
from emp;

--�ǽ� 4-8, ��å, �μ� ��ȣ ����ϱ�(ALL ���)
select all job, deptno
from emp;

--�ǽ� 4-9, ���� ������� ����Ͽ� ����ϱ�
select ename, sal, sal*12+comm, comm
from emp;

--�ǽ� 4-10, ���ϱ⸦ ������� �ʰ� ����� ���� �� ���� ����ϱ�
select ename, sal, sal+sal+sal+sal+sal+sal+sal+sal+sal+sal+sal+sal+comm, comm
from emp;

--�ǽ� 4-11, ��Ī�� ����Ͽ� ����� ���� �� ���� ����ϱ�
select ename, sal, sal*12+comm as ANNSAL, comm
from emp;

--�ǽ� 4-12, EMP ���̺��� ��� ���� �޿� �������� �������� �����ϱ�
select *
from emp
order by sal;

--�ǽ� 4-13, EMP ���̺��� ��� ���� �޿� �������� �������� �����ϱ�
select *
from emp
order by sal desc;

--�ǽ� 4-14, EMP ���̺��� ��ü ���� �μ� ��ȣ(��������)�� �޿�(��������)�� �����ϱ�
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

--�ǽ� 5-1, EMP ���̺��� ��� �� ����ϱ�
select *
from emp;

--�ǽ� 5-2, �μ� ��ȣ�� 30�� �����͸� ����ϱ�
select *
from emp
where deptno = 30;

--1min pt, ���� SQL���� ����� ��� ��ȣ�� 7782�� ��� ������ �������� �ڵ带 ä�� ������.
select *
from emp
where empno = 7782;

--�ǽ� 5-3, AND �����ڷ� ���� ���� ���ǽ� ����ϱ�
select *
from emp
where deptno = 30
and job = 'SALESMAN';

--1min pt, ��� ��ȣ�� 7499�̰� �μ� ��ȣ�� 30�� ��� ������ �������� �ڵ带 ä�� ������.
select *
from emp
where empno = 7499
and deptno = 30;

--�ǽ� 5-4,OR �����ڷ� ���� ���� ��� ���� ����ϱ�
select *
from emp
where deptno = 30
or job = 'CLERK';

--�ǽ� 5-5, ���� ��� �����ڸ� ����� ��
select *
from emp
where sal * 12 = 36000;


--�ǽ� 5-6, ��� �� �����ڸ� ����Ͽ� ����ϱ�
select *
from emp
where sal >= 3000;

--�ǽ� 5-7, ���ڸ� ��� �� �����ڷ� ���ϱ�(�� ���ڿ��� ���� �ϳ��� ��).
select *
from emp
where ename >= 'F';

--�ǽ� 5-8, ���ڿ��� ��� �� �����ڷ� ���ϱ�(�� ���ڿ��� ���� ���� ���� ��)
select *
from emp
where ename <= 'FORZ';

--�ǽ� 5-9, � �� ������(!=)�� ����Ͽ� ����ϱ�
select *
from emp
where sal != 3000;

--�ǽ� 5-10, � �� ������(<>)�� ����Ͽ� ����ϱ�
select *
from emp
where sal <> 3000;

--�ǽ� 5-11, � �� ������(^=)�� ����Ͽ� ����ϱ�
select *
from emp
where sal ^= 3000;

--�ǽ� 5-12, NOT �����ڸ� ����Ͽ� ����ϱ�
select *
from emp
where not sal = 3000;

--�ǽ� 5-13, OR �����ڸ� ����Ͽ� ���� �� ������ �����ϴ� ������ ����ϱ�
select *
from emp
where job = 'MANAGER'
or job = 'SALESMAN'
or job = 'CLERK';

--�ǽ� 5-14, IN �����ڸ� ����Ͽ� ����ϱ�
select *
from emp
where job in ('MANAGER', 'SALESMAN', 'CLERK');

--�ǽ� 5-15. � �� �����ڿ� AND �����ڸ� ����Ͽ� ����ϱ�
select *
from emp
where job != 'MANAGER'
and job <> 'SALESMAN'
and job ^= 'CLERK';

--�ǽ� 5-16, IN �����ڿ� �� ���� �����ڸ� ����Ͽ� ����ϱ�
select *
from emp
where job not in('MANAGER', 'SALESMAN', 'CLERK');

--�ǽ� 5-17, ��� �� �����ڿ� AND �����ڸ� ����Ͽ� ����ϱ�
select *
from emp
where sal >= 2000
and sal <= 3000;

--�ǽ� 5-18, BETWEEN A AND B �����ڸ� ����Ͽ� ����ϱ�
select *
from emp
where sal between 2000 and 3000;

--�ǽ� 5-19, BETWEEN A AND B �����ڿ� NOT �����ڸ� ����Ͽ� ����ϱ�
select *
from emp
where sal not between 2000 and 3000;

