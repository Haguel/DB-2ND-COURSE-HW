-- WHERE & OR & AND & LIKE
SELECT * FROM owners
WHERE name LIKE '% Smith';

SELECT * FROM owners
WHERE name LIKE '% Smith' AND address LIKE '123%';

SELECT * FROM owners
WHERE name LIKE '% Smith' AND address NOT LIKE '123%';

SELECT * FROM owners
WHERE name LIKE '% Smith' AND address LIKE '123%' or address LIKE '369%';

-- JOIN & LEFT JOIN & RIGHT JOIN & FULL JOIN
SELECT * FROM contract_contract_details
JOIN contracts c on contract_contract_details.contract_id = c.id;

SELECT * FROM contract_contract_details
LEFT JOIN contracts c on contract_contract_details.contract_id = c.id;

SELECT * FROM contract_contract_details
RIGHT JOIN contracts c on contract_contract_details.contract_id = c.id;

SELECT * FROM contract_contract_details
FULL JOIN contracts c on contract_contract_details.contract_id = c.id;

-- SUBQUERY
SELECT * FROM contract_contract_details
WHERE contract_id IN (SELECT id FROM contracts WHERE date = '2025-04-01');

-- GROUP BY & HAVING & JOIN WITH WHERE
SELECT
    ccd.contract_details_id,
    cd.id,
    cd.delivery_deadline,
    c.name as company_name,
    SUM(cd.volume) AS total_volume
FROM contract_contract_details ccd
JOIN contract_details cd ON ccd.contract_details_id = cd.id
JOIN companies c ON cd.company_supplier_id = c.id
    WHERE c.name LIKE 'Company%'
GROUP BY ccd.contract_details_id, cd.id, cd.delivery_deadline, c.name
HAVING SUM(volume) > 10;

-- COUNT
SELECT COUNT(*) FROM owners
UNION ALL
SELECT COUNT(*) FROM products
UNION ALL
SELECT COUNT(*) FROM categories
UNION ALL
SELECT COUNT(*) FROM companies
UNION ALL
SELECT COUNT(*) FROM contracts
UNION ALL
SELECT COUNT(*) FROM contract_details
UNION ALL
SELECT COUNT(*) FROM contract_contract_details;

-- AGGREGATE FUNCTION
SELECT category_id, AVG(price) AS average_price
FROM products
GROUP BY category_id;

SELECT company_supplier_id, SUM(volume) AS total_volume
FROM contract_details
GROUP BY company_supplier_id;

SELECT date, COUNT(*) AS contract_count
FROM contracts
GROUP BY date;

-- WINDOW FUNCTION
SELECT
    id,
    name,
    price,
    SUM(price) OVER (ORDER BY id) AS running_total_price
FROM products;

SELECT
    company_supplier_id,
    COUNT(*) AS contract_count,
    MIN(volume) AS min_volume,
    MAX(volume) AS max_volume
FROM contract_details
GROUP BY company_supplier_id;

SELECT
    id,
    name,
    category_id,
    price,
    AVG(price) OVER (PARTITION BY category_id) AS avg_price_per_category
FROM products;

-- ROW FUNCTION
SELECT
    id,
    name,
    category_id,
    price,
    ROW_NUMBER() OVER (PARTITION BY category_id ORDER BY price DESC) AS row_num
FROM products;

SELECT
    company_supplier_id,
    SUM(volume) AS total_volume,
    RANK() OVER (ORDER BY SUM(volume) DESC) AS rank
FROM contract_details
GROUP BY company_supplier_id;

SELECT
    id,
    name,
    category_id,
    price,
    DENSE_RANK() OVER (PARTITION BY category_id ORDER BY price DESC) AS dense_rank
FROM products;

-- DATA HANDLE FUNCTION
SELECT
    id,
    date,
    YEAR(date) AS contract_year
FROM contracts;

SELECT
    id,
    delivery_deadline,
    DATEDIFF(day, GETDATE(), delivery_deadline) AS days_until_deadline
FROM contract_details;

SELECT
    id,
    date,
    DATEADD(day, 30, date) AS new_date
FROM contracts;