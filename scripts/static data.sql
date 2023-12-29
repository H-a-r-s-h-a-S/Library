use library ;

-- static data for plans

-- mysql> describe plans;
-- +----------+------------------------------+------+-----+---------+----------------+
-- | Field    | Type                         | Null | Key | Default | Extra          |
-- +----------+------------------------------+------+-----+---------+----------------+
-- | id       | int                          | NO   | MUL | NULL    | auto_increment |
-- | days     | tinyint(2) unsigned zerofill | YES  |     | NULL    |                |
-- | books    | tinyint(1)                   | YES  |     | NULL    |                |
-- | cost     | decimal(10,2)                | YES  |     | NULL    |                |
-- | validity | varchar(10)                  | YES  |     | NULL    |                |
-- +----------+------------------------------+------+-----+---------+----------------+
-- 5 rows in set (0.01 sec)

set foreign_key_checks = 0 ;
TRUNCATE TABLE plans ;

insert into plans (days, books, cost, validity) 
values 
	(15, 1, 100, '90'), 
	(15, 2, 200, '90'), 
	(15, 3, 300, '90'),
	(15, 4, 400, '90'),
	(15, 1, 350, '365'),
	(15, 2, 700, '365'),
	(15, 3, 1050, '365'),
	(15, 4, 1400, '365') ;

set foreign_key_checks = 1;

\! echo '\t\tloaded: plans' ;
