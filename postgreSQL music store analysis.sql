--1.Who is the most senior most employee based on job title?

SELECT * FROM employee
ORDER BY levels desc
LIMIT 1



--2.Which country have the most invoices?
SELECT COUNT(*) AS c, billing_country 
FROM invoice
GROUP BY billing_country
ORDER BY c DESC



--3.What are the top 3 values of total invoices?
SELECT total FROM invoice
ORDER BY total desc
LIMIT 3



--4.Which city has the best customers ? We would like to throw a promotional music festival in the city 
-- that has the highest sum of invoice of invoice totals. Return both the city name & 
-- sum of all invoice totals.
SELECT SUM(total) as total_invoice, billing_city
FROM invoice
GROUP BY billing_city
ORDER BY total_invoice desc



--5.Who is the best customer? The customer who has spend the most money will be declared the best customer.
--  Write a query that returns the person who has spend the most money.
SELECT customer.customer_id, customer.first_name, customer.last_name, SUM(invoice.total) as t
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id
ORDER BY t desc
limit 1



--6.Write query to return the email, first_name, last_name & Genre of all Rock Music listeners. Return 
--  your list ordered alphabetically by email starting with A.
SELECT DISTINCT email, first_name, last_name
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
WHERE track_id IN (
    SELECT track_id FROM track
    JOIN genre ON genre.genre_id = track.genre_id
    WHERE genre.name = 'Rock')
ORDER BY customer.email



--7.Return all the track names that have a song length longer than the avg song length. Return the name 
--  and miliseconds for each track. Order by the song length with the longest songs listed first.
SELECT name, milliseconds FROM track
WHERE milliseconds > (SELECT AVG(milliseconds) FROM track)
order by milliseconds desc




