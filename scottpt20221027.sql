--����Լ� ��� �ѱ�
set serveroutput on;

--���ν��� �۾� ������ ���� �ʱ� ���� �Ź� ����� ������ �����ؼ� ���� �ٿ��ֱ� �ϴ� ����
--���������� ����� �����ϴ�...
declare
    n number := 1;
begin
    while(n <= 10) loop
        dbms_output.put_line(n);
        n := n+1;
    end loop;
end;
/

--���� ���ν���(procedure)
--1. ����(create)
--2. ����(execute or exec)
create or replace procedure(�Ű�����)

is or as
    ���� ����
begin
    SQL
    ��±���
    ���ǹ�, �ݺ���
end;
/
--���� ���ν���(procedure)

--������ �����ϴ� ������ ���̺� emp01 ����
drop table emp01;

--������ ���̺� emp01 ����
--���� ���̺�(emp)�� �Ѽ����� �ʱ� ���� �������.
create table emp01
as
select * from emp;

--emp01 ���̺� ��ȸ
select * from emp01;

--���ν��� ����
--�ش� ���ν����� emp01 ���̺� �� ���� �÷��� �����͸� �ִ´�.
create or replace procedure emp01_prt
is
    vempno number(10);
    vename varchar2(10);
begin
    vempno := 1111;
    vename := 'Hong';
    
    dbms_output.put_line(vempno || ' ' || vename);
end;
/

--���ν��� ����
execute emp01_prt;
exec emp01_prt;

--�ش� ���ν����� emp01 ���̺��� �÷��� �����͵��� ��� �����Ѵ�.
create or replace procedure emp01_del
is
begin
    delete from emp01;
end;
/

--���ν��� ����
execute emp01_del;
exec emp01_del;

--���ν��� ����
--�ش� ���ν����� ���̺� emp01�� Į�� ename�� �Ű������� ���� ������ �����͸� �����.
create or replace procedure del_ename(vename emp01.ename%type)
is

begin
    delete from emp01
    where ename = vename;
end;
/

--���ν��� ����
execute del_ename('SCOTT');
exec del_ename('SCOTT');

--���ν��� ����
execute del_ename('SMITH');
exec del_ename('SMITH');

--���� ���ν����� �Ű����� ����
--in, out, in out
--in: ���� ���޹޴� �뵵
--out: ���ν��� ������ ���� ����� ������ ��û�� ������ ����
--in out: in + out

--���ν��� ����
create or replace procedure sel_empno
(
    --�Ű������μ� ���� �޴´�.
    vempno in emp.empno%type,
    
    --�Ű���������, begin���� ������ ����� �����Ѵ�.
    vename out emp.ename%type,
    vsal out emp.sal%type,
    vjob out emp.job%type
)
is

begin
    select ename, sal, job
    into vename, vsal, vjob
    from emp
    where empno = vempno;
end;
/

--out���� ������ ���� �ޱ� ���ؼ��� �޴� ������ �ϴ� ���ε� ������ �����Ͽ� ���� ���� ������ ��, ���� ���ν������� ���� �������� ������Ѵ�.
variable var_ename varchar2(15);
variable var_sal number;
variable var_job varchar2(9);

--���ν��� ����
--���ε� ������ ���� ��, �տ� :(�ݷ�)�� ����� �Ѵ�.
exec sel_empno(7499, :var_ename, :var_sal, :var_job);

print var_ename;
print var_sal;
print var_job;

--��� ������ �����ϴ� ���� ���ν����� ���弼��.
--���, �̸�, ��å, �Ŵ���, �μ�
--��� ������ �Ű������� ����ؼ� �޾ƿ´�.

--������ �����ϴ� ���̺� emp02 ����
drop table emp02;

--������ ���̺� emp02 ����.
create table emp02
as
select empno, ename, job, mgr, deptno
from emp
where 1 != 1;

--���̺� emp02 ��ȸ
select * from emp02;

--���ν��� ����
--�ش� ���ν����� ����� ������ �޾� �����Ѵ�.
create or replace procedure save_emp02
(
    vempno in emp02.empno%type,
    vename in emp02.ename%type,
    vjob in emp02.job%type,
    vmgr in emp02.mgr%type,
    vdeptno in emp02.deptno%type
)
is

begin
    insert into emp02
    values(vempno, vename, vjob, vmgr, vdeptno);
end;
/

--���ν��� ����
exec save_emp02(1111, 'ȫ�浿', 'DEV', NULL, 10);

--�����Լ�
--�����Լ��� ���� ���ν����� ������: return�� ����
--1. ����(create)
--2. 

create or replace function �Լ���(�Ű�����)
    RETURN ���� Ÿ��
    --�����ݷ� ����
is
    ��������
begin
    SQL����
    ����Լ�
    ���ǹ�, �ݺ���
    
    RETURN ���ϰ�;
    --�����ݷ� ���
end;
/

--���ν��� ����
create or replace function cal_bonus(vempno emp.empno%type)
    return number
is
    vsal number(7, 2);
begin
    select sal
    into vsal
    from emp
    where empno = vempno;
    
    return vsal*200;
end;
/

variable var_res number;
--���� ����

execute :var_res := cal_bonus(7788);
--execute �ڿ� ������ �����ؾ� �Ѵ�.

print :var_res;

--���ν��� ����

drop procedure insert_sawon;
drop function cal_bonus;

--����� Ŀ��
DECLARE
    --Ŀ��: SELECT ������ �����ϴ� ����� ����Ų��.
    CURSOR Ŀ���� IS sql ����(SELECT);
    --Ŀ�� ����
BEGIN
    OPEN Ŀ����;
    LOOP
        FETCH Ŀ���� INTO ������;
        --���̺�κ��� �����ͼ� ������ �����ϴ� ����
        EXIT WHEN Ŀ����%NOTFOUND;
    END LOOP
    CLOSE Ŀ����;
END;
/
--����� Ŀ��

DECLARE
    --Ŀ��: SELECT ������ �����ϴ� ����� ����Ų��.
    CURSOR c1 IS SELECT * FROM emp;
    vemp emp%rowtype;
    --Ŀ�� ����
BEGIN
    OPEN c1;
    LOOP
        FETCH c1 INTO vemp;
        --���̺�κ��� �����ͼ� ������ �����ϴ� ����
        EXIT WHEN c1%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(vemp.empno || ' ' || vemp.ename || ' ' || vemp.job || ' ' || vemp.mgr || ' ' || vemp.hiredate || ' ' || vemp.sal || ' ' || vemp.comm || ' ' || vemp.deptno);
    END LOOP;
    CLOSE c1;
END;
/

DECLARE
    CURSOR c1 IS SELECT * FROM dept;
    vdept dept%rowtype;
BEGIN
    FOR vdept IN c1 LOOP
        EXIT WHEN c1%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(vdept.deptno || ' ' || vdept.dname || ' ' || vdept.loc);
    END LOOP;
    CLOSE c1;
END;
/

--���̵�, �۽�Ʈ ����, ��Ʈ ����, �μ� �̸�
--employees, departments

--hr �������� ����

--���ι��
SELECT employee_id, first_name, last_name, department_name
FROM employees e inner join departments d
ON e.department_id = d.department_id
WHERE e.department_id = 100;

--��������
--�μ� ��ȣ�� ���Ͽ� �ش� �μ���ȣ�� �μ����� ��ȸ�Ѵ�.
SELECT employee_id, first_name, last_name, department_id,
(
    SELECT department_name
    FROM departments d
    WHERE e.department_id = d.department_id
) as dept_names
    
FROM employees e
WHERE department_id = 100;

--���ν���(�Լ�)
create or replace function get_dept_name
(
    dept_id number
)
    return varchar2
is
    sdeptname varchar2(30);
begin
    select department_name
    into sdeptname
    from departments
    where department_id = dept_id;
    
    return sdeptname;
end;
/

variable var_dept_name varchar2(30);

SELECT employee_id, first_name, last_name, get_dept_name(department_id)
FROM employees e
WHERE e.department_id = 100;

--�׷��Լ��� ���� ��ȸ
select count(*) from employees;

--department_id�� null�� ����� ��ȸ
select * from employees
where department_id is null;

--���ν��� ����
exec :var_dept_name := get_dept_name(90);

print var_dept_name;

select sum(sal), max(sal)
from emp;

--��ȸ�� �͵�
--employees, jobs
--������̵�, �̸�, ��, job_title

--���� ���
SELECT employee_id, first_name, last_name, job_title
FROM employees e INNER JOIN jobs j
ON e.job_id = j.job_id;

--��������
SELECT employee_id, first_name, last_name, job_id,
(
    SELECT job_title
    FROM jobs j
    WHERE e.job_id = j.job_id
) AS job_title
FROM employees e;

--���ν���(�Լ�), get_job_title()
CREATE OR REPLACE FUNCTION get_job_title(jid VARCHAR2)
    RETURN VARCHAR2
IS
    s_job_title VARCHAR2(30);
BEGIN
    SELECT job_title
    INTO s_job_title
    FROM jobs
    WHERE job_id = jid;
    
    RETURN s_job_title;
END;
/

--���ν��� ������ ���� �Լ� ���� �۵� Ȯ��
VARIABLE var_job_title VARCHAR2(30);
EXEC :var_job_title := get_job_title('AD_PRES');

PRINT var_job_title;


SELECT employee_id, first_name, last_name, get_job_title(job_id )
FROM employees;

--hr �������� ����
