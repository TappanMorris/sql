use TestData
--if exists ( select * from  sysobjects where name = 't_data' and type = 'U')
--  print 'exist'  
--else
--create table t_data(id int primary key,f_name varchar(50) not null,f_passwd varchar(50) not null)

--if object_id('t_data') is  not null  
--     print'not exist'

--if object_id('t_data') is not null
--drop table t_data

-- go 
-- create table t_data (id int identity(1,1) primary key, f_name varchar(50) not null)

 insert into t_data (f_name) values('vincentlee')
