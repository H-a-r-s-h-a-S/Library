use library ;

set global local_infile = 1 ;

-- truncate staging table
truncate table data_staging ;

-- clean and load data to staging table
LOAD DATA LOCAL INFILE './../data/data.csv'
  INTO TABLE data_staging
  FIELDS TERMINATED BY ',' ENCLOSED BY '"'
  LINES TERMINATED BY '\n'
  IGNORE 1 LINES 
  (@author, @dob, @book, @isbn, @pages, @year, @publisher, @genre, @language)
  set author=title_case(ltrim(rtrim(@author))),
      dob = str_to_date(ltrim(rtrim(@dob)), '%Y-%m-%d'),
      book = title_case(ltrim(rtrim(@book))),
      isbn=replace(replace(@isbn,'-',''),' ',''),
      pages = ltrim(rtrim(@pages)),
      year = ltrim(rtrim(@year)),
      publisher = title_case(ltrim(rtrim(@publisher))),
      genre = title_case(ltrim(rtrim(@genre))), 
      language = title_case(ltrim(rtrim(@language))) ;

\! echo '\t\tloaded: data_staging' ;

-- make copies in data_staging
call `create_book_copy`(5) ;

\! echo '\t\tcopies: 5' ;

-- populate the publishers table
insert into publishers (name) 
select distinct publisher 
from data_staging d
where publisher is not null and 
      publisher <> '' and
      not exists (select 1 from publishers p where p.name=d.publisher);

\! echo '\t\tloaded: publishers' ;

-- populate genres table
insert into genres (name) 
select distinct genre 
from data_staging d
where genre is not null and
      genre <> '' and
      not exists (select 1 from genres g where g.name=d.genre);

\! echo '\t\tloaded: genres' ;

-- populate languages table
insert into languages (name)
select distinct language 
from data_staging d
where language is not null and 
      language <> '' and
      not exists (select 1 from languages l where l.name=d.language) ;

\! echo '\t\tloaded: languages' ;

-- populate authors table
insert into authors (name, dob) 
select distinct author, dob 
from data_staging d
where author is not null and 
      dob is not null and
      author <> '' and
      cast(dob as char) <> '' and
      not exists (select 1 from authors a where a.name=d.author and a.dob=d.dob);

\! echo '\t\tloaded: authors' ;

-- populate books table
insert into books (name, isbn, pages, year) 
select book, isbn, pages, year
from data_staging d
where book is not null and 
      isbn is not null and 
      pages is not null and 
      year is not null and 
      book <> '' and
      isbn <> '' and
      pages <> '' and
      year <> '' ;

\! echo '\t\tloaded: books' ;

-- update foreign keys for books
update books b 
join data_staging d on b.isbn=d.isbn
join authors a on a.name=d.author and a.dob=d.dob
join publishers p on p.name=d.publisher 
join genres g on g.name=d.genre 
join languages l on l.name=d.language
set b.author_id=a.id, 
    b.genre_id=g.id, 
    b.publisher_id=p.id,
    b.language_id=l.id ;

\! echo '\t\tlinked: foreign keys' ;

-- truncate staging table
truncate table data_staging;

\! echo '\t\ttruncated: data_staging' ;