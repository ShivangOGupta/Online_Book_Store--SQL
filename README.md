#      <p align="center">  ONLINE BOOK STORE Data Analysis using SQL </p>
  <p align="center"> <img  width="400" height="400" src="https://github.com/user-attachments/assets/b0a5d67b-9275-4b43-a364-8953fc571943"/> </p>

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
## Business Problems and Solutions

### 1. List all customers from the Canada 
```sql
    select name 
    from customers
    where country ='Canada'; 
```
### 2. Find the book with the Lowest Stock 
```sql
   select title 
   from books
   where stock=(select min(stock) from books) limit 1;
```
### 3. Calculate the total revenue generated from all orders
```sql
  select sum(total_amount) as total_Revenue from  orders ;
```
### 4. Retrieve all orders where the total amount exceeds $20
```sql
  select order_id
  from orders
  where total_amount > 20;
```
### 5. Show all customers who ordered more than 1 quantity of a book
```sql
  select name ,count(name) as Books 
  from customers 
  join orders on orders.customer_id= customers.customer_id 
  group by name  having count(name)>1;
```
### 6. Show orders placed in November 2023
```sql
  select order_id
  from  orders 
  where order_date between '2023-11-01' and '2023-11-30';
```
### 7. Retrieve the total number of books sold for each genre
```sql
  select genre,  sum(quantity) as no_of_books
  from  books 
  join orders on orders.book_id=books.book_id
  group by genre ;
```
### 8. Find the average price of books in the "Fantasy" genre
```sql
  select round(avg(price),2) as average_price
  from books
  where genre ='Fantasy';
```
### 9. List customers who have placed at least 2 orders
```sql
  select name ,count(*) as orders
  from customers 
  join orders on orders.customer_id=customers.customer_id
  group by name having count (*) >= 2
  order by count(*)desc;
 ```
 ### 10.Find the most frequently ordered book
```sql
  select  title,books.book_id  ,count(*) as ordered 
  from books
  join orders on books.book_id=orders.book_id 
  group by books.book_id,title
  order by count(*) desc limit 1;
```
### 11.Show the top 3 most expensive books of "Fantasy" genre
```sql
  select book_id ,title, price 
  from books
  where genre='Fantasy' 
  order by price desc limit 3;
```
### 12.Retrieve the total quantity of books sold by each author 
```sql
  select author ,sum(quantity) as book_sold
  from books
  join orders on orders.book_id=books.book_id 
  group by author 
  order by  book_sold desc ;
```
### 13.List the cities where Customers who spend over $30 are located
```sql
  select city ,sum(total_amount) as spent 
  from customers
  join orders on orders.customer_id=customers.customer_id 
  group by city having sum(total_amount) >30 ;
```
### 14.Find the customer who spend the most on orders
```sql
  select name ,sum(total_amount) as spent 
  from customers  
  join orders on orders.customer_id=customers.customer_id
  group by name   
  order by sum(total_amount) desc limit 1;
```
### 15.Calculate the stock remaining after fulfilling all orders
```sql
  select books.book_id,title,stock,sum(quantity) as sold ,stock - sum(quantity) as remaining_stock
  from books
  join orders on orders.book_id=books.book_id 
  group by books.book_id 
  order by books.book_id;
```
## Findings and Conclusion

