--第一题 查询Student表中的所有记录的Sname、Ssex和Class列。
--select tname, tsex, tclass from t_student

--第二题 查询教师所有的单位即不重复的Depart列。
--select distinct depart from t_teacher

--第三题 查询Student表的所有记录。
--select * from t_student

--第四题 查询Score表中成绩在60到80之间的所有记录。
--select * from t_score where degree>=60 and degree<=80
--select * from t_score where degree between 60 and 80

--第五题 查询Score表中成绩为85，86或88的记录。
--select * from t_score where degree in(85,86,88)

--第六题 查询Student表中“95031”班或性别为“女”的同学记录。
--select * from t_student where tclass='95031' or tsex='女'

--第七题 以Class降序查询Student表的所有记录。
--select * from t_student order by tclass desc

--第八题 以Cno升序、Degree降序查询Score表的所有记录。
--select * from t_score order by cno asc, degree desc

--第九题 查询“95031”班的学生人数。
--select count(tno) from t_student where tclass='95031'

--第十题 查询Score表中的最高分的学生学号和课程号。（子查询或者排序）
--select sno, cno from t_score where degree=(select max(degree) from t_score)
--select top 1 sno, cno from t_score order by degree desc

--第十一题 查询每门课的平均成绩。 notice
--select avg(degree) as 平均分 from t_score  group by cno

--第十二题 查询Score表中至少有5名学生选修的并以3开头的课程的平均分数。notice
--select avg(degree) from t_score where cno like '3%' group by cno having count(cno)>4

--第十三题 查询分数大于70，小于90的Sno列。
--select sno from t_score where degree between 70 and 90

--第十四题 查询所有学生的Sname、Cno和Degree列。
--select t.tname, s.cno, s.degree from t_student t join t_score s on t.tno=s.sno

--第十五题 查询所有学生的Sno、Cname和Degree列。
--select s.sno, c.cname, s.degree from t_score s join t_course c on s.cno=c.cno

--第十六题 查询所有学生的Sname、Cname和Degree列。
--select t.tname, c.cname, s.degree from t_student t join t_score s on  t.tno=s.sno join t_course c on s.cno=c.cno

--第十七题 查询“95033”班学生的平均分。
--select avg(degree) from t_score where sno in(select tno from t_student where tclass='95033')

--第十九题 查询选修“3-105”课程的成绩高于“109”号同学成绩的所有同学的记录。
--select * from t_student t, t_score s where s.cno='3-105' and t.tno=s.sno and s.degree>(select degree from t_score where cno='3-105' and sno='109')

--第二十一题 查询成绩高于学号为“109”、课程号为“3-105”的成绩的所有记录。
--select * from t_student t, t_score s where t.tno=s.sno and s.degree>(select degree from t_score where sno='109' and cno='3-105')

--第二十二题 查询和学号为107的同学同年出生的所有学生的Sno、Sname和Sbirthday列。
--select tno, tname, tbirthday from t_student where year(tbirthday)=(select year(tbirthday) from t_student where tno='107')

--第二十三题 查询“张旭“教师任课的学生成绩。
select * from t_score s, t_course c, t_teacher t where t.name='张旭' and c.tno=t.tno and c.cno=s.cno


--第二十四题 查询选修某课程的同学人数多于5人的教师姓名。**
--select name from t_teacher where tno in(select tno from t_course c where c.cno in(select cno from t_score group by cno having count(*)>5))

--第二十五题 查询95033班和95031班全体学生的记录。
--select * from t_student where tclass='95031' or tclass='95033' order by tno asc

--第二十六题 查询存在有85分以上成绩的课程Cno.
--select cno from t_score where degree>85

--第二十七题 查询出“计算机系“教师所教课程的成绩表。
--select * from t_score s where s.cno in (select cno from t_course c where tno in(select tno from t_teacher where depart='计算机系'))

--第二十八题 查询“计算机系”与“电子工程系“不同职称的教师的Tname和Prof。使用相关子查询


--第二十九题 查询选修编号为“3-105“课程且成绩至少高于选修编号为“3-245”课程的同学的Cno、Sno和Degree,并按Degree从高到低次序排序。
--select cno, sno, degree from t_score where cno='3-105' and degree>(select min(degree) from t_score where cno='3-245') order by degree desc

--第三十题 查询选修编号为“3-105”课程且成绩高于选修编号为“3-245”课程的同学的Cno、Sno和Degree.
--select cno, sno, degree from t_score where cno='3-105' and degree>(select max(degree) from t_score where cno='3-245')


--31、 查询所有教师和同学的name、sex和birthday.
--select s.tname, s.tsex, s.tbirthday,t.name, t.sex, t.birthday from t_student s
--join t_score r on r.sno=s.tno
--join t_course c on c.cno=r.cno
--join t_teacher t on t.tno=c.tno

--32、查询所有“女”教师和“女”同学的name、sex和birthday. 这里的代码有错
--select s.tname, s.tsex, s.tbirthday from t_student s where s.tsex='女'
--union allselect t.name, t.sex, t.birthday from t_teacher t where t.sex='女'

--33、 查询成绩比该课程平均成绩低的同学的成绩表。
--select * from t_score s where degree<(select avg(degree) from t_score t where t.cno=s.cno)

--34、 查询所有任课教师的Tname和Depart.
--select e.name, e.depart from t_teacher e where e.tno in (select t.tno from t_teacher t, t_score s, t_course c where t.tno=c.tno and c.cno=s.cno)

--36、查询至少有2名男生的班号。
--select t.tclass,count(tsex) from  t_student t where tsex='男' group by tclass having count(tsex)>1

--37、查询Student表中不姓“王”的同学记录。
--select * from t_student where tname not like '王%'

--38、查询Student表中每个学生的姓名和年龄。
--select tname, year(getdate())-year(tbirthday) age from t_student

--39、查询Student表中最大和最小的Sbirthday日期值。
--select max(tbirthday) as max, min(tbirthday) as min from t_student

--40以班号和年龄从大到小的顺序查询Student表中的全部记录。
--select * from t_student order by tclass desc, tbirthday asc

--第四十一题 查询“男”教师及其所上的课程。
--select cname from  t_course c where c.tno in(select tno from t_teacher t where t.sex='男')
--select t.name, c.cname from t_teacher t, t_course c where t.sex='男' and t.tno=c.tno

--第四十二题 查询最高分同学的Sno、Cno和Degree列。
--select * from t_score where degree=(select max(degree) from t_score)
--select top 1 * from t_score order by degree desc

--第四十三题 查询和“李军”同性别的所有同学的Sname.
--select tname from t_student where tsex=(select tsex from t_student where tname='李军') and tname not in ('李军')

--第四十四题 查询和“李军”同性别并同班的同学Sname.
--select tname from t_student where tsex=(select tsex from t_student where tname='李军') and tname not in ('李军') 
--and tclass=(select tclass from t_student where tname='李军')

--第四十五题 查询所有选修“计算机导论”课程的“男”同学的成绩表
--select * from t_score s where s.cno in (select c.cno from t_course c where c.cname='计算机导论') and 
--s.sno in (select t.tno from t_student t where t.tsex='男')
