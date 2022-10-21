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
order by sal desc;   --�������� ����

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
WHERE sal<2000 OR sal>3000;

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
--�����Լ�: upper, lower, substr, instr, replace, lpad, rpad, concat
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

SELECT 'oracle',LPAD('oracle', 10, '#'),RPAD('oracle',10,'*'),LPAD('oracle',10)
FROM dual;

SELECT RPAD('001103-',14,'*')
FROM dual;

SELECT concat(empno, ename), empno || '' || ename
FROM emp;

---����---
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
CEIL(3.14),     --�ڽź��� ū ���� ����� ���� 4
FLOOR(3.14),    --�ڽź��� ���� ���� ����� ���� 3
CEIL(-3.14),    -- -3
FLOOR(-3.14)    -- -4
FROM dual;

SELECT MOD(5,2), MOD(10,4)
FROM dual;

SELECT *
FROM emp
WHERE MOD(empno, 2) = 1;

--��¥ �����͸� �ٷ�� ��¥ �Լ�
--����
select sysdate
from dual;

--����
select sysdate -1
from dual;

--����
select sysdate +1
from dual;

--���̰� �ϼ� ��ȯ
select sysdate - hiredate as �ٹ��ϼ�
from emp;

--�ټӳ��
select trunc((sysdate-hiredate)/365) as �ٹ��ϼ�
from emp;
--���� ��
--CC: �� �ڸ� ������ �� �� �ڸ��� �������� ���(2022���� 2050�� �����̹Ƿ� �ݿø� �� ��� 2001������ ó��).
--YYYY: ��¥ �������� �ش� ��, ��, ���� 7�� 1���� ����(2022�� 10�� 19�� �� ���, 2023������ ó��).
--Q: �� �б��� �� ��° ���� 16�� ����(���� 11�� 15���� ���� �ʾ����Ƿ� 22�� 10�� 1��).
--DDD: �ش� ���� ����(12:00:00)�� ����(������ ���� �ʾ����Ƿ� 22�� 10�� 19��).
--HH: �ش����� �ð��� ����(22�� 10�� 19�� 10:49 �̹Ƿ� �ݿø��ص� 22�� 10�� 19��).
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

--�ڷ�����ȯ �Լ�
--to_char()
--to_number()
--to_date()

--��¥�� ����
select sysdate, to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS') as ����ð�
from dual;

select hiredate, to_char(hiredate, 'YYYY-MM-DD HH24:MI:SS') as �Ի�����
from emp;

--���ڸ� ����
select to_char(123456, '999,999')
from dual;

select to_char(123456, 'L999,999')
from dual;

select sal, to_char(sal, 'L999,999')
from emp;

--���ڸ� ���ڷ�
select '20000' - 10000
from dual;

select 20000 - '10000'
from dual;

select '20000' - '5000'
from dual;

--to_number() ����ȯ�� �ؾ��Ѵ�.
select '20,000' - '5,000'
from dual;

select to_number('20,000','999,999') - to_number('5,000','999,999')
from dual;

--���ڸ� ��¥��
select to_date('20221019','YYYY/MM/DD')
from dual;

select *
from emp
where hiredate < to_date('19820101','YYYY-MM-DD');

--null������ ó��
--nvl(null, �ٲٰ���� ������)
--nvl�� null �����Ϳ� Ÿ�԰� ���� Ÿ���� �����ؾ� �Ѵ�.
--nvl(����,����), nvl(����,����)
select ename �����,sal,sal*12 + nvl(comm,0) as ����,comm
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

--ORA-01722: ��ġ�� �������մϴ�
--01722. 00000 -  "invalid number"
--*Cause:    The specified number was invalid.
--*Action:   Specify a valid number.

select ename, job, nvl(to_char(mgr,'9999'),'CEO') as mgr
from emp
where mgr is null;

select comm, nvl2(comm,'O','X')
from emp;

--���ǹ� ǥ�� �Լ�
--decode()  �� switch
--case  �� if
select ename,job,deptno,
decode(deptno, 10,'AAA',20,'BBB',30,'CCC','��Ÿ') as �μ���
from emp;

-- ������ �������� ������ �� �ִ�.
case
    when ���ǽ� then ���๮
    when ���ǽ� then ���๮
    when ���ǽ� then ���๮
    else ���๮
end as ��Ī

select ename,job,deptno,
    case
    when deptno = 10 then 'AAA'
    when deptno = 20 then 'BBB'
    when deptno = 30 then 'CCC'
    else '��Ÿ'
end as �μ���
from emp;

select ename, job, sal,
case
    when sal between 3000 and 5000 then '�ӿ�'
    when sal >= 2000 and sal < 3000 then '������'
    when sal > 500 and sal < 2000 then '���'
    else '��Ÿ'
end as ����
from emp;

--����Ǯ��
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

--�Ұ���
select ename, max(sal)
from emp;

select max(sal)
from emp;

--sum(),avg(),count(),max(),min()
--�Ϲ��÷��� ���� ��� �Ұ�
--ũ��񱳰� ������ ��� Ÿ�Կ� ��� �����ϴ�.

--select �÷���
--from ���̺��
--where ���ǽ�
--group by �����÷�
--order by �÷��� ���Ĺ�� �� �� �������� �ۼ�

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

--select �÷���
--from ���̺��
--where ���ǽ�
--group by �����÷�
--having ���ǽ�
--order by �÷��� ���Ĺ�� �� �� �������� �ۼ�

select deptno, avg(sal)
from emp
group by deptno
having avg(sal) >= 2000;
--group by �� ���ؼ� ��ȸ ����� ������ �ش�
--���ǽ��� �ۼ��� �� �׷��Լ��� ����Ѵ�.

select deptno, avg(sal)
from emp
where deptno != 10
group by deptno
having avg(sal) >= 2000;

--����(Join)
--2�� �̻��� ���̺��� �����͸� ��ȸ
--from���� �� �� �̻��� ���̺��� �ۼ��Ѵ�.
--cross join (where�� ���� ����)
--equi join (where �������: =)
--non equi join(where ����������: and, or)
--self join (where �ϳ��� ���̺��� ����Ѵ�)
--out join (where�� �����Ǵ� �����͸� ���� ��ȸ�ϱ����� ������: (+))

select emp.ename,emp.job,emp.deptno,dept.dname,dept.loc
from emp,dept
where emp.deptno = dept.deptno;

select ename,job,emp.deptno,dname,loc
from emp,dept
where emp.deptno = dept.deptno;

select ename,job,e.deptno,dname,loc
from emp e,dept d   --���̺� ��Ī �ο�
where e.deptno = d.deptno;

select ename,job,e.deptno,dname,loc
from emp e,dept d   --���̺� ��Ī �ο�
where e.deptno = d.deptno
and sal >= 3000;

select ename,sal,grade
from emp e,salgrade s
where e.sal between s.losal and s.hisal;
--where e.sal >= s.losal and e.sal <= s.hisal;

--�����ȣ, �̸�, �޿�, �μ���ȣ, �μ���, �޿����
select empno, ename, sal, d.deptno, dname, grade
from emp e, dept d, salgrade s
where e.deptno = d.deptno
and e.sal between s.losal and s.hisal;

--self join
select *
from emp;

select e.empno, e.ename, e.mgr, m.ename as ���
from emp e, emp m   --�ݵ�� ��Ī�ο�
where e.mgr = m.empno;

--scott ���� �μ��� �ٹ��ϴ� ���
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

--�ܺ�����
--� �� �����Ǵ� �����͸� ���� ��ȸ�ϱ� ���ؼ� ���

select e.empno, e.ename, e.mgr, m.ename
from emp e, emp m   --�ݵ�� ��Ī �ο�
where e.mgr = m.empno(+);   --�����Ͱ� ���� ���̺��ʿ� (+)�� ���δ�.

select ename, sal, d.deptno, dname
from emp e, dept d
where e.deptno(+) = d.deptno;

--ANSI-JOIN(ǥ������ ���)
--cross join
--inner join(equi, non equi)
--outer join( (+) ) //  [left, right, full] ���� ǥ��
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
from emp e full outer join emp m -- �����Ͱ� �ִ� ���� �����Ѵ�.
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

--1������
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

--2������
select d.deptno, dname, trunc(avg(sal)) as AVG_SAL, max(sal) as MAX_SAL, min(sal) as MIN_SAL, count(d.deptno) as CNT
from emp e inner join dept d
on e.deptno = d.deptno
group by d.deptno, dname;

--3������
select d.deptno, dname, empno, ename, job, sal
from emp e right outer join dept d
on e.deptno = d.deptno
order by d.deptno, ename;

--4������
select d.deptno, d.dname, e.empno, e.ename, e.mgr, e.sal, e.deptno, s.losal, s.hisal, s.grade, e.mgr as MGR_EMPNO, m.ename AS MGR_ENAME
from emp e right outer join dept d
on e.deptno = d.deptno
left outer join emp m
on e.mgr = m.empno
left outer join salgrade s
on e.sal between s.losal and s.hisal
order by d.deptno, e.empno;

-- ��������
-- select ������ ��ø�ؼ� ����ϴ� ��(where)

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
--�̸�, �μ���ȣ

select ename, deptno
from emp
where deptno = (
    select deptno
    from dept
    where loc = 'DALLAS'
);

--�ڽ��� ���ӻ���� KING�� ����� �̸��� �޿��� ��ȸ�ϼ���(��������)
select *
from emp;

select ename, sal
from emp
where mgr = (
    select empno
    from emp
    where ename = 'KING'
);

-- ������ ��������
--in: ��� �߿� �ϳ��� �����ϸ� �ȴ�.
-- > any: ��� �߿� ���� ���������� ũ�� �ȴ�
-- > all: ��� �߿� ���� ū ������ ũ�� �ȴ�

--in ������
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

--any ������
select *
from emp
where sal > any (   --�׻� �ε�ȣ�� ����ؾ� �Ѵ�.
    select max(sal)
    from emp
    group by deptno
);

select *
from emp
where sal < any (   --�׻� �ε�ȣ�� ����ؾ� �Ѵ�.
    select max(sal)
    from emp
    group by deptno
);

--all ������
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

--DML(���������۾�): insert, update, delete
--insert: ���̺� ������ ����
--insert into ���̺�� (�÷���1, �÷���2,...)
--values (��1, ��2, ...)
--�÷��� ���� Ÿ�԰� ������ ��ġ�ؾ� �Ѵ�.
--�ۼ� ������� 1:1 ��Ī�ȴ�.

--���̺� �����ϱ�
create table dept_temp
as
select * from dept;

select *
from dept_temp;

--���̺� ������ ����
insert into dept_temp (deptno, dname, loc)
values (50,'DATABASE','SEOUL');

insert into dept_temp --�÷� ����, ��� �÷��� �����͸� �ְڴٴ� �ǹ�
values (70,'HTML','SEOUL');

insert into dept_temp (deptno, dname)  --������ NULL ������ ����
values(60,'JSP');

insert into dept_temp   --�÷�����, ����� NULL ������ ����
values (80, NULL, 'SEOUL');

create table emp_temp
as
select * from emp
where 1 != 1;

select *
from emp_temp;

insert into emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (9999, 'ȫ�浿', 'PRESIDENT', NULL, '2001/01/01', 5000, 1000, 10);

insert into emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (3111, '��û��', 'MANAGER', 9999, SYSDATE, 4000, NULL, 30);

--update: �÷��� �����͸� ����(����)
--update ���̺��
--set �÷��� = ��, �÷��� = �� ...
--where ���ǽ�
--���ǽ��� ������� ������ �ش� �÷��� ��� ����ȴ�.

drop table dept_temp2;  -- ���̺� ����

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

--delete(������ ����)
--delete from ���̺��
--where ���ǽ�
--�������� ������� ������ ��� �����Ͱ� �����ȴ�.

drop table emp_temp2;

create table emp_temp2
as
select * from emp;

select *
from emp_temp2;

delete from emp_temp2
where ename = 'SCOTT';

--TCL(�������� �������� �Ǵ� ���)
--Ʈ������
--commit, rollback, savepoint

--commit: ������ ��������(���̺��� ������ �ݿ�)
--create������ ����ؼ� ��ü ������ ��

--rollback: ������ ���� ���(���̺��� ������ �̹ݿ�), ���󺹱�
--õ������, ���� �� �ڵ�

--drop, ���̺� ����
drop table dept01;

--delete, ���̺� �׸� ����
delete from dept01;

--truncate, �ѹ��� �Ұ����� delete
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

--DDL(������ ���Ǿ�): table�� ����, ����, ������ �� ����Ѵ�.
--create(����), alter(����), drop(����)

create table ���̺��(  --table(��ü)
    �÷���1 Ÿ��,    --column(�Ӽ�)
    �÷���2 Ÿ��,
    �÷���3 Ÿ��
);

-- ���̺� ����
create table emp_pt(
    --�����ȣ, ����̸�, ��å, ������, �Ի�����, �޿�, ������, �μ���ȣ
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
values (9999, '�̼���', 'PRESIDENT', NULL, '2001/01/01', 5000, 1000, 10);

--���̺��� ����
create table dept_ddl
as
select * from dept;

--���̺��� �Ϻκ� ����
create table dept_30
as
select * from dept
where deptno = 30;

create table dept_m
as
select dname, loc
from dept;

select * from dept_d;

--���̺��� ������ ����
create table dept_d
as
select * from dept
where 1 != 1;

--���̺� ����(�÷��� ���� ����)
--���ο� �÷��߰�, 
--alter

create table emp_alter
as
select * from emp;

select * from emp_alter;

--add, �÷� �߰�
alter table emp_alter
add address varchar2(100);

--rename, �÷� �̸� ����
alter table emp_alter
rename column address to addr;

--modify, Ÿ�� ũ�� �ø���
alter table emp_alter
modify empno number(10);

desc emp_alter;

--drop, �÷� ����, �ѹ� �Ұ�.
alter table emp_alter
drop column addr;

drop table emp_alter;

select *
from emp_alter;


--���� Ǯ��

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


--����� ���̺� ��ȸ
desc user_tables;

select table_name
from user_tables;

select table_name
from all_tables;

select owner, table_name
from all_tables;

--index(�˻��ӵ��� ����ϱ� ���� ����ϴ� ��ü)
--select ������ �˼��� ����Ų��.
--��ü ���ڵ��� 3% ~ 5% ������ ��.
--index ��ü�� �÷��� �����ؼ� ����Ѵ�.

create index �ε�����
on ���̺��(�÷���);

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

--�ε��� ����
create index idx_emp01_ename
on emp01(ename);

select empno, ename
from emp01
where ename = 'BTS';

drop index idx_emp01_ename;

--���� ���̺� ��ȸ
show recyclebin;

flashback table emp_alter
to before drop;

--��������(���Ἲ): �߸��� ���� �����ͷ� ���Ǵ� ���� ����
--not null
--unique
--primary key(�⺻Ű)
--foreign key
--check

--emp, dept
insert into emp
values (1111, 'aaa', 'MANAGER', 9999, SYSDATE, 1000, NULL, 50);

--ORA-02291: ���Ἲ ��������(SCOTT.FK_DEPTNO)�� ����Ǿ����ϴ�- �θ� Ű�� �����ϴ�

drop table emp02;

delete from emp02;

--constraint: �������� ��Ī �ο�
--constraint ���������� �˾ƺ� �� �ִ� ��Ī
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
values (1111, 'ȫ�浿', 'MANAGER', 30);

insert into emp02
values (2222, 'ȫ�浿', 'MANAGER', 30);

insert into emp02
values (null, '������', 'SALESMAN', 20);
--ORA-01400: NULL�� ("SCOTT"."EMP02"."EMPNO") �ȿ� ������ �� �����ϴ�

insert into emp02
values (2222, '������', 'SALESMAN', 10);
--ORA-00001: ���Ἲ ���� ����(SCOTT.SYS_C0011065)�� ����˴ϴ�