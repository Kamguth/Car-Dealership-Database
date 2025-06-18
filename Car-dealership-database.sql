DROP DATABASE IF EXISTS CarDealershipDatabase;
CREATE DATABASE CarDealershipDatabase;
USE CarDealershipDatabase;

CREATE TABLE Dealerships ( 
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(50),
    phone VARCHAR(12)
);

CREATE TABLE Vehicles (
    VIN VARCHAR(17) PRIMARY KEY,
    year INT,
    make VARCHAR(30),
    model VARCHAR(30),
    type VARCHAR(20),
    color VARCHAR(20),
    mileage INT,
    price DECIMAL(10, 2),
    sold BOOLEAN DEFAULT FALSE
);



CREATE TABLE Inventory (
    dealership_id INT,
    VIN VARCHAR(17),
    PRIMARY KEY (dealership_id, VIN),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

CREATE TABLE SalesContracts (
    contract_id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17),
    sale_date DATE,
    customer_name VARCHAR(50),
    customer_email VARCHAR(50),
    year INT,
    make VARCHAR(30),
    model VARCHAR(30),
    type VARCHAR(20),
    color VARCHAR(20),
    mileage INT,
    price DECIMAL(10,2),
    sales_tax DECIMAL(10,2),
    fees DECIMAL(10,2),
    total_price DECIMAL(10,2),
    is_financed BOOLEAN,
    monthly_payment DECIMAL(10,2),
    FOREIGN KEY (VIN) REFERENCES Vehicles(VIN)
);

CREATE TABLE LeaseContracts (
    lease_id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17),
    lease_date DATE,
    customer_name VARCHAR(50),
    customer_email VARCHAR(50),
    year INT,
    make VARCHAR(30),
    model VARCHAR(30),
    type VARCHAR(20),
    color VARCHAR(20),
    price DECIMAL(10,2),
    expected_value DECIMAL(10,2),
    lease_fee DECIMAL(10,2),
    total_lease_price DECIMAL(10,2),
    monthly_payment DECIMAL(10,2)
);

INSERT INTO Vehicles (VIN, year, make, model, type, color, mileage, price)
VALUES 
('11152', 2021, 'Ford', 'Fusion', 'SUV', 'RED', 32930, 11905.08),
('63067', 2022, 'Honda', 'Pilot', 'Coupe', 'WHITE', 42852, 43452.86),
('76434', 2017, 'Honda', 'Pilot', 'SUV', 'YELLOW', 178551, 32037.51),
('89321', 2018, 'Toyota', 'Camry', 'Sedan', 'Black', 61200, 17800.00),
('58291', 2020, 'Nissan', 'Altima', 'Sedan', 'Silver', 38900, 19300.50),
('47913', 2023, 'Chevrolet', 'Malibu', 'Sedan', 'Blue', 7200, 25100.00),
('71236', 2019, 'Jeep', 'Cherokee', 'SUV', 'Green', 81200, 20900.99),
('31846', 2021, 'Ford', 'Escape', 'SUV', 'White', 15000, 27495.75),
('27461', 2022, 'Kia', 'Sorento', 'SUV', 'Gray', 22000, 28150.00),
('58472', 2020, 'Hyundai', 'Elantra', 'Sedan', 'Red', 30100, 16800.00),
('61549', 2016, 'Dodge', 'Durango', 'SUV', 'Black', 94000, 19950.00),
('14327', 2015, 'BMW', 'X5', 'SUV', 'White', 106000, 23499.99),
('83265', 2019, 'Audi', 'A4', 'Sedan', 'Silver', 45000, 28999.00),
('34719', 2021, 'Subaru', 'Outback', 'Wagon', 'Green', 17000, 31200.00),
('90812', 2023, 'Tesla', 'Model 3', 'Sedan', 'Blue', 5100, 39999.99),
('12784', 2018, 'Mazda', 'CX-5', 'SUV', 'Gray', 56400, 18900.00),
('96453', 2020, 'Volkswagen', 'Passat', 'Sedan', 'Black', 28900, 20500.00),
('76342', 2017, 'Chevrolet', 'Equinox', 'SUV', 'White', 83000, 17800.00);


INSERT INTO SalesContracts (
    VIN, sale_date, customer_name, customer_email,
    year, make, model, type, color, mileage,
    price, sales_tax, fees, total_price, is_financed, monthly_payment
) VALUES
('11152', '2025-03-21', 'Alex Mason', 'alex.mason@example.com', 2021, 'Ford', 'Fusion', 'SUV', 'RED', 32930, 11905.08, 595.25, 295.00, 12795.33, TRUE, 213.26),
('63067', '2025-05-31', 'Jamie Reed', 'jamie.reed@example.com', 2022, 'Honda', 'Pilot', 'Coupe', 'WHITE', 42852, 43452.86, 2172.64, 150.00, 45775.50, TRUE, 762.92),
('76434', '2025-04-24', 'Taylor Brooks', 'taylor.brooks@example.com', 2017, 'Honda', 'Pilot', 'SUV', 'YELLOW', 178551, 32037.51, 1601.88, 295.00, 33934.39, TRUE, 565.57),
('89321', '2024-11-16', 'Morgan Lane', 'morgan.lane@example.com', 2018, 'Toyota', 'Camry', 'Sedan', 'Black', 61200, 17800.00, 890.00, 150.00, 18840.00, TRUE, 314.00),
('58291', '2024-12-05', 'Jordan Rivers', 'jordan.rivers@example.com', 2020, 'Nissan', 'Altima', 'Sedan', 'Silver', 38900, 19300.50, 965.03, 295.00, 20560.53, TRUE, 342.68);


INSERT INTO LeaseContracts (
    VIN, lease_date, customer_name, customer_email,
    year, make, model, type, color,
    price, expected_value, lease_fee, total_lease_price, monthly_payment
) VALUES
('47913', '2024-09-13', 'Avery Scott', 'avery.scott@example.com', 2023, 'Chevrolet', 'Malibu', 'Sedan', 'Blue', 25100.00, 12550.00, 1757.00, 14307.00, 596.13),
('71236', '2024-04-18', 'Riley James', 'riley.james@example.com', 2019, 'Jeep', 'Cherokee', 'SUV', 'Green', 20900.99, 10450.50, 1463.07, 11913.57, 496.40),
('31846', '2024-06-04', 'Casey Drew', 'casey.drew@example.com', 2021, 'Ford', 'Escape', 'SUV', 'White', 27495.75, 13747.88, 1924.70, 15672.58, 653.02),
('27461', '2024-01-26', 'Skyler Hayes', 'skyler.hayes@example.com', 2022, 'Kia', 'Sorento', 'SUV', 'Gray', 28150.00, 14075.00, 1970.50, 16045.50, 668.56),
('58472', '2024-07-02', 'Peyton Blake', 'peyton.blake@example.com', 2020, 'Hyundai', 'Elantra', 'Sedan', 'Red', 16800.00, 8400.00, 1176.00, 9576.00, 399.00);


INSERT INTO Dealerships (name, address, phone) VALUES
('Super Cars Inc.', '123 Auto Lane, Springfield', '555-1234'),
('City Motors', '456 Main St, Springfield', '555-5678'),
('Luxury Rides', '789 Oak Ave, Springfield', '555-8765'),
('Affordable Autos', '101 Market St, Springfield', '555-4321');



INSERT INTO Inventory (dealership_id, VIN) VALUES
(1, '11152'),
(1, '63067'),
(1, '76434'),
(1, '89321'),
(2, '58291'),
(2, '47913'),
(2, '71236'),
(2, '31846'),
(3, '27461'),
(3, '58472'),
(3, '61549'),
(3, '14327'),
(4, '83265'),
(4, '34719'),
(4, '90812'),
(4, '12784');
-- Forgot to add 2 cars
INSERT INTO Inventory (dealership_id, VIN) VALUES
(3, '96453'),
(4, '76342');

INSERT INTO Vehicles (VIN, year, make, model, type, color, mileage, price)
VALUES ('99999', 2023, 'Ford', 'Mustang', 'Car', 'Red', 10000, 32000.00);

INSERT INTO Inventory (dealership_id, VIN)
VALUES (1, '99999');

-- SalesContracts VIN foreign key fix
ALTER TABLE SalesContracts DROP FOREIGN KEY salescontracts_ibfk_1;

ALTER TABLE SalesContracts 
ADD CONSTRAINT salescontracts_ibfk_1 
FOREIGN KEY (VIN) REFERENCES Vehicles(VIN) ON DELETE CASCADE;

-- LeaseContracts VIN foreign key fix
ALTER TABLE LeaseContracts DROP FOREIGN KEY leasecontracts_ibfk_1;

ALTER TABLE LeaseContracts 
ADD CONSTRAINT leasecontracts_ibfk_1 
FOREIGN KEY (VIN) REFERENCES Vehicles(VIN) ON DELETE CASCADE;

















