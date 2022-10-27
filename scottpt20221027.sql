--출력함수 기능 켜기
set serveroutput on;

--프로시저 작업 과정을 잃지 않기 위해 매번 백업용 파일을 생성해서 복사 붙여넣기 하는 편이
--불편하지만 백업에 유용하다...
declare
    n number := 1;
begin
    while(n <= 10) loop
        dbms_output.put_line(n);
        n := n+1;
    end loop;
end;
/

--저장 프로시저(procedure)
--1. 생성(create)
--2. 실행(execute or exec)
create or replace procedure(매개변수)

is or as
    변수 정의
begin
    SQL
    출력구문
    조건문, 반복문
end;
/
--저장 프로시저(procedure)

--기존에 존재하던 연습용 테이블 emp01 삭제
drop table emp01;

--연습용 테이블 emp01 생성
--원본 테이블(emp)를 훼손하지 않기 위해 만들었다.
create table emp01
as
select * from emp;

--emp01 테이블 조회
select * from emp01;

--프로시저 생성
--해당 프로시저는 emp01 테이블에 두 개의 컬럼에 데이터를 넣는다.
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

--프로시저 실행
execute emp01_prt;
exec emp01_prt;

--해당 프로시저는 emp01 테이블의 컬럼의 데이터들을 모두 삭제한다.
create or replace procedure emp01_del
is
begin
    delete from emp01;
end;
/

--프로시저 실행
execute emp01_del;
exec emp01_del;

--프로시저 생성
--해당 프로시저는 테이블 emp01의 칼럼 ename의 매개변수로 받은 지정된 데이터를 지운다.
create or replace procedure del_ename(vename emp01.ename%type)
is

begin
    delete from emp01
    where ename = vename;
end;
/

--프로시저 실행
execute del_ename('SCOTT');
exec del_ename('SCOTT');

--프로시저 실행
execute del_ename('SMITH');
exec del_ename('SMITH');

--저장 프로시저의 매개변수 유형
--in, out, in out
--in: 값을 전달받는 용도
--out: 프로시저 내부의 실행 결과를 실행을 요청한 쪽으로 전달
--in out: in + out

--프로시저 생성
create or replace procedure sel_empno
(
    --매개변수로서 값을 받는다.
    vempno in emp.empno%type,
    
    --매개변수지만, begin에서 실행한 결과를 리턴한다.
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

--out으로 리턴한 값을 받기 위해서는 받는 역할을 하는 바인드 변수를 선언하여 받은 값을 저장한 뒤, 실행 프로시저에서 같이 변수명을 적어야한다.
variable var_ename varchar2(15);
variable var_sal number;
variable var_job varchar2(9);

--프로시저 실행
--바인드 변수를 적을 땐, 앞에 :(콜론)을 적어야 한다.
exec sel_empno(7499, :var_ename, :var_sal, :var_job);

print var_ename;
print var_sal;
print var_job;

--사원 정보를 저장하는 저장 프로시저를 만드세요.
--사번, 이름, 직책, 매니저, 부서
--사원 정보는 매개변수를 사용해서 받아온다.

--기존에 연습하던 테이블 emp02 삭제
drop table emp02;

--연습용 테이블 emp02 생성.
create table emp02
as
select empno, ename, job, mgr, deptno
from emp
where 1 != 1;

--테이블 emp02 조회
select * from emp02;

--프로시저 생성
--해당 프로시저는 사원의 정보를 받아 저장한다.
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

--프로시저 실행
exec save_emp02(1111, '홍길동', 'DEV', NULL, 10);

--저장함수
--저장함수와 저장 프로시저의 차이점: return값 유무
--1. 생성(create)
--2. 

create or replace function 함수명(매개변수)
    RETURN 값의 타입
    --세미콜론 생략
is
    변수정의
begin
    SQL구문
    출력함수
    조건문, 반복문
    
    RETURN 리턴값;
    --세미콜론 사용
end;
/

--프로시저 생성
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
--변수 선언

execute :var_res := cal_bonus(7788);
--execute 뒤에 변수를 선언해야 한다.

print :var_res;

--프로시저 삭제

drop procedure insert_sawon;
drop function cal_bonus;

--명시적 커서
DECLARE
    --커서: SELECT 구문이 실행하는 결과를 가리킨다.
    CURSOR 커서명 IS sql 구문(SELECT);
    --커서 선언
BEGIN
    OPEN 커서명;
    LOOP
        FETCH 커서명 INTO 변수명;
        --테이블로부터 가져와서 변수에 저장하는 역할
        EXIT WHEN 커서명%NOTFOUND;
    END LOOP
    CLOSE 커서명;
END;
/
--명시적 커서

DECLARE
    --커서: SELECT 구문이 실행하는 결과를 가리킨다.
    CURSOR c1 IS SELECT * FROM emp;
    vemp emp%rowtype;
    --커서 선언
BEGIN
    OPEN c1;
    LOOP
        FETCH c1 INTO vemp;
        --테이블로부터 가져와서 변수에 저장하는 역할
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

--아이디, 퍼스트 네임, 라스트 네임, 부서 이름
--employees, departments

--hr 계정에서 실행

--조인방식
SELECT employee_id, first_name, last_name, department_name
FROM employees e inner join departments d
ON e.department_id = d.department_id
WHERE e.department_id = 100;

--서브쿼리
--부서 번호를 비교하여 해당 부서번호의 부서명을 조회한다.
SELECT employee_id, first_name, last_name, department_id,
(
    SELECT department_name
    FROM departments d
    WHERE e.department_id = d.department_id
) as dept_names
    
FROM employees e
WHERE department_id = 100;

--프로시저(함수)
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

--그룹함수를 통한 조회
select count(*) from employees;

--department_id가 null인 사원을 조회
select * from employees
where department_id is null;

--프로시저 실행
exec :var_dept_name := get_dept_name(90);

print var_dept_name;

select sum(sal), max(sal)
from emp;

--조회할 것들
--employees, jobs
--사원아이디, 이름, 성, job_title

--조인 방식
SELECT employee_id, first_name, last_name, job_title
FROM employees e INNER JOIN jobs j
ON e.job_id = j.job_id;

--서브쿼리
SELECT employee_id, first_name, last_name, job_id,
(
    SELECT job_title
    FROM jobs j
    WHERE e.job_id = j.job_id
) AS job_title
FROM employees e;

--프로시저(함수), get_job_title()
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

--프로시저 실행을 통해 함수 정상 작동 확인
VARIABLE var_job_title VARCHAR2(30);
EXEC :var_job_title := get_job_title('AD_PRES');

PRINT var_job_title;


SELECT employee_id, first_name, last_name, get_job_title(job_id )
FROM employees;

--hr 계정에서 실행
