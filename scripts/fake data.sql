use library ;

set global local_infile = 1 ;
set foreign_key_checks = 0;

-- fake data for donations
LOAD DATA LOCAL INFILE './../data/donations.csv'
	INTO TABLE donations
	FIELDS TERMINATED BY ',' ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES
	(@donor_name, @isbn)
	set donor_name = ltrim(rtrim(@donor_name)),
		isbn = ltrim(rtrim(replace(replace(@isbn,'-',''),' ',''))) ;

\! echo '\t\t\tloaded: donations' ;

-- fake data for customers
LOAD DATA LOCAL INFILE './../data/customers.csv'
	INTO TABLE customers
	FIELDS TERMINATED BY ',' ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES
	(@name, @phone, @email, @plan_id)
	set name = ltrim(rtrim(@name)),
		phone = ltrim(rtrim(replace(replace(@phone, '-',''), 'x', ''))),
		email = ltrim(rtrim(replace(@email, 'example', 'gmail'))),
		plan_id = @plan_id ;

\! echo '\t\t\tloaded: customers' ;

-- fake data for locations
-- number of locations should always be greater than the number of books available
LOAD DATA LOCAL INFILE './../data/locations.csv'
	INTO TABLE locations
	FIELDS TERMINATED BY ',' ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES
	(@rack_no, @shelf_no, @row_no)
	set rack_no = @rack_no,
		shelf_no = @shelf_no,
		row_no = @row_no ;

\! echo '\t\t\tloaded: locations' ;

-- fake data for rentals
LOAD DATA LOCAL INFILE './../data/rentals.csv'
	INTO TABLE rentals
	FIELDS TERMINATED BY ',' ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES
	(@book_id, @customer_id, @rental_date, @return_date)
	set book_id = @book_id,
		customer_id = @customer_id,
		rental_date = @rental_date,
		return_date = @return_date ;

\! echo '\t\t\tloaded: rentals' ;

-- fake data for income
-- number of income = number of customers with membership
insert into income (customer_id, plan_id, date) 
	select
		distinct c.id, c.plan_id, min(r.rental_date) date 
	from
		customers c 
	join
		rentals r
			on
		c.id = r.customer_id 
	group by
		c.id, c.plan_id ;

\! echo '\t\t\tloaded: income' ;

-- fake data for membership_history
insert into membership_history (customer_id, plan_id, start_date, end_date)
select i.customer_id, i.plan_id, i.date, date_add(i.date, interval p.validity day) end_date from income i join plans p on i.plan_id=p.id ;

\! echo '\t\t\tloaded: membership_history' ;

-- link locations with books
call allot_books() ;

\! echo '\t\t\tallocated: books - locations' ;

set foreign_key_checks = 1;