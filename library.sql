libraya DATABASE

book(book_id , title, publisher_name , pub_year)
book_authors(book_id, author_name)
puslisher(pub_id, name, address, phone)
book_copies(book_id, branch_id, no_of_copies)
book_lending(book_id, branch_id, card_no, date,_out, due_date)
library_branch (branch_id , branch_name, address)

write the sql queries

1> retrieve details of all books in the library : id, title, name of publisher , authors, number of copies in each branch etc.
2> get the particulars of borrowers who have borrowed more than 3 books from jan 2019
3> delete a book in book table and update the contents of other table  to reflect this data manipulation opertaion
4> partition the book table based on year of publication demonstrate its working with a simple query;
5> create a view of all books and its number of copies that are currently available in the libray

#creation of table 

create table book(book_id int auto_increment primary key,
title varchar(100),
publisher_name varchar(100),
publisher_year varchar(100)
)

create table book_authors(

    book_id int  ,
    author_name varchar(100),
    FOREIGN key (book_id) references book(book_id)
);

create table publisher(
    pub_id int  ,
    name VARCHAR(100),
    address VARCHAR(100),
    phone VARCHAR(100)



);



library_branch (branch_id , branch_name, address)

CREATE TABLE library_branch (

    branch_id int auto_increment PRIMARY key,
    branch_name VARCHAR(100),
    address VARCHAR(100)
);


book_copies(book_id, branch_id, no_of_copies)


CREATE TABLE book_copies(
    book_id int ,
    branch_id int,
    no_of_copies VARCHAR(100),
    FOREIGN KEY (book_id)  references  book(book_id),
    FOREIGN KEY (branch_id)  references   library_branch(branch_id )
);

#insert the values -->book(book_id , title, publisher_name , pub_year)
 
 insert into book(book_id, title ,publisher_name, publisher_year)
 values(1,'dbms', 'mcgraw','jan-2017'),
 (2,'adbms', 'mcgraw','jun-2016'),
 (3,'cn','person','sep-2016'),
 (4,'cg','grupo planeta','sep-2015'),
 (5,'os','pearson','may-2016');

# SELECT pulisher_year from book;
#book_authors(book_id, author_name)

INSERT into book_authors (book_id , author_name)
values(1,'navathe'),
(2,'navathe'),
(3,'tanenbaum'),
(4,'edward angel'),
(5,'galvin');



#puslisher(pub_id, name, address, phone)

insert into publisher(pub_id, name, address , phone)
values(1,'mcgraw','banglore','9989076587'),
(2,'pearson','new-delhi','9538603117'),
(3,'random_house', 'hyderbad','9916452725'),
(4,'hachette livre','chennai','9985674946'),
(5,'grupoplaneta','banglore','93445435234');

#library_branch (branch_id , branch_name, address)


insert into library_branch(branch_id , branch_name, address)
values(10,'rr nagar','banglore'),
(11,'rnsit','banglore'),
(12,'rajaji nagar','banglore'),
(13,'nitti','manglore'),
(14,'manupal','udupi');

#book_copies(book_id, branch_id, no_of_copies)

insert into book_copies(book_id , branch_id , no_of_copies)
values(1,10,12),
(2,11,56),
(3,12,78),
(4,13,34),
(5,14,34);
 

 #book_lending(book_id, branch_id, card_no, date_out, due_date)


create table book_lending(

    book_id int ,
    branch_id int,
    card_no int,
    date_out VARCHAR(100),
    due_date VARCHAR(100)

);


 insert into book_lending(book_id, branch_id, card_no, date_out, due_date)
 values (1,10,101,'1-jan-17','01-jun-17'),
 (2,11,503 , '11-jan-17','11-mar-17'),
 (3,12,675,'21-feb-17','21-apr-17'),
 (4,13,453,'15-mar-17','15-jul-17'),
 (5,14,456,'12-apr-17','12-may-17');


querry 2;
select card_no from book_lending where date_out = '1-jan-17'  GROUP BY card_no  ;

 select  * from book
 join book_authors
 on book.book_id = book_authors.book_id; 

 #
 DELETE from book where book_id = 3;


 CREATE VIEW v_books as 

 SELECT b.book_id , b.title , c.no_of_copies from book b, book_copies c, library_branch l
 where b.book_id = c.book_id
 and c.branch_id = l.branch_id;


 select  name , salesman.salesman_id from salesman  join    customer on salesman.salesman_id = customer.salesman_id ;


 