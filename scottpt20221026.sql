--출력함수 기능 켜기
set serveroutput on;

--PL/SQL(확장된 SQL언어)
--변수, 조건문, 반복문
--마지막 '/'를 빼먹으면 동작하지 않는다. 필수!
declare
    변수 정의
begin
    SQL구문 작성
    출력구문 작성 --쿼리문의 수행결과를 반드시 출력함수를 통해서 확인해야 한다.
exception
    예외처리 구문
end;
/

begin
    --출력함수
    dbms_output.put_line('Hello World');
end;
/

declare
--  변수명 데이터 타입
--  컬럼 생성과 동일하다.
    --vempno number(4);
    --vename varchar2(10);
    
    --constant: 상수 키워드
    vempno constant number(4) := 7777;
    --null 값을 변수의 값으로 사용할 수 없다.
    --not null을 변수의 조건으로 사용할 수 있다.
    vename varchar2(10) not null := 'SCOTT';
begin
--  대입연산자를 사용할 때 반드시 앞에 콜론을 넣어주어야 한다.
     --vempno := 7777;
     --vename := 'SCOTT';
     
     dbms_output.put_line('사원 / 이름');
     dbms_output.put_line(vempno || ' ' || vename);
end;
/

declare
    --스칼라 방식
    --변수명과 변수의 데이터 타입을 지정하는 방식
    --vempno number(4)
    
    --레퍼런스 방식
    --기존 테이블의 컬럼의 타입을 참조한다.
    vempno emp.empno%type := 7777; 
begin
    --vempno := 7777;
    dbms_output.put_line(vempno);
end;
/

declare
    --레퍼런스 방식
    vempno emp.empno%type;
    vename emp.ename%type;
begin
    --select 구문을 사용할 때는 조회한 데이터를 반드시 변수에 담아서 사용해야 한다.
    --꼭 into절을 사용해서 데이터를 변수에 넘겨주어야 한다.
    --where절을 붙여서 조건을 정한다음 주어야 한다(조건을 붙이지 않으면 모든 데이터가 넘어오기 때문).
    select empno, ename 
    into vempno, vename --(필수)
    from emp;
    --where empno = 7788; --(필수)
    
    dbms_output.put_line('사번 / 이름');
    dbms_output.put_line(vempno || ' ' || vename);
exception   --예외처리
    --JAVA의 Try&Catch문
    when TOO_MANY_ROWS then dbms_output.put_line('행의 수가 여러개 입니다.');
    when OTHERS then dbms_output.put_line('모든 예외의 대한 처리');
end;
/

declare
    --테이블 type(사용자 정의 변수 타입)
    --배열의 형식
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
    enameArr ename_table_type;  --배열형식의 변수 선언
    jobArr job_table_type;  --배열형식의 변수 선언
    mgrArr mgr_table_type;
    hiredateArr hiredate_table_type;
    salArr sal_table_type;
    commArr comm_table_type;
    deptnoArr deptno_table_type;
    
    --미리 선언을 해두어야 한다.
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
    --레코드 type(여러개의 변수를 묶어서 사용한다) → 사용자의 정의 변수 타입
    --클래스와 유사하다.
    
    TYPE emp_record_type IS RECORD(
    v_empno emp.empno%type,
    v_ename emp.ename%type,
    v_job emp.job%type,
    v_deptno emp.deptno%type
);

emp_record emp_record_type; --레코드 타입의 변수 선언
begin
    select empno, ename, job, deptno into emp_record
    from emp
    where empno = 7788;
    
    dbms_output.put_line(emp_record.v_empno || ' ' || emp_record.v_ename || ' ' || emp_record.v_job || ' ' || emp_record.v_deptno);
end;
/ 

--연습용 테이블 생성
create table dept_record
as
select * from dept;

drop table dept_record;

--PL/SQL 컬럼 데이터 삽입 / insert
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
    
    --본래 컬럼의 개수대로 넣을 데이터와 동일하게 수를 맞추어 괄호안에 해주어야 하나 수가 같고, 레코드로 묶었기 때문에 생략이 가능하다.
    insert into dept_record --(v_deptno, v_dname, v_loc)
    values dept_rec; --(50, 'DEV', 'BUSAN')
end;
/

select * from dept_record;

--PL/SQL 컬럼 데이터 수정 / update
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

--PL/SQL 컬럼 데이터 삭제 / delete
declare
    v_deptno dept_record.deptno%type := 50;
begin
    delete from dept_record
    where deptno = v_deptno;
end;
/

--조건문
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
    
    --조건문
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
    -- %ROWTYPE: 테이블의 모든 컬럼의 이름과 변수를 참조하겠다.
    -- 컬럼명이 변수명으로 사용되고 컬럼의 타입을 변수의 타입으로 사용한다.
    
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

--PL/SQL 변수 선언 방식
--스칼라 방식
--레퍼런스 방식
--1. emp.empno%type, 컬럼 하나하나를 참조하는 방식
--2. emp%rowtype, 테이블 전체를 참조하는 방식

--사용자 정의 변수 타입
--1. 테이블 type
--  TYPE xxxx
--2. 레코드 type

--조건문
--if then end if;
--if then elsif end if;
--if then elsif then end if;

declare
--hint
--%ROWTYPE: 테이블의 모든 컬럼의 이름과 변수를 참조하겠다.
--컬럼명이 변수명으로 사용되고 컬럼의 타입을 변수의 타입으로 사용한다.

    vemp emp%rowtype;
    annsal number(7,2);
    
begin
    dbms_output.put_line(' 사번 / 이름 / 연봉 ');
    dbms_output.put_line('-------------------');
    
    select *
    into vemp
    from emp
    where empno = 7788;
    
    --해당 사원의 연봉을 출력하세요. 단, 커미션이 null일 경우 0으로 계산되게 하세요.
    --계산된 연봉을 변수 annsal에 넣어서 출력하세요
    
    if(vemp.comm is null) then
        annsal := vemp.sal*12;
    else
        annsal := vemp.sal*12 + vemp.comm;
    end if;
    
    dbms_output.put_line(vemp.empno || '  ' || vemp.ename || '  ' || annsal);
end;
/

--다중 if문
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
--반복문

loop
    실행문 (무한 반복문)
    무한 반복문의 제어
    1. EXIT WHEN 조건식;
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
--for문
declare
    
begin
    --in구문 뒤에 작성되는 값이 반복의 횟수를 결정한다.
    for n in 1..10 loop --시작값..종료값 1씩 증가 1~10(10회 반복)
        dbms_output.put_line(n);
    end loop;
end;
/

begin
    --in구문 뒤에 작성되는 값이 반복의 횟수를 결정한다.
    for n in reverse 1..10 loop --시작값..종료값 역순 10~1(10회 반복)
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

--while문

declare

begin
    while(조건식) loop
    실행문(무한 반복문)
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