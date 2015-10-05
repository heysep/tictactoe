# Normal Mode - No Joins Required!

- How many users are there?
50

- What are the 5 most expensive items?
Small Cotton Gloves
Small Wooden Computer
Awesome Granite Pants
Sleek Wooden Hat
Ergonomic Steel Car

- What's the cheapest book? (Does that change for "category is exactly 'book'" versus "category contains 'book'"?) 
Using exactly "book" returns nothing as the term used is "books". Using LIKE "%book%" returns Ergonomic Granite Chair as the cheapest book.

- Who lives at "6439 Zetta Hills, Willmouth, WY"? Do they have another address?
Corrine Little, her other address is: 54369 Wolff Forges, Lake Bryon, CA

- Correct Virginie Mitchell's address to "New York, NY, 10108".

- How many total items did we sell?
2,125

- Simulate buying an item by inserting a User for yourself and an Order for that User.
USER: 51|Sepehr|Vakili|sdvakili@gmail.com
ORDER: 378|51|15|5|2015-10-05

# Hard Mode - Joins, Summation, More Advanced Queries

- How much would it cost to buy one of each tool?
$467,488

- What item was ordered most often? Grossed the most money?
Most often: 
SELECT sum(orders.quantity) AS "sum", orders.item_id, items.title 
FROM orders INNER JOIN items ON orders.item_id=items.id 
GROUP BY orders.item_id ORDER BY sum DESC LIMIT 1;    

returns: 72|65|Incredible Granite Car

SELECT (orders.quantity * items.price) AS "gross", items.title, items.id 
FROM orders INNER JOIN items ON orders.item_id=items.id 
GROUP BY orders.item_id ORDER BY gross DESC LIMIT 5;  

returns: 90000|Incredible Steel Gloves|58

- What user spent the most?

SELECT SUM(orders.quantity*items.price) AS "total", orders.user_id 
FROM orders INNER JOIN items ON orders.item_id=items.id 
GROUP BY orders.user_id ORDER BY total DESC LIMIT 5;

returns: 639386|19
then looking up user ID 19: Hassan|Runte

- What were the top 3 highest grossing categories?

SELECT SUM(orders.quantity*items.price) AS "gross", items.category 
FROM orders INNER JOIN items ON orders.item_id=items.id 
GROUP BY items.category ORDER BY gross DESC LIMIT 3;

525240|Music, Sports & Clothing
449496|Beauty, Toys & Sports
448410|Sports

- How much was spent on books?

SELECT SUM(orders.quantity*items.price) AS "total" FROM orders 
INNER JOIN items ON orders.item_id=items.id 
WHERE items.category LIKE "%book%";
$1,081,352









