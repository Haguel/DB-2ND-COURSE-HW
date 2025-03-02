INSERT INTO owners (name, address, phone) VALUES
                                              ('John Smith', '123 Main St', '123-456-7890'),
                                              ('Alice Johnson', '456 Oak Ave', '987-654-3210'),
                                              ('Robert Brown', '789 Birch Ln', '111-222-3333'),
                                              ('Emily White', '147 Cedar Rd', '444-555-6666'),
                                              ('Daniel Green', '258 Spruce Dr', '777-888-9999'),
                                              ('Sophia Black', '369 Palm Blvd', '123-321-1234');

DECLARE @i INT = 7;
WHILE @i <= 100
    BEGIN
        INSERT INTO owners (name, address, phone)
        VALUES (CONCAT('Owner', @i, ' Smith'), CONCAT(@i * 100, ' Main St'), CONCAT(@i * 100, '-', @i * 200, '-', @i * 300));
        SET @i = @i + 1;
    END;

-- Insert 100 companies
INSERT INTO companies (name, address, owner_id) VALUES
                                                    ('TechWorld', '789 Pine St', 1),
                                                    ('GadgetHub', '321 Maple St', 2),
                                                    ('SmartSolutions', '654 Walnut St', 3),
                                                    ('ApplianceZone', '741 Elm St', 4),
                                                    ('FutureTech', '852 Oakwood Ave', 5),
                                                    ('InnoHub', '963 Willow Rd', 6);

SET @i = 7;
WHILE @i <= 100
    BEGIN
        INSERT INTO companies (name, address, owner_id)
        VALUES (CONCAT('Company', @i), CONCAT(@i * 100, ' Pine St'), @i);
        SET @i = @i + 1;
    END;

INSERT INTO categories (name) VALUES
                                  ('Electronics'),
                                  ('Home Appliances'),
                                  ('Furniture'),
                                  ('Kitchenware'),
                                  ('Toys'),
                                  ('Office Supplies');

SET @i = 7;
WHILE @i <= 100
    BEGIN
        INSERT INTO categories (name)
        VALUES (CONCAT('Category', @i));
        SET @i = @i + 1;
    END;

INSERT INTO products (name, price, quantity_available, category_id, company_id) VALUES
                                                                                    ('Smartphone', 699.99, 50, 1, 1),
                                                                                    ('Vacuum Cleaner', 199.99, 30, 2, 2),
                                                                                    ('Tablet', 499.99, 20, 1, 3),
                                                                                    ('Blender', 79.99, 40, 4, 4),
                                                                                    ('Desk Chair', 129.99, 25, 3, 5),
                                                                                    ('Printer', 159.99, 15, 6, 6);

SET @i = 7;
WHILE @i <= 100
    BEGIN
        INSERT INTO products (name, price, quantity_available, category_id, company_id)
        VALUES (CONCAT('Product', @i), 50.00 + (@i * 10) % 600, 10 + (@i % 40), (@i % 100) + 1, (@i % 100) + 1);
        SET @i = @i + 1;
    END;

INSERT INTO contracts (date) VALUES
                                 ('2025-02-20'),
                                 ('2025-03-05'),
                                 ('2025-03-15'),
                                 ('2025-04-01'),
                                 ('2025-04-15'),
                                 ('2025-05-01');

SET @i = 7;
WHILE @i <= 100
    BEGIN
        INSERT INTO contracts (date)
        VALUES (DATEADD(DAY, @i, '2025-01-01'));
        SET @i = @i + 1;
    END;

INSERT INTO contract_details (product_id, volume, delivery_deadline, company_supplier_id, company_receiver_id) VALUES
                                                                                                                   (1, 10, '2025-03-01', 1, 2),
                                                                                                                   (2, 5, '2025-03-10', 2, 1),
                                                                                                                   (3, 15, '2025-03-20', 3, 4),
                                                                                                                   (4, 20, '2025-04-05', 4, 3),
                                                                                                                   (5, 8, '2025-04-10', 5, 6),
                                                                                                                   (6, 12, '2025-04-20', 6, 5),
                                                                                                                   (2, 12, '2025-04-20', 6, 5);

SET @i = 7;
WHILE @i <= 100
    BEGIN
        INSERT INTO contract_details (product_id, volume, delivery_deadline, company_supplier_id, company_receiver_id)
        VALUES (@i % 100 + 1, 5 + (@i % 20), DATEADD(DAY, @i + 10, '2025-01-01'), @i % 100 + 1, (@i + 1) % 100 + 1);
        SET @i = @i + 1;
    END;

INSERT INTO contract_contract_details (contract_id, contract_details_id) VALUES
                                                                             (1, 1),
                                                                             (2, 2),
                                                                             (3, 3),
                                                                             (4, 4),
                                                                             (5, 5),
                                                                             (5, 6),
                                                                             (6, 7);

SET @i = 7;
WHILE @i <= 100
    BEGIN
        INSERT INTO contract_contract_details (contract_id, contract_details_id)
        VALUES (@i % 100 + 1, @i);
        SET @i = @i + 1;
    END;