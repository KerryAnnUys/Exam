--QUESTION 2

DROP TABLE IF EXISTS customer;
CREATE TABLE customer(
    cust_id INT PRIMARY KEY NOT NULL,
    cust_fname VARCHAR(255) NOT NULL,
    cust_lname VARCHAR(255) NOT NULL,
    cust_tel VARCHAR(10) NOT NULL,
    cust_email VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
    ord_num INT PRIMARY KEY NOT NULL,
    ord_status VARCHAR(15) NOT NULL,
    cust_id INT NOT NULL
);

DROP TABLE IF EXISTS product;
CREATE TABLE product(
    prod_code INT PRIMARY KEY NOT NULL,
    prod_name VARCHAR(255) NOT NULL,
    prod_price INT NOT NULL,
    prod_brand VARCHAR(255) NOT NULL
);


DROP TABLE IF EXISTS ordered_product;
CREATE TABLE ordered_product(
    prod_code INT,
    ord_num INT,
    quantity INT,

    PRIMARY KEY (prod_code, ord_num)

    CONSTRAINT fk_prod_code FOREIGN KEY (prod_code) REFERENCES product(prod_code)
    CONSTRAINT fk_ord_num FOREIGN KEY (ord_num) REFERENCES ordered_product(ord_num)
);

--QUESTION 3


INSERT INTO customer VALUES
(1, 'Patrick', 'Francis', '0837640455','PatrickFrancis@rhyta.com'),
(2,'Anthony','Warren','0859020590','AnthonyWarren@armyspy.com'),
(3,'Mason','Brady','0845481289', 'MasonBrady@teleworm.us')
;

INSERT INTO orders VALUES
(1,'PENDING',1),
(2,'COMPLETE',2),
(3, 'PENDING', 1),
(4, 'CANCELLED', 3),
(5, 'COMPLETE', 3),
(6, 'PENDING', 2)
;


INSERT INTO product VALUES
(1, 'iPhone 13',699,'Apple'),
(2, 'Galaxy S22',599,'Samsung'),
(3,   'Pixel 8 ',799,'Google')
;

INSERT INTO ordered_product VALUES
(1 ,  1  , 1 ),
(2,   2,   1),
(2,   3,   1),
(3,   2,   2),
(4,   1,   5),
(5,   3 ,  1),
(6,   1 ,  2)
;

--QUESTION 4 

SELECT * FROM customer;
SELECT * FROM orders;
SELECT * FROM product;
SELECT * FROM ordered_product;

--question 5

UPDATE product
SET prod_price = prod_price * 1.05
;

--QUESTION 6

SELECT prod_name, prod_brand, cust_fname, cust_lname
FROM product
JOIN ordered_product
    ON product.prod_code = ordered_product.prod_code
    ;

--question 7

SELECT cust_id, prod_code
FROM orders, ordered_product
WHERE orders.cust_id = ordered_product.prod_code;

--QUESTION 8 

SELECT ord_num COUNT(ord_num)
FROM orders 
;

--QUESTION 9 

SELECT * FROM ordered_product
WHERE quantity > 1
;

--QUESTION 10
--Below you will find my query. I have created a table and have added in an alter feature of SQL. Alter allows the user to DELETE the column name. i HAVE ALSO ADDED IN A SECOND ALTER STATEMENT WHERE IT ALLOWS ME TO CHANGE THE NUMBER OF CHARACTERS IN MY STRING. i have further added in an alter statemnt to add an additional colunn int my table. i have added in a drop statemtn to remove the column name.

DROP TABLE IF EXISTS fruit;
CREATE TABLE fruit(
    fruit_id INT PRIMARY KEY NOT NULL,
    fruit_type VARCHAR(200) NOT NULL,
    fruit_size INT NOT NULL
);

ALTER TABLE fruit
DELETE COLUMN fruit_size INT;

ALTER TABLE fruit
MODIFY fruit_type VARCHAR(100);

ALTER TABLE fruit
ADD COLUMN fruit_MASS INT;

DROP fruit_id;
