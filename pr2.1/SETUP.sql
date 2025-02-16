CREATE TABLE owners (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    phone VARCHAR(20)
);

CREATE TABLE companies (
   id INT IDENTITY(1,1) PRIMARY KEY,
   name VARCHAR(255) UNIQUE NOT NULL,
   address VARCHAR(255),
   owner_id INT FOREIGN KEY REFERENCES owners(id)
);

CREATE TABLE categories (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE products (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    quantity_available INT CHECK (quantity_available >= 0),
    category_id INT FOREIGN KEY REFERENCES categories(id),
    company_id INT FOREIGN KEY REFERENCES companies(id)
);

CREATE TABLE contracts (
    id INT IDENTITY(1,1) PRIMARY KEY,
    date DATE NOT NULL
);

CREATE TABLE contract_details (
    id INT IDENTITY(1,1) PRIMARY KEY,
    product_id INT FOREIGN KEY REFERENCES products(id),
    volume INT CHECK (volume > 0),
    delivery_deadline DATE,
    company_supplier_id INT FOREIGN KEY REFERENCES companies(id),
    company_receiver_id INT FOREIGN KEY REFERENCES companies(id)
);

CREATE TABLE contract_contract_details (
   id INT IDENTITY(1,1) PRIMARY KEY,
   contract_id INT FOREIGN KEY REFERENCES contracts(id),
   contract_details_id INT FOREIGN KEY REFERENCES contract_details(id)
);


