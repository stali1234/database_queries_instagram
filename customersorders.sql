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