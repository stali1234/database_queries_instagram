create table customers
(

    id int
    AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR
    (100),
    last_name VARCHAR
    (100),
    email VARCHAR
    (100)
);

    create table orders
    (

        id int
        AUTO_INCREMENT PRIMARY KEY,
    order_data DATE,
    amount DECIMAL
        (8,2),
    customer_id int


);

-- Select rows from' in schema 'SchemaName'
SELECT 
WHERE 	/* add search conditions here */
GO

select first_name , last_name ,ifnull(sum(amount),0) as total_spent
from customers 
left join orders
    on customers.id = orders.customer_id
    GROUP BY customers.id
    ORDER BY total_spent


  select   series.id , title , avg(rating) as av from series join reviews on series.id = reviews.series_id
  GROUP BY series.id order by av ;


  SELECT first_name , last_name , rating from reviewers join reviews on 
  reviewers.id = reviews.reviewer_id;