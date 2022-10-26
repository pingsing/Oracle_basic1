--����Լ� ��� �ѱ�
set serveroutput on;

--PL/SQL(Ȯ��� SQL���)
--����, ���ǹ�, �ݺ���
--������ '/'�� �������� �������� �ʴ´�. �ʼ�!
declare
    ���� ����
begin
    SQL���� �ۼ�
    ��±��� �ۼ� --�������� �������� �ݵ�� ����Լ��� ���ؼ� Ȯ���ؾ� �Ѵ�.
exception
    ����ó�� ����
end;
/

begin
    --����Լ�
    dbms_output.put_line('Hello World');
end;
/

declare
--  ������ ������ Ÿ��
--  �÷� ������ �����ϴ�.
    --vempno number(4);
    --vename varchar2(10);
    
    --constant: ��� Ű����
    vempno constant number(4) := 7777;
    --null ���� ������ ������ ����� �� ����.
    --not null�� ������ �������� ����� �� �ִ�.
    vename varchar2(10) not null := 'SCOTT';
begin
--  ���Կ����ڸ� ����� �� �ݵ�� �տ� �ݷ��� �־��־�� �Ѵ�.
     --vempno := 7777;
     --vename := 'SCOTT';
     
     dbms_output.put_line('��� / �̸�');
     dbms_output.put_line(vempno || ' ' || vename);
end;
/

declare
    --��Į�� ���
    --������� ������ ������ Ÿ���� �����ϴ� ���
    --vempno number(4)
    
    --���۷��� ���
    --���� ���̺��� �÷��� Ÿ���� �����Ѵ�.
    vempno emp.empno%type := 7777; 
begin
    --vempno := 7777;
    dbms_output.put_line(vempno);
end;
/

declare
    --���۷��� ���
    vempno emp.empno%type;
    vename emp.ename%type;
begin
    --select ������ ����� ���� ��ȸ�� �����͸� �ݵ�� ������ ��Ƽ� ����ؾ� �Ѵ�.
    --�� into���� ����ؼ� �����͸� ������ �Ѱ��־�� �Ѵ�.
    --where���� �ٿ��� ������ ���Ѵ��� �־�� �Ѵ�(������ ������ ������ ��� �����Ͱ� �Ѿ���� ����).
    select empno, ename 
    into vempno, vename --(�ʼ�)
    from emp;
    --where empno = 7788; --(�ʼ�)
    
    dbms_output.put_line('��� / �̸�');
    dbms_output.put_line(vempno || ' ' || vename);
exception   --����ó��
    --JAVA�� Try&Catch��
    when TOO_MANY_ROWS then dbms_output.put_line('���� ���� ������ �Դϴ�.');
    when OTHERS then dbms_output.put_line('��� ������ ���� ó��');
end;
/

declare
    --���̺� type(����� ���� ���� Ÿ��)
    --�迭�� ����
    --vename varchar(10)
    TYPE empno_table_type IS TABLE OF emp.empno%type
    INDEX BY BINARY_INTEGER;
    
    TYPE ename_table_type IS TABLE OF emp.ename%type
    INDEX BY BINARY_INTEGER;
    
    TYPE job_table_type IS TABLE OF emp.job%type
    INDEX BY BINARY_INTEGER;
    
    TYPE mgr_table_type IS TABLE OF emp.mgr%type
    INDEX BY BINARY_INTEGER;
    
    TYPE hiredate_table_type IS TABLE OF emp.hiredate%type
    INDEX BY BINARY_INTEGER;
    
    TYPE sal_table_type IS TABLE OF emp.sal%type
    INDEX BY BINARY_INTEGER;
     
    TYPE comm_table_type IS TABLE OF emp.comm%type
    INDEX BY BINARY_INTEGER;
    
    TYPE deptno_table_type IS TABLE OF emp.deptno%type
    INDEX BY BINARY_INTEGER;
    
    empnoArr empno_table_type;
    enameArr ename_table_type;  --�迭������ ���� ����
    jobArr job_table_type;  --�迭������ ���� ����
    mgrArr mgr_table_type;
    hiredateArr hiredate_table_type;
    salArr sal_table_type;
    commArr comm_table_type;
    deptnoArr deptno_table_type;
    
    --�̸� ������ �صξ�� �Ѵ�.
    i BINARY_INTEGER := 0;
begin
    for k in (select empno, ename, job, mgr, hiredate, sal, comm, deptno from emp) loop
        i := i+1;
        empnoArr(i) := k.empno;
        enameArr(i) := k.ename;
        jobArr(i) := k.job;
        mgrArr(i) := k.mgr;
        hiredateArr(i) := k.hiredate;
        salArr(i) := k.sal;
        commArr(i) := k.comm;
        deptnoArr(i) := k.deptno;
    end loop;
    
    for j in 1..i loop
        dbms_output.put_line(empnoArr(j) || ' / ' || enameArr(j) || ' / ' || jobArr(j) || ' / ' || mgrArr(j) || ' / ' || hiredateArr(j) || ' / ' || salArr(j) || ' / ' || commArr(j) || ' / ' || deptnoArr(j));
    end loop;
end;
/

declare
    --���ڵ� type(�������� ������ ��� ����Ѵ�) �� ������� ���� ���� Ÿ��
    --Ŭ������ �����ϴ�.
    
    TYPE emp_record_type IS RECORD(
    v_empno emp.empno%type,
    v_ename emp.ename%type,
    v_job emp.job%type,
    v_deptno emp.deptno%type
);

emp_record emp_record_type; --���ڵ� Ÿ���� ���� ����
begin
    select empno, ename, job, deptno into emp_record
    from emp
    where empno = 7788;
    
    dbms_output.put_line(emp_record.v_empno || ' ' || emp_record.v_ename || ' ' || emp_record.v_job || ' ' || emp_record.v_deptno);
end;
/ 

--������ ���̺� ����
create table dept_record
as
select * from dept;

drop table dept_record;

--PL/SQL �÷� ������ ���� / insert
declare
    TYPE rec_dept IS RECORD(
        v_deptno dept_record.deptno%type,
        v_dname dept_record.dname%type,
        v_loc dept_record.loc%type
    );
    
    dept_rec rec_dept;
begin
    dept_rec.v_deptno := 50;
    dept_rec.v_dname := 'DEV';
    dept_rec.v_loc := 'BUSAN';
    
    --���� �÷��� ������� ���� �����Ϳ� �����ϰ� ���� ���߾� ��ȣ�ȿ� ���־�� �ϳ� ���� ����, ���ڵ�� ������ ������ ������ �����ϴ�.
    insert into dept_record --(v_deptno, v_dname, v_loc)
    values dept_rec; --(50, 'DEV', 'BUSAN')
end;
/

select * from dept_record;

--PL/SQL �÷� ������ ���� / update
declare
    TYPE rec_dept IS RECORD(
        v_deptno dept_record.deptno%type,
        v_dname dept_record.dname%type,
        v_loc dept_record.loc%type
    );
    
    dept_rec rec_dept;
begin
    dept_rec.v_deptno := 50;
    dept_rec.v_dname := 'SOP';
    dept_rec.v_loc := 'SEOUL';
    
    update dept_record
    set dname = dept_rec.v_dname, loc = dept_rec.v_loc
    where deptno = dept_rec.v_deptno;
end;
/

--PL/SQL �÷� ������ ���� / delete
declare
    v_deptno dept_record.deptno%type := 50;
begin
    delete from dept_record
    where deptno = v_deptno;
end;
/

--���ǹ�
declare 
    vempno number(4);
    vename varchar2(10);
    vdeptno varchar2(10);
    vdname varchar2(10) := null;
begin
    select empno, ename, deptno
    into vempno, vename, vdeptno
    from emp
    where empno = 7788;
    
    --���ǹ�
    if(vdeptno = 10) then
        vdname := 'AAA';
    end if;
    
    if(vdeptno = 20) then
        vdname := 'BBB';
    end if;
    
    if(vdeptno = 30) then
        vdname := 'CCC';
    end if;
    
    if(vdeptno = 40) then
        vdname := 'DDD';
    end if;
    
    dbms_output.put_line(vdname);
end;
/

declare
    -- %ROWTYPE: ���̺��� ��� �÷��� �̸��� ������ �����ϰڴ�.
    -- �÷����� ���������� ���ǰ� �÷��� Ÿ���� ������ Ÿ������ ����Ѵ�.
    
    vemp emp%rowtype;
    
begin
    select *
    into vemp
    from emp
    where empno = 7788;
    
    dbms_output.put_line(vemp.empno);
    dbms_output.put_line(vemp.ename);
    dbms_output.put_line(vemp.job);
    dbms_output.put_line(vemp.mgr);
    dbms_output.put_line(vemp.hiredate);
    dbms_output.put_line(vemp.sal);
    dbms_output.put_line(vemp.comm);
    dbms_output.put_line(vemp.deptno);
end;
/

--PL/SQL ���� ���� ���
--��Į�� ���
--���۷��� ���
--1. emp.empno%type, �÷� �ϳ��ϳ��� �����ϴ� ���
--2. emp%rowtype, ���̺� ��ü�� �����ϴ� ���

--����� ���� ���� Ÿ��
--1. ���̺� type
--  TYPE xxxx
--2. ���ڵ� type

--���ǹ�
--if then end if;
--if then elsif end if;
--if then elsif then end if;

declare
--hint
--%ROWTYPE: ���̺��� ��� �÷��� �̸��� ������ �����ϰڴ�.
--�÷����� ���������� ���ǰ� �÷��� Ÿ���� ������ Ÿ������ ����Ѵ�.

    vemp emp%rowtype;
    annsal number(7,2);
    
begin
    dbms_output.put_line(' ��� / �̸� / ���� ');
    dbms_output.put_line('-------------------');
    
    select *
    into vemp
    from emp
    where empno = 7788;
    
    --�ش� ����� ������ ����ϼ���. ��, Ŀ�̼��� null�� ��� 0���� ���ǰ� �ϼ���.
    --���� ������ ���� annsal�� �־ ����ϼ���
    
    if(vemp.comm is null) then
        annsal := vemp.sal*12;
    else
        annsal := vemp.sal*12 + vemp.comm;
    end if;
    
    dbms_output.put_line(vemp.empno || '  ' || vemp.ename || '  ' || annsal);
end;
/

--���� if��
declare
    vemp emp%rowtype;
    vdname varchar2(10);
begin
    select *
    into vemp
    from emp
    where empno = 7788;
    
    if (vemp.deptno = 10) then
        vdname := 'AAA';
    elsif (vemp.deptno = 20) then
        vdname := 'BBB';
    elsif (vemp.deptno = 30) then
        vdname := 'CCC';
    elsif (vemp.deptno = 40) then
        vdname := 'DDD';
    end if;
    
    dbms_output.put_line(vdname);
end;
/
--�ݺ���

loop
    ���๮ (���� �ݺ���)
    ���� �ݺ����� ����
    1. EXIT WHEN ���ǽ�;
    2. IF THEN END IF;
end loop;

declare
    n number := 1;
begin
    loop
        dbms_output.put_line(n);
        n := n+1;
        exit when n > 10;
    end loop;
end;
/
--for��
declare
    
begin
    --in���� �ڿ� �ۼ��Ǵ� ���� �ݺ��� Ƚ���� �����Ѵ�.
    for n in 1..10 loop --���۰�..���ᰪ 1�� ���� 1~10(10ȸ �ݺ�)
        dbms_output.put_line(n);
    end loop;
end;
/

begin
    --in���� �ڿ� �ۼ��Ǵ� ���� �ݺ��� Ƚ���� �����Ѵ�.
    for n in reverse 1..10 loop --���۰�..���ᰪ ���� 10~1(10ȸ �ݺ�)
        dbms_output.put_line(n);
    end loop;
end;
/

declare
    vdept dept%rowtype;
begin
    for n in 1..4 loop
        select *
        into vdept
        from dept
        where deptno = n*10;
        dbms_output.put_line(vdept.deptno || ' ' || vdept.dname || ' ' || vdept.loc);
    end loop;
end;
/

--while��

declare

begin
    while(���ǽ�) loop
    ���๮(���� �ݺ���)
    end loop;
end;
/

declare
    n number := 1;
begin
    while(n <= 10) loop
        dbms_output.put_line(n);
        n := n+1;
    end loop;
end;
/

declare
    vdept dept%rowtype;
    n number := 1;
begin
    while(n <= 4) loop
    select *
    into vdept
    from dept
    where deptno = 10 * n;
    dbms_output.put_line(vdept.deptno || ' ' || vdept.dname || ' ' || vdept.loc);
    n := n+1;
    end loop;
end;
/