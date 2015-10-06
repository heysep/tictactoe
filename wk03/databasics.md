# Normal Mode - No Joins Required!

- How many users are there?
  - SELECT COUNT(id) FROM users;
  - 50

- What are the 5 most expensive items?
  - SELECT title FROM items ORDER BY price DESC LIMIT 5;
  - Small Cotton Gloves
  - Small Wooden Computer
  - Awesome Granite Pants
  - Sleek Wooden Hat
  - Ergonomic Steel Car

- What's the cheapest book? (Does that change for "category is exactly 'book'" versus "category contains 'book'"?) 
  - SELECT title FROM items WHERE category LIKE "%book%" ORDER BY price ASC LIMIT 1;
  - SELECT title FROM items WHERE category="book" ORDER BY price ASC LIMIT 1;
  - Using exactly "book" returns nothing as the term used is "books". Using LIKE "%book%" returns Ergonomic Granite Chair as the cheapest book.

- Who lives at "6439 Zetta Hills, Willmouth, WY"? Do they have another address?
  - SELECT users.first_name, users.last_name, users.id 
  - FROM users INNER JOIN addresses
  - ON users.id=addresses.user_id WHERE addresses.street="6439 Zetta Hills";  
  - SELECT * FROM addresses WHERE user_id=40;
  - Corrine Little, her other address is: 54369 Wolff Forges, Lake Bryon, CA

- Correct Virginie Mitchell's address to "New York, NY, 10108".
  - SELECT id FROM users WHERE first_name="Virginie" AND last_name="Mitchell"; 39
  - UPDATE addresses
  - SET street="567 Street", city="ATL", zip="30032"
  - WHERE user_id=39 AND city="New York";
- How many total items did we sell?
  - SELECT SUM(quantity) FROM orders;
  - 2,125

- Simulate buying an item by inserting a User for yourself and an Order for that User.
  - INSERT INTO users (first_name, last_name, email)
  - VALUES ("Sepehr", "Vakili", "sepehr@email.com");
    - USER: 52|Sepehr|Vakili|sepehr@email.com
  - INSERT INTO orders (user_id, item_id, quantity, created_at)
  - VALUES (52, 3, 5, 2015-10-05);
    - ORDER: 379|52|5|3|2015-10-05

# Hard Mode - Joins, Summation, More Advanced Queries

- How much would it cost to buy one of each tool?
  'SELECT SUM(price) FROM items WHERE category LIKE "%tool%";'
  - $46,477

- What item was ordered most often? Grossed the most money?
  - Most often: 
    'SELECT sum(orders.quantity) AS "sum", orders.item_id, items.title 
     FROM orders INNER JOIN items ON orders.item_id=items.id 
     GROUP BY orders.item_id ORDER BY sum DESC LIMIT 1;'
    - Answer: 72|65|Incredible Granite Car
  - Grossed most:
    'SELECT SUM(orders.quantity * items.price) AS "gross", items.title, items.id
     FROM orders INNER JOIN items ON orders.item_id=items.id 
     GROUP BY orders.item_id ORDER BY gross DESC LIMIT 1;'
    - Answer: 525240|Incredible Granite Car|65

- What user spent the most?

  'SELECT SUM(orders.quantity*items.price) AS total, orders.user_id, users.first_name, users.last_name
   ...> FROM orders INNER JOIN items, users ON orders.item_id=items.id AND orders.user_id=users.id GROUP BY orders.user_id ORDER BY total DESC LIMIT 1;'
  - Answer: 639386|19|Hassan|Runte

- What were the top 3 highest grossing categories?

  'SELECT SUM(orders.quantity*items.price) AS "gross", items.category 
   FROM orders INNER JOIN items ON orders.item_id=items.id 
   GROUP BY items.category ORDER BY gross DESC LIMIT 3;'
  - Answer:
    '525240|Music, Sports & Clothing'
    '449496|Beauty, Toys & Sports'
    '448410|Sports'

- How much was spent on books?

  'SELECT SUM(orders.quantity*items.price) AS "total" FROM orders 
   INNER JOIN items ON orders.item_id=items.id 
   WHERE items.category LIKE "%book%";'
  - Answer: $1,081,352









