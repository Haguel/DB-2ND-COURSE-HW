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
