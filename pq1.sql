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

--�ǽ� 5-20, LIKE ������ ����Ͽ� ����ϱ�
select *
from emp
where ename like 'S%';

--�ǽ� 5-21, ��� �̸��� �� ��° ���ڰ� L�� ����� ����ϱ�
select *
from emp
where ename like '_L%';

--�ǽ� 5-22, ��� �̸��� AM�� ���ԵǾ� �ִ� ��� �����͸� ����ϱ�
select *
from emp
where ename like '%AM%';

--�ǽ� 5-23, ��� �̸��� AM�� ���ԵǾ� ���� ���� ��� ������ ����ϱ�
select *
from emp
where ename not like '%AM%';

--�ǽ� 5-24, ��Ī�� ����Ͽ� �� �̸� ����ϱ�
select ename, sal, sal*12+comm as ANNSAL, comm
from emp;

--�ǽ� 5-25, � �� �����ڷ� NULL ���ϱ�
select *
from emp
where comm = NULL;

--�ǽ� 5-26, IS NULL �����ڸ� ����Ͽ� ����ϱ�
select *
from emp
where comm is null;

--�ǽ� 5-27, ���� ����� �ִ� ��� �����͸� ����ϱ�
select *
from emp
where mgr is not null;

--�ǽ� 5-28, AND �����ڿ� IS NULL ������ ����ϱ�
select *
from emp
where sal > null
and comm is null;

--�ǽ� 5-29, OR �����ڿ� IS NULL ������ ����ϱ�
select *
from emp
where sal > null
or comm is null;

--�ǽ� 5-30, ���� ������(UNION)�� ����Ͽ� ����ϱ�
select empno, ename, sal, deptno
from emp
where deptno = 10
UNION
select empno, ename, sal, deptno
from emp
where deptno = 20;

--�ǽ� 5-31, ���� ������(UNION)�� ����Ͽ� ����ϱ�(��� �� ������ �ٸ� ��)
select empno, ename, sal, deptno
from emp
where deptno = 10
UNION
select empno, ename, sal
from emp
where deptno = 20;

--�ǽ� 5-32, ���� ������(UNION)�� ����Ͽ� ����ϱ�(��� ���� �ڷ����� �ٸ� ��)
select empno, ename, sal, deptno
from emp
where deptno = 10
UNION
select ename, empno, deptno, sal
from emp
where deptno = 20;

--�ǽ� 5-33, ���� ������(UNION)�� ����Ͽ� ����ϱ�(��� ���� �ڷ����� ���� ��)
select empno, ename, sal, deptno
from emp
where deptno = 10
UNION
select sal, job, deptno, sal
from emp
where deptno = 20;

--�ǽ� 5-34, ���� ������(UNION)�� ����Ͽ� ����ϱ�(��� ��� �����Ͱ� ���� ��)
select empno, ename, sal, deptno
from emp
where deptno = 10
UNION
select empno, ename, sal, deptno
from emp
where deptno = 10;

--�ǽ� 5-35, ���� ������(UNION)�� ����Ͽ� ����ϱ�(��� ��� �����Ͱ� ���� ��)
select empno, ename, sal, deptno
from emp
where deptno = 10
UNION ALL   --�ߺ� ���� ���
select empno, ename, sal, deptno
from emp
where deptno = 10;

--�ǽ� 5-36. ���� ������(MINUS)�� ����Ͽ� ����ϱ�
select empno, ename, sal, deptno
from emp
MINUS
select empno, ename, sal, deptno
from emp
where deptno = 10;

--�ǽ� 5-37, ���� ������(INTERSECT)�� ����Ͽ� ����ϱ�
select empno, ename, sal, deptno
from emp
intersect
select empno, ename, sal, deptno
from emp
where deptno = 10;

--Q1. EMP ���̺��� ����Ͽ� ������ ���� ��� �̸�(ENAME)�� S�� ������ ��� �����͸� ��� ���
--�ϴ� SQL���� �ۼ��� ������.
select *
from emp
where ename like '%S';

--Q2. EMP ���̺��� ����Ͽ� 30�� �μ�(DEPTNO)���� �ٹ��ϰ� �ִ� ��� �߿� ��å(JOB)��
--SALESMAN�� ����� ��ȣ, �̸�, ��å, �޿�, �μ� ��ȣ�� ����ϴ� SQL���� �ۼ��� ������.
select empno, ename, job, sal, deptno
from emp
where deptno = 30 and job = 'SALESMAN';

--Q3. EMP ���̺��� ����Ͽ� 20��, 30�� �μ��� �ٹ��ϰ� �ִ� ��� �� �޿�(SAL)�� 2000 ��
--���� ����� ���� �� ���� ����� SELECT���� ����Ͽ� ��� ��ȣ, �̸�, �޿�, �μ���ȣ��
--����ϴ� SQL���� �ۼ��� ������.

--1. ���� �����ڸ� ������� ���� ���
select *
from emp
where (deptno = 20 or deptno = 30) and sal > 2000;

--2. ���� �����ڸ� ����� ���
select *
from emp
where deptno = 20 or deptno = 30
intersect
select *
from emp
where sal > 2000;

--Q4. �̹����� NOT BETWEEN A AND B �����ڸ� ���� �ʰ�, �޿�(SAL) �� ���� 2000 �̻� 3000
--���� ���� �̿��� ���� ���� �����͸� ����ϵ��� SQL���� �ۼ��� ������.
select * from emp
where not (sal >= 2000 and sal <= 3000);

--Q5. ��� �̸��� E�� ���ԵǾ� �ִ� 30�� �μ��� ��� �� �޿��� 1000~2000 ���̰� �ƴ�
--��� �̸�, ��� ��ȣ, �޿�, �μ� ��ȣ�� ����ϴ� SQL���� �ۼ��� ������.
select ename, empno, sal, deptno from emp
where ename like '%E%' and deptno = 30
intersect
select ename, empno, sal, deptno from emp
where sal not between 1000 and 2000;

--Q6. �߰� ������ �������� �ʰ� ����ڰ� �ְ� ��å�� MANAGER, CLERK�� ��� �߿��� ��� �̸�
--�� �� ��° ���ڰ� L�� �ƴ� ����� ������ ����ϴ� SQL���� �ۼ��� ������.
select * from emp
where comm is null and
mgr is not null and
job in ('MANAGER', 'CLERK') and
ename not like '_L%';

--�Լ���?
--�Լ�(function)�� ���п��� ������ �������� x�� y ������ �����ϰ� x ���� ���ϸ� �� ��ȭ�� ���� 
--� ���� �Ǵ� ������ ���� y ���� �Բ� ���� �� �� y�� �Լ���� �մϴ�. x ���� ��ȭ�� ���� y����
--���������� ���ϱ� ������ '������'��� �մϴ�.

--�ǽ� 6-1, UPPER, LOWER, INITCAP �Լ� ����ϱ�
select ename, upper(ename), lower(ename), initcap(ename) from emp;

