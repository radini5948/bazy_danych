--AD 1
SELECT * FROM Production.Product WHERE ProductID = 680
BEGIN TRANSACTION T1
	UPDATE Production.Product
	SET ListPrice = ListPrice * 1.10
	WHERE ProductID = 680
	COMMIT;
--AD 2
BEGIN TRANSACTION T2
	DELETE FROM Production.Product
	WHERE ProductID = 707
	ROLLBACK;
SELECT * FROM Production.Product WHERE ProductID = 707

--AD 3
SET IDENTITY_INSERT Production.Product ON;
BEGIN TRANSACTION T3
	INSERT INTO Production.Product([ProductID],[Name],[ProductNumber],[MakeFlag],[FinishedGoodsFlag],[Color],[SafetyStockLevel],[ReorderPoint],[StandardCost],[ListPrice],[Size],[SizeUnitMeasureCode],[WeightUnitMeasureCode],[Weight],[DaysToManufacture],[ProductLine],[Class],[Style],[ProductSubcategoryID],[ProductModelID],[SellStartDate],[SellEndDate],[DiscontinuedDate],[rowguid],[ModifiedDate])
	VALUES(1916, 'Koszulka Legii Warszawa', 'LW-1916', 1, 1, 'Biała', 100, 275, 300.0, 450.0, 'L', NULL, NULL,NULL,0, 'M','U',16,1916,420,'2012-05-30 00:00:00.000','2013-05-30 00:00:00.000',NULL,CONVERT(uniqueidentifier,'0C6A36BA-10E4-438F-BA86-0D5B68A2BB15'),'2014-02-08 10:01:36.827')
	COMMIT;
SELECT * FROM Production.Product WHERE ProductID = 1916
--AD4
BEGIN TRANSACTION T4;
 
BEGIN TRY
    -- Aktualizacja StandardCost o 10%
    UPDATE Production.Product
    SET StandardCost = StandardCost * 1.10;
 
    -- Sprawdzenie, czy suma StandardCost po aktualizacji nie przekracza 50000
    DECLARE @TotalStandardCost MONEY;
    SELECT @TotalStandardCost = SUM(StandardCost) FROM Production.Product;
 
    IF @TotalStandardCost <= 60000
    BEGIN
        -- Jeśli suma nie przekracza 50000, zatwierdź transakcję
        COMMIT;
        PRINT 'Transakcja zatwierdzona. Suma StandardCost wynosi: ' + CAST(@TotalStandardCost AS NVARCHAR(50));
    END
    ELSE
    BEGIN
        -- Jeśli suma przekracza 50000, wycofaj transakcję
        ROLLBACK;
        PRINT 'Transakcja wycofana. Suma StandardCost przekracza 50000. Aktualna suma: ' + CAST(@TotalStandardCost AS NVARCHAR(50));
    END
END TRY
BEGIN CATCH
    -- Jeśli wystąpi błąd, wycofaj transakcję i wyświetl komunikat o błędzie
    ROLLBACK;
    SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
--AD5
BEGIN TRANSACTION T5;
	IF EXISTS(SELECT * FROM Production.Product WHERE ProductNumber = 'LW-1916')
		BEGIN
			PRINT'Product already exists'
			ROLLBACK
		END;
	ELSE
		BEGIN
			INSERT INTO Production.Product([ProductID],[Name],[ProductNumber],[MakeFlag],[FinishedGoodsFlag],[Color],[SafetyStockLevel],[ReorderPoint],[StandardCost],[ListPrice],[Size],[SizeUnitMeasureCode],[WeightUnitMeasureCode],[Weight],[DaysToManufacture],[ProductLine],[Class],[Style],[ProductSubcategoryID],[ProductModelID],[SellStartDate],[SellEndDate],[DiscontinuedDate],[rowguid],[ModifiedDate])
			VALUES(1916, 'Koszulka Legii Warszawa', 'LW-1916', 1, 1, 'Biała', 100, 275, 300.0, 450.0, 'L', NULL, NULL,NULL,0, 'M','U',16,1916,420,'2012-05-30 00:00:00.000','2013-05-30 00:00:00.000',NULL,CONVERT(uniqueidentifier,'0C6A36BA-10E4-438F-BA86-0D5B68A2BB15'),'2014-02-08 10:01:36.827')
			COMMIT
		END;
SELECT * FROM Production.Product
ORDER BY ProductID DESC;
--AD6
BEGIN TRANSACTION T6
	IF EXISTS(SELECT * FROM Sales.SalesOrderDetail WHERE OrderQty = 0)
		BEGIN 
			PRINT'Rejected'
			ROLLBACK
		END;
	ELSE
		BEGIN
			UPDATE Sales.SalesOrderDetail
				SET OrderQty = OrderQty + 19
				COMMIT
		END;
SELECT * FROM Sales.SalesOrderDetail
ORDER BY OrderQty ASC;
--AD7
BEGIN TRANSACTION T7
	DECLARE @AVERAGECOST MONEY;
	SELECT @AVERAGECOST= AVG(StandardCost) FROM Production.Product;
	DELETE FROM Production.Product
	WHERE StandardCost > @AVERAGECOST;
