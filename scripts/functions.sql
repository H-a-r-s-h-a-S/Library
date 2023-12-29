use library ;
-- given a ISBN (only 10 digits or 13 digits), validate if it is a valid ISBN and return TRUE or FALSE


-- Title case
DROP FUNCTION IF EXISTS title_case;
SET GLOBAL  log_bin_trust_function_creators=TRUE;
DELIMITER |
CREATE FUNCTION title_case( str VARCHAR(128) )
RETURNS VARCHAR(128)
BEGIN
DECLARE c CHAR(1);
DECLARE s VARCHAR(128);
DECLARE i INT DEFAULT 1;
DECLARE bool INT DEFAULT 1;
DECLARE punct CHAR(17) DEFAULT ' ()[]{},.-_!@;:?/';
SET s = LCASE( str );
WHILE i <= LENGTH( str ) DO   
    BEGIN
SET c = SUBSTRING( s, i, 1 );
IF LOCATE( c, punct ) > 0 THEN
SET bool = 1;
ELSEIF bool=1 THEN
BEGIN
IF c >= 'a' AND c <= 'z' THEN
BEGIN
SET s = CONCAT(LEFT(s,i-1),UCASE(c),SUBSTRING(s,i+1));
SET bool = 0;
END;
ELSEIF c >= '0' AND c <= '9' THEN
SET bool = 0;
END IF;
END;
END IF;
SET i = i+1;
END;
END WHILE;
RETURN s;
END;
|
DELIMITER ;

\! echo '\t\tcreated: title_case' ;

-- checksum validation
DROP FUNCTION IF EXISTS validate_isbn ;
DELIMITER |
CREATE FUNCTION `validate_isbn` (isbn varchar(13))
RETURNS varchar(5)
deterministic
BEGIN
RETURN (select case when length(isbn)=10 and 
11 - mod (substring(isbn,1,1) * 10 +
substring(isbn,2,1) * 9 +
substring(isbn,3,1) * 8 +
substring(isbn,4,1) * 7 +
substring(isbn,5,1) * 6 +
substring(isbn,6,1) * 5 +
substring(isbn,7,1) * 4 +
substring(isbn,8,1) * 3 +
substring(isbn,9,1) * 2, 11) = case when substring(isbn,10,1)='X' then 10 else substring(isbn,10,1) end
then 'true'
when length(isbn)=13 and 
10 - mod (substring(isbn,1,1) * 1 +
substring(isbn,2,1) * 3 +
substring(isbn,3,1) * 1 +
substring(isbn,4,1) * 3 +
substring(isbn,5,1) * 1 +
substring(isbn,6,1) * 3 +
substring(isbn,7,1) * 1 +
substring(isbn,8,1) * 3 +
substring(isbn,9,1) * 1 +
substring(isbn,10,1) * 3 +
substring(isbn,11,1) * 1 +
substring(isbn,12,1) * 3, 10) = substring(isbn,13,1)
then 'true'
else 'false'
end);
END;
|
DELIMITER ;

\! echo '\t\tcreated: validate_isbn' ;