UPDATE owners SET address = '789 New Main St' WHERE name = 'John Smith';
UPDATE owners SET phone = '111-222-3333' WHERE name = 'Alice Johnson';

UPDATE companies SET address = '999 New Pine St' WHERE name = 'TechWorld';
UPDATE companies SET name = 'GadgetHub Plus' WHERE id = 2;

UPDATE categories SET name = 'Smart Home Appliances' WHERE name = 'Home Appliances';

UPDATE products SET price = price * 1.1 WHERE category_id = 1;
UPDATE products SET quantity_available = 100 WHERE name = 'Vacuum Cleaner';

UPDATE contracts SET date = '2025-04-01' WHERE id = 1;
UPDATE contracts SET date = '2025-04-15' WHERE id = 2;

UPDATE contract_details SET volume = 15 WHERE product_id = 1;
UPDATE contract_details SET delivery_deadline = '2025-03-20' WHERE id = 2;

UPDATE contract_contract_details SET contract_id = 2 WHERE contract_details_id = 1;
