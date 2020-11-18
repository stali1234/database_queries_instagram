

sales man (salesman_id, name, city, commission)
customer(customer_id, cust_name , city,grade,salesman_id)
orders(ord_no, purchase_amt, ord_date, customer_id)

1> count the customes  with grades above bangalore average
2> find the name and numbers of all salesman who had more than onecustomer
3> list all salesman and indicates those who have and and don't have customers in their cities (use union operation)
4.> create a view that finds the salesman who has the customer with the highest order of day
5> demonstrate the delete operation by removing salesman with id  1000 .all his orders must also be deleted


create table salesman (
    salesman_id int auto_increment primary key,
    name varchar(100),
    city varchar(100),
    commission varchar(100)
     
);

#values 
insert into salesman(salesman_id, name, city, commission)
values
(1000,'johny','banglore','25%'),
(2000,'ravi','banglore','20%'),
(3000,'kumar','mysore','15%'),
(4000,'smith','delhi','30%'),
(5000,'harsha','hydrabad','15%');

#customer(customer_id, cust_name , city,grade,salesman_id)

create table customer(
    customer_id int auto_increment primary key,
    cust_name varchar(100),
    city varchar(100),
    grade int,
    salesman_id int,
    foreign key (salesman_id) references salesman(salesman_id )
    
    )

    # 
    
    insert into customer(customer_id , cust_name, city,grade,salesman_id)
    values(10,'preethi','banglore',100,1000),
     (11, 'vivek','mangalore',300,1000),
     (12,'bhaskar','chennai',400,2000),
     (13,'chethan','banglore',400,2000),
     (14,'mamatha','banglore',400,3000);

 select grade ,count( customer_id)from customer 
 group by grade
 having grade > (select avg(grade) from customer 
 where city = 'banglore'
 );





    orders(ord_no, purchase_amt, ord_date, customer_id)


    create table orderss(
        ord_no int auto_increment primary key,
        purchase_amt int,
        ord_date date,
        customer_id int,
        salesman_id int,
        foreign key (salesman_id)  references  salesman(salesman_id),
        foreign key (customer_id)  references customer(customer_id)
    );


#2008-11-11
insert into orderss( ord_no,purchase_amt,ord_date,customer_id,salesman_id)
values
(50,5000,'2017-05-04',10,1000),
(51,3500,'2017-01-20',10,2000),
(52,1000,'2017-02-24',13,2000),
(53,3500,'2017-04-13',14,3000),
(54,550,'2017-03-17',12,2000);

    #values

    select  name , salesman.salesman_id from salesman  join    customer on salesman.salesman_id = customer.salesman_id count(customer.salesman_id)>1;