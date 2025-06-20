-- Online Book Store Data Analysis using SQL
-- Solutions of 15 business problems

--1. List all customers from the Canada 

    select name 
    from customers
    where country ='Canada'; 

--2. Find the book with the Lowest Stock 

   select title 
   from books
   where stock=(select min(stock) from books) limit 1;

--3. Calculate the total revenue generated from all orders

  select sum(total_amount) as total_Revenue from  orders ;

--4. Retrieve all orders where the total amount exceeds $20

  select order_id
  from orders
  where total_amount > 20;

--5. Show all customers who ordered more than 1 quantity of a book

  select name ,count(name) as Books 
  from customers 
  join orders on orders.customer_id= customers.customer_id 
  group by name  having count(name)>1;

--6. Show orders placed in November 2023

  select order_id
  from  orders 
  where order_date between '2023-11-01' and '2023-11-30';

--7. Retrieve the total number of books sold for each genre

  select genre,  sum(quantity) as no_of_books
  from  books 
  join orders on orders.book_id=books.book_id
  group by genre ;

--8. Find the average price of books in the "Fantasy" genre

  select round(avg(price),2) as average_price
  from books
  where genre ='Fantasy';

--9. List customers who have placed at least 2 orders

  select name ,count(*) as orders
  from customers 
  join orders on orders.customer_id=customers.customer_id
  group by name having count (*) >= 2
  order by count(*)desc;
 
--10.Find the most frequently ordered book

  select  title,books.book_id  ,count(*) as ordered 
  from books
  join orders on books.book_id=orders.book_id 
  group by books.book_id,title
  order by count(*) desc limit 1;

--11.Show the top 3 most expensive books of "Fantasy" genre

  select book_id ,title, price 
  from books
  where genre='Fantasy' 
  order by price desc limit 3;

--12.Retrieve the total quantity of books sold by each author 

  select author ,sum(quantity) as book_sold
  from books
  join orders on orders.book_id=books.book_id 
  group by author 
  order by  book_sold desc ;

--13.List the cities where Customers who spend over $30 are located

  select city ,sum(total_amount) as spent 
  from customers
  join orders on orders.customer_id=customers.customer_id 
  group by city having sum(total_amount) >30 ;

--14.Find the customer who spend the most on orders

  select name ,sum(total_amount) as spent 
  from customers  
  join orders on orders.customer_id=customers.customer_id
  group by name   
  order by sum(total_amount) desc limit 1;

--15.Calculate the stock remaining after fulfilling all orders

  select books.book_id,title,stock,sum(quantity) as sold ,stock - sum(quantity) as remaining_stock
  from books
  join orders on orders.book_id=books.book_id 
  group by books.book_id 
  order by books.book_id;
