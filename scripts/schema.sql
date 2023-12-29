drop schema if exists `library` ;

create schema `library` ;

use `library` ;

-- ------------
-- data staging
-- ------------
create table if not exists `data_staging` (
	`author` varchar(100),
	`dob` date,
	`book` varchar(100),
	`isbn` varchar(13),
	`pages` int,
	`year` int,
	`publisher` varchar(100), 
	`genre` varchar(100),
	`language` varchar(100)
)
ENGINE = InnoDB
DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ;

\! echo '\tcreated: staging' ;

-- ----------
-- donations
-- ----------
create table if not exists `donations` (
	`donor_name` varchar(100),
	`isbn` varchar(13),
	`id` int AUTO_INCREMENT,
	primary key (`id`)
)
ENGINE = InnoDB
DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ;

\! echo '\tcreated: donations' ;

-- --------
-- authors
-- --------
create table if not exists `authors` (
	`id` int AUTO_INCREMENT,
	`name` varchar(100),
	`dob` date DEFAULT NULL,
	CONSTRAINT UC_AUTHORS_ID UNIQUE (`id`, `name`, `dob`)
)
ENGINE = InnoDB
DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ;

\! echo '\tcreated: authors' ;

-- -----
-- plans
-- -----
create table if not exists `plans` (
	`id` int AUTO_INCREMENT,
	`days` tinyint(2) zerofill,
	`books` tinyint(1),
	`cost` decimal(10,2),
	`validity` varchar(10),
	CONSTRAINT UC_PLANS_ID UNIQUE (`id`, `cost`, `validity`, `days`, `books`)
)
ENGINE = InnoDB
DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ;

\! echo '\tcreated: plans' ;

-- ----------
-- customers
-- ----------
create table if not exists `customers` (
	`id` int AUTO_INCREMENT,
	`name` varchar(100),
	`phone` varchar(30),
	`email` varchar(50),
	`plan_id` int,
	CONSTRAINT UC_CUSTOMERS_ID UNIQUE (`id`, `name`, `phone`, `email`),
	foreign key (`plan_id`) references `plans`(`id`)
		on update cascade
		on delete cascade
)
ENGINE = InnoDB
DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ;

\! echo '\tcreated: customers' ;

-- -------
-- income 
-- -------
create table if not exists `income` (
	`date` date,
	`customer_id` int,
	`plan_id` int,
	foreign key (`customer_id`) references `customers`(`id`)
		on update cascade
		on delete cascade,
	foreign key(`plan_id`) references `plans`(`id`)
		on update cascade
		on delete cascade
) 
ENGINE = InnoDB
DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ;

\! echo '\tcreated: income' ;

-- -------------------
-- membership history
-- -------------------
create table if not exists `membership_history` (
	`customer_id` int,
	`plan_id` int,
	`start_date` date,
	`end_date` date,
	foreign key (`customer_id`) references `customers`(`id`)
		on update cascade
		on delete cascade,
	foreign key (`plan_id`) references `plans`(`id`)
		on update cascade
		on delete cascade
)
ENGINE = InnoDB
DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ;

\! echo '\tcreated: membership history' ;

-- ----------
-- publishers
-- ----------
create table if not exists `publishers` (
	`id` int AUTO_INCREMENT,
	`name` varchar(100),
	CONSTRAINT UC_PUBLISHERS_ID UNIQUE(`id`, `name`)
)
ENGINE = InnoDB
DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ;

\! echo '\tcreated: publishers' ;

-- ------
-- genres
-- ------
create table if not exists `genres` (
	`id` int AUTO_INCREMENT,
	`name` varchar(100),
	CONSTRAINT UC_GENRES_ID UNIQUE(`id`, `name`)
)
ENGINE = InnoDB
DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ;

\! echo '\tcreated: genres' ;

-- ---------
-- languages
-- ---------
create table if not exists `languages` (
	`id` int AUTO_INCREMENT,
	`name` varchar(100),
	CONSTRAINT UC_LANGUAGES_ID UNIQUE(`id`, `name`)
)
ENGINE = InnoDB
DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ;

\! echo '\tcreated: languages' ;

-- -----
-- books
-- -----
create table if not exists `books` (
	`name` varchar(100),
	`isbn` varchar(13),
	`author_id` int,
	`genre_id` int,
	`pages` int,
	`year` int,
	`location_id` int,
	`publisher_id` int,
	`language_id` int,
	`id` int AUTO_INCREMENT,
	primary key (`id`),
	foreign key (`author_id`) references `authors`(`id`)
		on delete set null
		on update cascade,
	foreign key (`publisher_id`) references `publishers`(`id`)
		on delete set null
		on update cascade,
	foreign key (`genre_id`) references `genres`(`id`)
		on delete set null
		on update cascade,
	foreign key (`language_id`) references `languages`(`id`)
		on delete set null
		on update cascade
)
ENGINE = InnoDB
DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ;

\! echo '\tcreated: books' ;

-- ----------
-- locations
-- ----------
create table if not exists `locations` (
	`id` int AUTO_INCREMENT,
	`rack_no` tinyint(2) zerofill,
	`shelf_no` tinyint(2) zerofill,
	`row_no` tinyint(2) zerofill,
	`book_id` int,
	CONSTRAINT UC_LOCATIONS_ID UNIQUE (`id`, `rack_no`, `shelf_no`, `row_no`),
	foreign key (`book_id`) references `books`(`id`)
		on delete cascade
		on update cascade
)
ENGINE = InnoDB
DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ;

\! echo '\tcreated: locations' ;

-- -------
-- rentals
-- -------
create table if not exists `rentals` (
	`book_id` int,
	`customer_id` int,
	`rental_date` date,
	`return_date` date,
	`id` int AUTO_INCREMENT,
	CONSTRAINT UC_RENTALS_ID UNIQUE (`id`),
	foreign key (`book_id`) references `books`(`id`)
		on update cascade
		on delete cascade,
	foreign key (`customer_id`) references `customers`(`id`)
		on update cascade
		on delete cascade
)
ENGINE = InnoDB
DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ;

\! echo '\tcreated: rentals' ;
