INSERT INTO owners (name, address, phone) VALUES
    ('John Smith', '123 Main St', '123-456-7890'),
    ('Alice Johnson', '456 Oak Ave', '987-654-3210'),
    ('Robert Brown', '789 Birch Ln', '111-222-3333'),
    ('Emily White', '147 Cedar Rd', '444-555-6666'),
    ('Daniel Green', '258 Spruce Dr', '777-888-9999'),
    ('Sophia Black', '369 Palm Blvd', '123-321-1234');

INSERT INTO companies (name, address, owner_id) VALUES
    ('TechWorld', '789 Pine St', 1),
    ('GadgetHub', '321 Maple St', 2),
    ('SmartSolutions', '654 Walnut St', 3),
    ('ApplianceZone', '741 Elm St', 4),
    ('FutureTech', '852 Oakwood Ave', 5),
    ('InnoHub', '963 Willow Rd', 6);

INSERT INTO categories (name) VALUES
    ('Electronics'),
    ('Home Appliances'),
    ('Furniture'),
    ('Kitchenware'),
    ('Toys'),
    ('Office Supplies');

INSERT INTO products (name, price, quantity_available, category_id, company_id) VALUES
    ('Smartphone', 699.99, 50, 1, 1),
    ('Vacuum Cleaner', 199.99, 30, 2, 2),
    ('Tablet', 499.99, 20, 1, 3),
    ('Blender', 79.99, 40, 4, 4),
    ('Desk Chair', 129.99, 25, 3, 5),
    ('Printer', 159.99, 15, 6, 6);

INSERT INTO contracts (date) VALUES
    ('2025-02-20'),
    ('2025-03-05'),
    ('2025-03-15'),
    ('2025-04-01'),
    ('2025-04-15'),
    ('2025-05-01');

INSERT INTO contract_details (product_id, volume, delivery_deadline, company_supplier_id, company_receiver_id) VALUES
    (1, 10, '2025-03-01', 1, 2),
    (2, 5, '2025-03-10', 2, 1),
    (3, 15, '2025-03-20', 3, 4),
    (4, 20, '2025-04-05', 4, 3),
    (5, 8, '2025-04-10', 5, 6),
    (6, 12, '2025-04-20', 6, 5),
    (2, 12, '2025-04-20', 6, 5);

INSERT INTO contract_contract_details (contract_id, contract_details_id) VALUES
     (1, 1),
     (2, 2),
     (3, 3),
     (4, 4),
     (5, 5),
     (5, 6),
     (6, 7);
