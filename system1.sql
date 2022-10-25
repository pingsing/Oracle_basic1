--DLC(제어어)
--grant(권한부여), revoke(권한회수)

--사용자 관리(객체)
--create, alter, drop
--create user 계정명 identified by 패스워드
--alter user 계정명 identified by 패스워드
--drop user 계정명 cascade

--관리자 계정에서 가능(system)

--grant 객체권한 종류
--on 객체명
--to 계정명

grant select
on emp
to user01;

revoke select
on emp
from user01;



grant create view -- view 테이블을 생성할 수 있는 권한부여
to scott;

--접속 권한 부여
grant create session
to user01;

--테이블 생성 권한 부여
grant create table to user01;

--테이블 생성 권한 회수
revoke create table from user01;

--생성
create user user01 identified by 1234;

--변경
alter user user01 identified by tiger;

--삭제
drop user user01 CASCADE;

alter user user01
quota 2m on USERS;

--시스템 권한(create ...)
--객체 권한(select ...)

create user user02 identified by 1234;

grant connect, resource
to user02;

create user nbac identified by 1234;

grant DBA, connect, resource
to nbac;

--사용자 정의 롤
--관리자 계정에서만 가능
--create role 롤명
--grant 권한 to 롤명

create role mrole;
grant create session, create table, create view
to mrole;

create user user03 identified by 1234;

create user user04 identified by 1234;

grant mrole
to user04;

alter user user04
quota 2m on USERS;

--관리자 권한에서 롤 생성
create role mrole2;

-- → scott.sql로 이동 

--롤권한은 관리자 계정에서만 가능
grant mrole2
to user04;

create role mrole3;

grant mrole3
to user01;

revoke mrole3
from user01;

revoke mrole2
from user04;

--계정 생성
create user user05 identified by 1234;

--권한 부여
grant connect, resource
to user05;

--권한 부여
grant mrole3
to user05;

--권한 회수
revoke mrole3
to user05;

--권한 삭제
drop role mrole3;