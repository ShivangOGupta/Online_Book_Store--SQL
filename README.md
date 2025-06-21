#        ONLINE BOOK STORE Data Analysis using SQL
  ![logo](https://github.com/user-attachments/assets/b0a5d67b-9275-4b43-a364-8953fc571943)

## Overview
  This project involves a comprehensive analysis of ONLINE BOOK STORE using SQL. The goal is to extract valuable insights and answer various business questions based on the dataset. The following README provides a     detailed account of the project's objectives, business problems, solutions, findings, and conclusions.

## Objectives


## Dataset
![Screenshot (104)](https://github.com/user-attachments/assets/7e7342c0-2af8-412c-aa10-acefc657da42)

## Schemas
```sql
Drop Table if exists customers;
Create table customers (
  customer_id int primary key,
  name varchar(100),
  email varchar(100),
  phone varchar(50),
  city varchar(150),
  country varchar(150)
);
```
```sql
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
```
```sql
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
  ```


