--use TestData
--if exists ( select * 
-- from  sysobjects
-- where name = 't_data'
-- and type = 'U')
-- drop table user_mess
--go
--create table t_data(id int primary key,
--f_name varchar(50) not null,
--f_passwd varchar(50) not null)

INSERT INTO t_data (f_name, f_passwd) VALUES ('vincentlee', '123456')