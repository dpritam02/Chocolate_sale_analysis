use company;

select * from worker;
select * from bonus;
select * from title;

-- answers
select first_name as worker_name from worker; -- 1
select lower(first_name) from worker; -- 2
select distinct department from worker; -- 3
select department from worker group by department; -- 3
select substring(first_name,1,3) from worker; -- 4
select instr(FIRST_NAME, 'A') from worker where first_name = "MONIKA"; -- 5
select rtrim(first_name) from worker; -- 6
select ltrim(first_name) from worker; -- 7
select distinct department, length(department) from worker; -- 8
select replace(first_name,'A','a') from worker; -- 9
select concat(first_name," ",last_name) as fullname from worker; -- 10
select * from worker order by FIRST_NAME asc, department desc; -- 11,12
select * from worker where first_name in ('monika','bebo'); -- 13
select * from worker where first_name not in ('monika','bebo'); -- 14
select * from worker where department like 'ADMIN%'; -- 15
select * from worker where first_name like '%a%'; -- 16
select * from worker where first_name like '%a'; -- 17
select * from worker where first_name like '_____a'; -- 18
select * from worker where salary between 1000 and 2000; -- 19
-- 20 easy
select department , count(department) from worker where department = 'Hr'; -- 21
select concat(first_name,last_name) as fullname from worker where salary between 100 and 2000; -- 22
select department , count(worker_id) as number_of_worker from worker group by department order by count(worker_id) desc; -- 23
select w.* from worker as w inner join title as t on w.worker_id = t.worker_ref_id where t.worker_title = 'Manager'; -- 24** -> w.* for worker table info only
select worker_title, count(worker_title) as number_of_title from title group by worker_title having count(worker_title) > 1; -- 25**
select * from worker where mod(worker_id, 2) != 0; -- 26 **
select * from worker where mod(worker_id, 2) <> 0; -- 26 (alt sysmbol)
select * from worker where mod(worker_id, 2) = 0; -- 27 **
create table worker_clone like worker; -- 28**
insert into worker_clone select * from worker; -- 28
select worker.* from worker inner join worker_clone using(worker_id); -- 29
select worker_id, first_name from worker where worker_id in(select worker_ref_id from title); -- 29
select worker.* from worker left join worker_clone using(worker_id) where worker_clone.worker_id is null; -- 30
select now(); -- 31
select * from worker order by salary desc limit 5; -- 32
select * from worker order by salary desc; -- support 33
select * from worker order by salary limit 1,1; -- 33 // 2nd highest salary ->(n-1),1
select * from worker w1 
where 2 =  (
select count(distinct(w2.salary))
from worker w2
where w2.salary >= w1.salary
); -- 34 without using limit keyword
select w1.* from worker w1, worker w2 where w1.salary = w2.salary and w1.worker_id != w2.worker_id; -- 35
select max(salary) from worker
	where salary not in(select max(salary) from worker); -- 36 for 2nd highest salary
select max(salary) from worker
		where salary not in (
			select max(salary) from worker
            union 
            select max(salary) from worker
            where salary not in(select max(salary) from worker)
        ); -- 36 for 3rd highest salary
select * from worker
union all
select * from worker order by worker_id; -- 37 show one row twice
select worker_id from worker where worker_id not in (select worker_ref_id from bonus); -- 38
select * from worker where worker_id <= (select count(worker_id)/2 from worker); -- 39
select department , count(department) as depcount from worker group by department having depcount < 3 ; -- 40
select department , count(department) as depcount from worker group by department; -- 41
SELECT * FROM worker ORDER BY worker_id DESC LIMIT 1; -- 42
SELECT * FROM worker where worker_id = (select min(worker_id) from worker); -- 43
SELECT * FROM worker ORDER BY worker_id desc LIMIT 5; -- 44
select w.department, w.first_name, w.salary from
	(select max(salary)as maxsal, department from worker group by department) temp -- temporary table form
    inner join worker w on temp.department = w.department and temp.maxsal = w.salary; -- 45
select distinct salary from worker order by salary desc; -- 46(helping)
select * from worker w1
where 3 >= (select count(distinct salary) from worker w2 
where w1.salary <= w2.salary) order by salary desc; -- 46**(using corelation)
select * from worker order by salary desc limit 3; -- 46(using limit)
select distinct salary from worker order by salary  limit 3; -- 47(using limit)
select distinct salary from worker w1
where 3 >= (select count(distinct salary) from worker w2 
where w1.salary >= w2.salary) order by salary desc; -- 47(using correlation)
-- 48 is generalised by using n
select department, sum(salary) as sumsal from worker group by department order by sumsal desc; -- 49
select salary, first_name from worker where salary = (select max(salary) from worker); -- 50
select salary, first_name from worker order by salary desc limit 1; -- 50(using limit)











