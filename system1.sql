--DLC(�����)
--grant(���Ѻο�), revoke(����ȸ��)

--����� ����(��ü)
--create, alter, drop
--create user ������ identified by �н�����
--alter user ������ identified by �н�����
--drop user ������ cascade

--������ �������� ����(system)

--grant ��ü���� ����
--on ��ü��
--to ������

grant select
on emp
to user01;

revoke select
on emp
from user01;



grant create view -- view ���̺��� ������ �� �ִ� ���Ѻο�
to scott;

--���� ���� �ο�
grant create session
to user01;

--���̺� ���� ���� �ο�
grant create table to user01;

--���̺� ���� ���� ȸ��
revoke create table from user01;

--����
create user user01 identified by 1234;

--����
alter user user01 identified by tiger;

--����
drop user user01 CASCADE;

alter user user01
quota 2m on USERS;

--�ý��� ����(create ...)
--��ü ����(select ...)

create user user02 identified by 1234;

grant connect, resource
to user02;

create user nbac identified by 1234;

grant DBA, connect, resource
to nbac;

--����� ���� ��
--������ ���������� ����
--create role �Ѹ�
--grant ���� to �Ѹ�

create role mrole;
grant create session, create table, create view
to mrole;

create user user03 identified by 1234;

create user user04 identified by 1234;

grant mrole
to user04;

alter user user04
quota 2m on USERS;

--������ ���ѿ��� �� ����
create role mrole2;

-- �� scott.sql�� �̵� 

--�ѱ����� ������ ���������� ����
grant mrole2
to user04;

create role mrole3;

grant mrole3
to user01;

revoke mrole3
from user01;

revoke mrole2
from user04;

--���� ����
create user user05 identified by 1234;

--���� �ο�
grant connect, resource
to user05;

--���� �ο�
grant mrole3
to user05;

--���� ȸ��
revoke mrole3
to user05;

--���� ����
drop role mrole3;