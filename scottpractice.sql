--DQL(���Ǿ�) ��������ȸ
--select �÷���
--from ���̺��

--��ü������
select empno, ename, job, mgr, hiredate, sal, comm, deptno
from emp;

--�κ��÷� ������
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

-- +, -, *, / ������ �����ڴ� ����
-- �÷��� ������� �����Ѵ�.
-- null ���� ������ �Ұ��ϴ�.
-- �÷��� ��Ī�� ����� �� �ִ�.
select ename, sal, sal * 12
from emp;

select ename as �����, sal, sal * 12+nvl(comm,0) as ����, comm
from emp;

--������ ����
--select �÷���
--from ���̺��
--order by �÷���(���� ������ �Ǵ� ��) asc(��������)/desc(��������)

select *
from emp
order by sal asc;   --�������� ����

select *
from emp
order by sal asc;   --�������� ����

select *
from emp
order by sal;   --���������� ������ �����ϴ�.
--����(1~10), ��¥(����~�ֱٳ�¥), ����(��������)

--���ǰ˻�
--select �÷���
--from ���̺��
--where ���ǽ�; <, >, =, != / <>, <=. >=. and, or

SELECT *
FROM emp
WHERE sal >= 3000;  --�޿��� 3000 �̻��� ���

SELECT *
FROM emp
WHERE deptno = 30;

--and �ΰ��� �̻��� ������ ��� ���� ���

SELECT *
FROM emp
WHERE deptno = 30 and job = 'SALESMAN' and empno = 7499;

SELECT *
FROM emp
WHERE ename = 'FORD';    --�ҹ��� ford�� ����

--��¥�� �������� ����� ��
--' '
--��¥�� ũ�Ⱑ �ִ�
--80/12/20 �� 1980 12 20 �ð� �� �� ����

SELECT *
FROM emp
WHERE hiredate < '1982/01/01';

--OR �ΰ� �̻��� �����߿� �ϳ� �̻� ���� ���
SELECT *
FROM emp
WHERE deptno = 10 or sal >= 2000;

--NOT ������ ������

SELECT *
FROM emp
WHERE sal != 3000;

SELECT *
FROM emp
WHERE not sal = 3000;

--AND, OR
--���� ������ ǥ�� �� �� ���

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

--LIKE ������
--���� �Ϻθ� ������ �����͸� ��ȸ�Ѵ�.
-- ���ϵ�ī�带 ����Ѵ� (%, _)
SELECT *
FROM emp
WHERE ename = 'FORD';

SELECT *
FROM emp
WHERE ename LIKE 'F%';  --F%: F�ڿ� � ���ڰ� ��� ����.

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

--NULL ������
--IS NULL / IS NOT NULL
SELECT *
FROM emp
WHERE COMM = null;  --null�� �� �Ұ�

SELECT *
FROM emp
WHERE COMM IS null;

SELECT *
FROM emp
WHERE COMM IS NOT null;

--���տ�����
--�ΰ��� SELECT ������ ����Ѵ�
--�÷��� ������ �����ؾ� �Ѵ�.
--�÷��� Ÿ���� �����ؾ� �Ѵ�.
--�÷��� �̸��� �������.
--������, ������, ó����

SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno = 10;

SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno = 20;

SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno = 10
UNION   --������
SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno = 20;

SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno = 10
UNION ALL  --������, ���ǽ��� ��� ���� ������
SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno = 20;

SELECT empno, ename, sal, deptno
FROM emp
MINUS   --������, ���ǽ��� �� �������� ������
SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno = 10;

SELECT empno, ename, sal, deptno
FROM emp
INTERSECT   -- ������, �������� �����ϴ� ��ҷ� �̷���� ������
SELECT empno, ename, sal, deptno
FROM emp
WHERE deptno = 10;

--WHERE
--�񱳿�����, ��������, LIKE, IS NULL, IS NOT NULL, UNION, UNION ALL, MINUS, INTERSECT
-- <, >, <=, >=, =, !=
-- AND, OR, NOT, BETWEEN A AND B, IN
-- LIKE(%, _)
-- IS NULL, IS NOT NULL
-- UNION, UNION ALL, MINUS, INTERSECT

--1������
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE ename LIKE '%S';

--2������
SELECT empno, ename, job, sal, deptno
FROM emp
WHERE deptno = 30 AND job LIKE 'SALESMAN';

--3������
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

--4������
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE sal<2000 or sal>3000;

--5������
SELECT ename, empno, sal, deptno
FROM emp
WHERE ename LIKE '%E%' AND deptno = 30
INTERSECT
SELECT ename, empno, sal ,deptno
FROM emp
WHERE sal NOT BETWEEN 1000 AND 2000;

--6������
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE comm IS null 
AND mgr IS NOT null
AND job IN('MANAGER', 'CLERK')
AND ename NOT LIKE '_L%';

--�Լ�
--�����Լ�
--�����Լ�
--��¥�Լ�

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

SELECT 'oracle',LPAD('oracle', 10, '#'),RPAD('oracle',10,'*')
FROM dual;