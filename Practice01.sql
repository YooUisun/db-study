--practice 01 2024-11-01
select *
from emp
order by ENAME;

select *
from emp
order by sal desc;

select *
from emp
where sal>2000
order by sal desc;

select *
from student
where grade in (2,3,4)
order by birthday;