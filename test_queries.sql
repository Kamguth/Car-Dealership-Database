USE CarDealershipDatabase;

-- 1. Get all dealerships

SELECT * FROM Dealerships;


-- 2. Find all vehicles for a specific dealership

SELECT * 
FROM Vehicles 
WHERE VIN IN (
    SELECT VIN 
    FROM Inventory 
    WHERE dealership_id = 2
);

-- 3. Find a car by VIN

SELECT * FROM Vehicles
WHERE VIN = '63067';


-- 4. Find the dealership where a certain car is located, by VIN

SELECT *
FROM Dealerships
JOIN Inventory ON Dealerships.dealership_id = Inventory.dealership_id
WHERE VIN = '11152';

-- 5. Find all Dealerships that have a certain car type (i.e. Red Ford Mustang)

SELECT *
FROM Dealerships
JOIN Inventory ON Dealerships.dealership_id = Inventory.dealership_id
JOIN Vehicles ON Inventory.VIN = Vehicles.VIN
WHERE make = 'Ford' AND model = 'Mustang' AND color = 'Red';

-- 6. Get all sales information for a specific dealer for a specific date range

SELECT *
FROM SalesContracts
JOIN Inventory ON SalesContracts.VIN = Inventory.VIN
WHERE Inventory.dealership_id = 2
  AND SalesContracts.sale_date BETWEEN '2024-12-01' AND '2025-06-01';


-- One interesting discovery was solidifying my knowledge of using IN.

