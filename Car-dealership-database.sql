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
    monthly_payment DECIMAL(10,2),
    FOREIGN KEY (VIN) REFERENCES Vehicles(VIN)
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














