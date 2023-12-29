use library ;

set foreign_key_checks = 0;

truncate table authors;
truncate table books;
truncate table customers;
truncate table data_staging;
truncate table donations;
truncate table genres;
truncate table income;
truncate table languages;
truncate table locations;
truncate table membership_history;
truncate table plans;
truncate table publishers;
truncate table rentals;

set foreign_key_checks = 1;

\! echo 'ALL TABLES HAVE BEEN TRUNCATED' ;