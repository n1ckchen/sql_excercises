-- first query Join the two tables so that every column and record appears, 
-- regardless of if there is not an owner_id. Your output should look like this:
SELECT * FROM owners o 
  FULL OUTER JOIN vehicles v 
    ON o.id=v.owner_id;

-- second query
--Count the number of cars for each owner. Display the owners first_name, 
--last_name and count of vehicles. The first_name should be ordered in ascending order. 
SELECT first_name, last_name, 
  COUNT(owner_id) FROM owners o 
  JOIN vehicles v on o.id=v.owner_id 
  GROUP BY (first_name, last_name) 
ORDER BY first_name;


-- third query
SELECT 
  first_name, last_name, 
  ROUND(AVG(price)) as average_price, 
  COUNT(owner_id) 
FROM owners o 
JOIN vehicles v on o.id=v.owner_id 
GROUP BY 
  (first_name, last_name) 
HAVING 
  COUNT(owner_id) > 1 AND ROUND(AVG(price)) > 10000 
ORDER BY first_name DESC;