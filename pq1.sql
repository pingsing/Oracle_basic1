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

select ename, sal, sal+sal+sal+sal+sal+sal+sal+sal+sal+sal+sal+sal+comm, comm
from emp;