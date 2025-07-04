create schema project_7;
DELIMITER //

CREATE PROCEDURE GetCustomersByCity(IN cityName VARCHAR(50))
BEGIN
    SELECT * FROM customers
    WHERE city = cityName;
END //

DELIMITER ;

-- Call the procedure
CALL GetCustomersByCity('Chennai');
DELIMITER //

CREATE FUNCTION GetDiscount(purchaseAmount DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE discount DECIMAL(10,2);

    IF purchaseAmount > 1000 THEN
        SET discount = purchaseAmount * 0.10;
    ELSE
        SET discount = purchaseAmount * 0.05;
    END IF;

    RETURN discount;
END //

DELIMITER ;

-- Use the function
SELECT GetDiscount(1500) AS Discount;


