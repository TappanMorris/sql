--��һ�� ��ѯStudent���е����м�¼��Sname��Ssex��Class�С�
--select tname, tsex, tclass from t_student

--�ڶ��� ��ѯ��ʦ���еĵ�λ�����ظ���Depart�С�
--select distinct depart from t_teacher

--������ ��ѯStudent������м�¼��
--select * from t_student

--������ ��ѯScore���гɼ���60��80֮������м�¼��
--select * from t_score where degree>=60 and degree<=80
--select * from t_score where degree between 60 and 80

--������ ��ѯScore���гɼ�Ϊ85��86��88�ļ�¼��
--select * from t_score where degree in(85,86,88)

--������ ��ѯStudent���С�95031������Ա�Ϊ��Ů����ͬѧ��¼��
--select * from t_student where tclass='95031' or tsex='Ů'

--������ ��Class�����ѯStudent������м�¼��
--select * from t_student order by tclass desc

--�ڰ��� ��Cno����Degree�����ѯScore������м�¼��
--select * from t_score order by cno asc, degree desc

--�ھ��� ��ѯ��95031�����ѧ��������
--select count(tno) from t_student where tclass='95031'

--��ʮ�� ��ѯScore���е���߷ֵ�ѧ��ѧ�źͿγ̺š����Ӳ�ѯ��������
--select sno, cno from t_score where degree=(select max(degree) from t_score)
--select top 1 sno, cno from t_score order by degree desc

--��ʮһ�� ��ѯÿ�ſε�ƽ���ɼ��� notice
--select avg(degree) as ƽ���� from t_score  group by cno

--��ʮ���� ��ѯScore����������5��ѧ��ѡ�޵Ĳ���3��ͷ�Ŀγ̵�ƽ��������notice
--select avg(degree) from t_score where cno like '3%' group by cno having count(cno)>4

--��ʮ���� ��ѯ��������70��С��90��Sno�С�
--select sno from t_score where degree between 70 and 90

--��ʮ���� ��ѯ����ѧ����Sname��Cno��Degree�С�
--select t.tname, s.cno, s.degree from t_student t join t_score s on t.tno=s.sno

--��ʮ���� ��ѯ����ѧ����Sno��Cname��Degree�С�
--select s.sno, c.cname, s.degree from t_score s join t_course c on s.cno=c.cno

--��ʮ���� ��ѯ����ѧ����Sname��Cname��Degree�С�
--select t.tname, c.cname, s.degree from t_student t join t_score s on  t.tno=s.sno join t_course c on s.cno=c.cno

--��ʮ���� ��ѯ��95033����ѧ����ƽ���֡�
--select avg(degree) from t_score where sno in(select tno from t_student where tclass='95033')

--��ʮ���� ��ѯѡ�ޡ�3-105���γ̵ĳɼ����ڡ�109����ͬѧ�ɼ�������ͬѧ�ļ�¼��
--select * from t_student t, t_score s where s.cno='3-105' and t.tno=s.sno and s.degree>(select degree from t_score where cno='3-105' and sno='109')

--�ڶ�ʮһ�� ��ѯ�ɼ�����ѧ��Ϊ��109�����γ̺�Ϊ��3-105���ĳɼ������м�¼��
--select * from t_student t, t_score s where t.tno=s.sno and s.degree>(select degree from t_score where sno='109' and cno='3-105')

--�ڶ�ʮ���� ��ѯ��ѧ��Ϊ107��ͬѧͬ�����������ѧ����Sno��Sname��Sbirthday�С�
--select tno, tname, tbirthday from t_student where year(tbirthday)=(select year(tbirthday) from t_student where tno='107')

--�ڶ�ʮ���� ��ѯ�����񡰽�ʦ�οε�ѧ���ɼ���
select * from t_score s, t_course c, t_teacher t where t.name='����' and c.tno=t.tno and c.cno=s.cno


--�ڶ�ʮ���� ��ѯѡ��ĳ�γ̵�ͬѧ��������5�˵Ľ�ʦ������**
--select name from t_teacher where tno in(select tno from t_course c where c.cno in(select cno from t_score group by cno having count(*)>5))

--�ڶ�ʮ���� ��ѯ95033���95031��ȫ��ѧ���ļ�¼��
--select * from t_student where tclass='95031' or tclass='95033' order by tno asc

--�ڶ�ʮ���� ��ѯ������85�����ϳɼ��Ŀγ�Cno.
--select cno from t_score where degree>85

--�ڶ�ʮ���� ��ѯ���������ϵ����ʦ���̿γ̵ĳɼ���
--select * from t_score s where s.cno in (select cno from t_course c where tno in(select tno from t_teacher where depart='�����ϵ'))

--�ڶ�ʮ���� ��ѯ�������ϵ���롰���ӹ���ϵ����ְͬ�ƵĽ�ʦ��Tname��Prof��ʹ������Ӳ�ѯ


--�ڶ�ʮ���� ��ѯѡ�ޱ��Ϊ��3-105���γ��ҳɼ����ٸ���ѡ�ޱ��Ϊ��3-245���γ̵�ͬѧ��Cno��Sno��Degree,����Degree�Ӹߵ��ʹ�������
--select cno, sno, degree from t_score where cno='3-105' and degree>(select min(degree) from t_score where cno='3-245') order by degree desc

--����ʮ�� ��ѯѡ�ޱ��Ϊ��3-105���γ��ҳɼ�����ѡ�ޱ��Ϊ��3-245���γ̵�ͬѧ��Cno��Sno��Degree.
--select cno, sno, degree from t_score where cno='3-105' and degree>(select max(degree) from t_score where cno='3-245')


--31�� ��ѯ���н�ʦ��ͬѧ��name��sex��birthday.
--select s.tname, s.tsex, s.tbirthday,t.name, t.sex, t.birthday from t_student s
--join t_score r on r.sno=s.tno
--join t_course c on c.cno=r.cno
--join t_teacher t on t.tno=c.tno

--32����ѯ���С�Ů����ʦ�͡�Ů��ͬѧ��name��sex��birthday. ����Ĵ����д�
--select s.tname, s.tsex, s.tbirthday from t_student s where s.tsex='Ů'
--union allselect t.name, t.sex, t.birthday from t_teacher t where t.sex='Ů'

--33�� ��ѯ�ɼ��ȸÿγ�ƽ���ɼ��͵�ͬѧ�ĳɼ���
--select * from t_score s where degree<(select avg(degree) from t_score t where t.cno=s.cno)

--34�� ��ѯ�����ον�ʦ��Tname��Depart.
--select e.name, e.depart from t_teacher e where e.tno in (select t.tno from t_teacher t, t_score s, t_course c where t.tno=c.tno and c.cno=s.cno)

--36����ѯ������2�������İ�š�
--select t.tclass,count(tsex) from  t_student t where tsex='��' group by tclass having count(tsex)>1

--37����ѯStudent���в��ա�������ͬѧ��¼��
--select * from t_student where tname not like '��%'

--38����ѯStudent����ÿ��ѧ�������������䡣
--select tname, year(getdate())-year(tbirthday) age from t_student

--39����ѯStudent����������С��Sbirthday����ֵ��
--select max(tbirthday) as max, min(tbirthday) as min from t_student

--40�԰�ź�����Ӵ�С��˳���ѯStudent���е�ȫ����¼��
--select * from t_student order by tclass desc, tbirthday asc

--����ʮһ�� ��ѯ���С���ʦ�������ϵĿγ̡�
--select cname from  t_course c where c.tno in(select tno from t_teacher t where t.sex='��')
--select t.name, c.cname from t_teacher t, t_course c where t.sex='��' and t.tno=c.tno

--����ʮ���� ��ѯ��߷�ͬѧ��Sno��Cno��Degree�С�
--select * from t_score where degree=(select max(degree) from t_score)
--select top 1 * from t_score order by degree desc

--����ʮ���� ��ѯ�͡������ͬ�Ա������ͬѧ��Sname.
--select tname from t_student where tsex=(select tsex from t_student where tname='���') and tname not in ('���')

--����ʮ���� ��ѯ�͡������ͬ�Ա�ͬ���ͬѧSname.
--select tname from t_student where tsex=(select tsex from t_student where tname='���') and tname not in ('���') 
--and tclass=(select tclass from t_student where tname='���')

--����ʮ���� ��ѯ����ѡ�ޡ���������ۡ��γ̵ġ��С�ͬѧ�ĳɼ���
--select * from t_score s where s.cno in (select c.cno from t_course c where c.cname='���������') and 
--s.sno in (select t.tno from t_student t where t.tsex='��')
