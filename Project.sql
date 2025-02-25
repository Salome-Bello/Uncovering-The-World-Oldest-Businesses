--CREATE DATABASE oldest_businesses;

--USE oldest_businesses;

SELECT * INTO all_businesses
FROM (
    SELECT * FROM businesses
    UNION 
    SELECT * FROM new_businesses
) AS new_table;


SELECT * FROM all_businesses AS AB
JOIN categories AS Cat
ON AB.category_code = Cat.Category_code

