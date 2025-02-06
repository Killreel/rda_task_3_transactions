-- Use our database
USE ShopDB; 

ALTER TABLE Products CHANGE WareHouseAmount WarehouseAmount INT;
SELECT * FROM Customers WHERE ID = 1;

INSERT INTO
    Customers (
        ID,
        FirstName,
        LastName,
        Email,
        Address
    )
VALUES (
        1,
        'John',
        'Doe',
        'john.doe@example.com',
        '123 Main St'
    );


-- Some data should be created outside the transaction (here)

-- Start the transaction 
START TRANSACTION; 

INSERT INTO Orders (CustomerID, Date) VALUES (1, '2023-01-01');

-- Отримуємо ID створеного замовлення
SET @OrderID = LAST_INSERT_ID();

-- Додаємо товар AwersomeProduct (ID = 1) у замовлення
INSERT INTO
    OrderItems (OrderID, ProductID, Count)
VALUES (@OrderID, 1, 1);

-- Оновлюємо кількість товару на складі
UPDATE Products
SET
    WarehouseAmount = WarehouseAmount - 1
WHERE
    ID = 1;


COMMIT; 