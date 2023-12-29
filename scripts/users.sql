-- two users:
	-- user: Librarian - has access to everything
	-- user: Customer - has access to below:
		-- Plans
		-- Locations
		-- Languages
		-- Authors
		-- Books
		-- Genres
		-- Publishers
		-- Certain Views

-- create librarian and give all access
drop user if exists 'librarian'@'localhost' ;
create user 'librarian'@'localhost' identified by 'password' ;

-- grant access to tables
grant all privileges on library.authors to 'librarian'@'localhost' ;
grant all privileges on library.books to 'librarian'@'localhost' ;
grant all privileges on library.customers to 'librarian'@'localhost' ;
grant all privileges on library.donations to 'librarian'@'localhost' ;
grant all privileges on library.genres to 'librarian'@'localhost' ;
grant all privileges on library.income to 'librarian'@'localhost' ;
grant all privileges on library.languages to 'librarian'@'localhost' ;
grant all privileges on library.locations to 'librarian'@'localhost' ;
grant all privileges on library.membership_history to 'librarian'@'localhost' ;
grant all privileges on library.plans to 'librarian'@'localhost' ;
grant all privileges on library.publishers to 'librarian'@'localhost' ;
grant all privileges on library.rentals to 'librarian'@'localhost' ;

-- grant access to views
grant select on library.`author ages` to 'librarian'@'localhost';
grant select on library.`authors born today` to 'librarian'@'localhost';
grant select on library.`books currently available` to 'librarian'@'localhost';
grant select on library.`books currently borrowed` to 'librarian'@'localhost';
grant select on library.`categorized books` to 'librarian'@'localhost';
grant select on library.`number of books by a genre` to 'librarian'@'localhost';
grant select on library.`number of books by a publisher` to 'librarian'@'localhost';
grant select on library.`number of books by an author` to 'librarian'@'localhost';
grant select on library.`number of books by year` to 'librarian'@'localhost';
grant select on library.`number of copies of books` to 'librarian'@'localhost';
grant select on library.`rolling income` to 'librarian'@'localhost';
grant select on library.`total income` to 'librarian'@'localhost';

\! echo '\tcreated: librarian' ;

-- create customer
drop user if exists 'customer'@'localhost' ;
create user 'customer'@'localhost' identified by 'abcd1234' ;

-- grant select access to tables
grant select on library.plans to 'customer'@'localhost' ;
grant select on library.locations to 'customer'@'localhost' ;
grant select on library.languages to 'customer'@'localhost' ;
grant select on library.authors to 'customer'@'localhost' ;
grant select on library.books to 'customer'@'localhost' ;
grant select on library.genres to 'customer'@'localhost' ;
grant select on library.publishers to 'customer'@'localhost' ;

-- grant select access to views
grant select on library.`author ages` to 'customer'@'localhost';
grant select on library.`authors born today` to 'customer'@'localhost';
grant select on library.`books currently available` to 'customer'@'localhost';
grant select on library.`books currently borrowed` to 'customer'@'localhost';
grant select on library.`categorized books` to 'customer'@'localhost';
grant select on library.`number of books by a genre` to 'customer'@'localhost';
grant select on library.`number of books by a publisher` to 'customer'@'localhost';
grant select on library.`number of books by an author` to 'customer'@'localhost';
grant select on library.`number of books by year` to 'customer'@'localhost';
grant select on library.`number of copies of books` to 'customer'@'localhost';

\! echo '\tcreated: customer' ;

flush privileges ;
