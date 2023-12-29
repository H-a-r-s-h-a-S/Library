use library ;

-- database size
select concat(table_schema, ' size is ', round(sum(data_length+index_length)/1024/1024,4), ' MegaBytes') as `message:` from information_schema.tables where table_schema='library' group by table_schema ;

-- most read book
with temp as (select *, count(*) over(partition by book_id) cnt, row_number() over(partition by book_id order by rental_date desc) rn, dense_rank() over(order by book_id) rnk, dense_rank() over(order by book_id desc) rnk1 from rentals)
select b.id, b.name, t.cnt `number of times read` from books b join temp t on b.id = t.book_id where t.rn=1 and t.rnk=1 ;

-- least read book
with temp as (select *, count(*) over(partition by book_id) cnt, row_number() over(partition by book_id order by rental_date desc) rn, dense_rank() over(order by book_id) rnk, dense_rank() over(order by book_id desc) rnk1 from rentals) 
select b.id, b.name, t.cnt `number of times read` from books b join temp t on b.id = t.book_id where t.rn=1 and t.rnk1=1 ;

-- most read author
with temp as (select *, count(*) over(partition by book_id) cnt, row_number() over(partition by book_id order by rental_date desc) rn, dense_rank() over(order by book_id) rnk, dense_rank() over(order by book_id desc) rnk1 from rentals),
`most read book` as (select b.id, b.name, t.cnt `number of times read` from books b join temp t on b.id = t.book_id where t.rn=1 and t.rnk=1)
select a.name from authors a join books b on a.id=b.author_id where b.id=(select id from `most read book`) ;

-- least read author
with temp as (select *, count(*) over(partition by book_id) cnt, row_number() over(partition by book_id order by rental_date desc) rn, dense_rank() over(order by book_id) rnk, dense_rank() over(order by book_id desc) rnk1 from rentals) ,
`least read book` as (select b.id, b.name, t.cnt `number of times read` from books b join temp t on b.id = t.book_id where t.rn=1 and t.rnk1=1 )
select a.name from authors a join books b on a.id=b.author_id where b.id=(select id from `least read book`);

-- what genre of book generated the most income ?
select g.name, sum(p.cost) income
from genres g 
join books b on g.id=b.genre_id 
join rentals r on r.book_id=b.id 
join customers c on c.id=r.customer_id
join plans p on p.id=c.plan_id 
group by g.name
order by 2 desc
limit 1;

-- what is the mostly subscribed membership plan for members who read english books ?
with temp as (select l.name, p.id, count(1) purchases
from languages l 
join books b on l.id=b.language_id 
join rentals r on r.book_id=b.id 
join customers c on c.id=r.customer_id
join plans p on p.id=c.plan_id 
group by l.name, p.id ),
final as (select *, row_number() over(partition by name order by purchases desc, id desc) rn from temp)
select name, id, purchases from final 
where rn=1 and
name = 'English' ;

-- free and available number of slots in locations table
select case when book_id is null then 'unallocated' else 'allocated' end type, count(*) slots from locations group by case when book_id is null then 'unallocated
' else 'allocated' end order by 2 desc;
