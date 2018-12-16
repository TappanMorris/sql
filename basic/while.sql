declare @i int
declare @qid int

set @i=1
set @qid=100

while @i<50000
begin
insert into t_data( f_name) values('li')
set @i=@i+1
set @qid=@qid+1
end