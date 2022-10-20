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