-- SCHEMAS OF ONLINE BOOK STORE

Drop Table if exists customers;
Create table customers (
  customer_id int primary key,
  name varchar(100),
  email varchar(100),
  phone varchar(50),
  city varchar(150),
  country varchar(150)
);

Drop table if exists books;
create table books(
  book_id int primary key,
  title varchar(100),
  author varchar(100),
  genre varchar(50),
  published_year int ,
  price decimal(8,2),
  stock int
);

drop table if exists orders;
create table orders(
  order_id int primary key,
  customer_id int ,
  book_id int ,
  order_date date,
  quantity int ,
  total_amount decimal(8,2),
  foreign key (customer_id) references customers(customer_id),
  foreign key (book_id) references books(book_id)
    
);
