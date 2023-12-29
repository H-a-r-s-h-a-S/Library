use library ;

with test as (
select 1 as test_id, 'null author name' as `check`, 'authors' as `table`, id from authors where name is null or name=''

union all

select 2, 'null book name', 'books', id from books where name is null or name=''

union all

select 3, 'null genre name', 'genres', id from genres where name is null or name=''
 
union all

select 4, 'null publisher name', 'publishers', id from publishers where name is null or name='' 

union all

select 5, 'duplicate record', 'authors',id from authors group by id having count(distinct name) > 1

union all

select 6, 'duplicate record', 'genres',id from genres group by id having count(distinct name) > 1

union all

select 7, 'duplicate record', 'publishers',id from publishers group by id having count(distinct name) > 1

union all

select 8, 'duplicate record', 'languages',id from languages group by id having count(distinct name) > 1

union all

select 9, 'duplicate record', 'locations', id from locations group by id having count(book_id) > 1

union all

select 10, 'duplicate record', 'rentals', customer_id from rentals group by customer_id, rental_date, return_date having count(*) > 1

union all

select 11, 'duplicate record', 'rentals', book_id from rentals group by rental_date, return_date, book_id having count(distinct customer_id) > 1

union all

select 12, 'invalid isbn', 'donations', id from donations where lower(validate_isbn(isbn))='false'

union all

select 13, 'invalid isbn', 'books', id from books where lower(validate_isbn(isbn))='false'

union all

select 14, 'duplicate rentals', 'rentals', r.id from rentals r join rentals r2 on r.id <> r2.id and r.book_id=r2.book_id and r2.rental_date = r.rental_date and r2.return_date = r.return_date

union all

select 15, 'impossible rental', 'rental', r.id from rentals r join rentals r2 on r.id <> r2.id and r.book_id=r2.book_id and r2.rental_date between r.rental_date and r.return_date

union all

select 16, 'rental before membership', 'rentals', r.id from rentals r join membership_history m on r.customer_id=m.customer_id where r.rental_date < m.start_date 

union all

select 17, 'return after membership end', 'rentals', r.id from rentals r join membership_history m on r.customer_id=m.customer_id where r.return_date > m.end_date 
)

select concat('There are ', count(*), ' failures') as `message:` from test;
