use library ;

-- Convert book names, author names, publisher names, genres, language, customer name to Title case
-- commented as this is handled in "real data.sql"
-- uncomment and execute before inserting new records via query

-- DROP TRIGGER IF EXISTS authors_BEFORE_INSERT ;
-- DELIMITER ;;
-- CREATE DEFINER=`root`@`localhost` TRIGGER `authors_BEFORE_INSERT` BEFORE INSERT ON `authors` FOR EACH ROW BEGIN
-- set new.name=title_case(new.name) ;
-- END ;;
-- DELIMITER ;

-- DROP TRIGGER IF EXISTS books_BEFORE_INSERT ;
-- DELIMITER ;;
-- CREATE DEFINER=`root`@`localhost` TRIGGER `books_BEFORE_INSERT` BEFORE INSERT ON `books` FOR EACH ROW BEGIN
-- set new.name=title_case(new.name) ;
-- END ;;
-- DELIMITER ;

-- DROP TRIGGER IF EXISTS publishers_BEFORE_INSERT ;
-- DELIMITER ;;
-- CREATE DEFINER=`root`@`localhost` TRIGGER `publishers_BEFORE_INSERT` BEFORE INSERT ON `publishers` FOR EACH ROW BEGIN
-- set new.name=title_case(new.name) ;
-- END ;;
-- DELIMITER ;

-- DROP TRIGGER IF EXISTS genres_BEFORE_INSERT ;
-- DELIMITER ;;
-- CREATE DEFINER=`root`@`localhost` TRIGGER `genres_BEFORE_INSERT` BEFORE INSERT ON `genres` FOR EACH ROW BEGIN
-- set new.name=title_case(new.name) ;
-- END ;;
-- DELIMITER ;

-- DROP TRIGGER IF EXISTS languages_BEFORE_INSERT ;
-- DELIMITER ;;
-- CREATE DEFINER=`root`@`localhost` TRIGGER `languages_BEFORE_INSERT` BEFORE INSERT ON `languages` FOR EACH ROW BEGIN
-- set new.name=title_case(new.name) ;
-- END ;;
-- DELIMITER ;

-- DROP TRIGGER IF EXISTS customers_BEFORE_INSERT ;
-- DELIMITER ;;
-- CREATE DEFINER=`root`@`localhost` TRIGGER `customers_BEFORE_INSERT` BEFORE INSERT ON `customers` FOR EACH ROW BEGIN
-- set new.name=title_case(new.name) ;
-- END ;;
-- DELIMITER ;