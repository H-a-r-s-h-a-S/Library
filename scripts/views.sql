use library ;

-- books by author, genre, year
drop view if exists `categorized books`;
create view `categorized books` as select a.name author, b.name book, g.name genre, b.year from authors a join books b on a.id=b.author_id join genres g on g.id=b.genre_id ;

-- number of copies of books
drop view if exists `number of copies of books`;
create view `number of copies of books` as select name, count(isbn) copies from books group by name ;

-- number of books by a genre
drop view if exists `number of books by a genre`;
create view `number of books by a genre` as select g.name, count(distinct b.isbn) number from genres g join books b on g.id=b.genre_id group by g.name ;

-- number of books by a publisher
drop view if exists `number of books by a publisher`;
create view `number of books by a publisher` as select p.name, count(distinct b.isbn) number from publishers p join books b on p.id=b.publisher_id group by p.name ;

-- number of books by year
drop view if exists `number of books by year`;
create view `number of books by year` as select year, count(distinct isbn) number from books group by year ;

-- number of books by an author
drop view if exists `number of books by an author`;
create view `number of books by an author` as select a.name, count(distinct b.isbn) number from authors a join books b on a.id=b.author_id group by a.name ;

-- authors born today
drop view if exists `authors born today`;
create view `authors born today` as select name, dob from authors where dob=cast(now() as date) ;

-- authors' ages
drop view if exists `author ages`;
create view `author ages` as select name, date_format(dob, '%D %M, %Y') dob, date_format(from_days(datediff(now(), dob)), '%Y years %c months %e days') age from authors ;

-- books borrowed currently
drop view if exists `books currently borrowed` ;
create view `books currently borrowed` as select b.id, b.name, r.return_date from books b join rentals r on b.id=r.book_id where r.return_date > cast(now() as date) ;

-- books currently available
drop view if exists `books currently available`;
create view `books currently available` as select b.name, count(distinct b.id) `copies available` from books b where not exists (select 1 from `books currently borrowed` r where r.id=b.id) group by b.name ;	

-- total income so far
create view `total income` as select i.plan_id, sum(p.cost) income from income i join plans p on i.plan_id=p.id group by i.plan_id ;

-- rolling income
create view `rolling income` as with temp as (select i.date, p.cost income from income i join plans p on i.plan_id=p.id) 
select
	*,
	sum(income) over(order by date rows between 89 preceding and current row) rolling_sum,
	sum(income) over(order by date) cumulative_sum,
	avg(income) over(order by date rows between 89 preceding and current row) rolling_avg
from
	temp;

\! echo '\tcreated: views' ;