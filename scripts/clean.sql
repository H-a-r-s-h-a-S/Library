use library ;

-- clean the data

-- data integrity
delete from authors a where not exists (select 1 from books b where a.id=b.author_id) ;
delete from genres g where not exists (select 1 from books b where g.id=b.genre_id) ;
delete from publishers p where not exists (select 1 from books b where p.id=b.publisher_id) ;
delete from languages l where not exists (select 1 from books b where l.id=b.language_id) ;

-- delete records with wrong isbn
delete from donations where not regexp_like(isbn,'^[0-9]{9}X$') and not regexp_like(isbn,'^[0-9]{13}$');
delete from books where not regexp_like(isbn,'^[0-9]{9}X$') and not regexp_like(isbn,'^[0-9]{13}$');

delete from donations where lower(validate_isbn(isbn))='false' ;
delete from books where lower(validate_isbn(isbn))='false' ;

-- delete impossible rentals
delete from rentals where id in (select id from (select r.id from rentals r join rentals r2 on r.id <> r2.id and r.book_id=r2.book_id and r2.rental_date between r.rental_date and r.return_date) y )  ;

-- return after membership end
delete r from rentals r join membership_history m on r.customer_id=m.customer_id where r.return_date > m.end_date ;

-- delete rentals before membership
delete r from rentals r join membership_history m on r.customer_id=m.customer_id where r.rental_date < m.start_date;

-- display clean database size
select concat(table_schema, ': ', round(sum(data_length+index_length)/1024/1024,4), ' MegaBytes') as 'database size:' from information_schema.tables where table_schema='library' group by table_schema ;