--Podpunkt 1

Use AdventureWorks2022;

WITH EmployeeData AS (
	SELECT 
		EPH.BusinessEntityID, PP.FirstName, PP.LastName, E.Gender, E.BirthDate, EPH.PayFrequency, EPH.Rate
	FROM HumanResources.EmployeePayHistory EPH
		JOIN HumanResources.Employee E
	ON E.BusinessEntityID = EPH.BusinessEntityID
		JOIN Person.Person PP
	ON EPH.BusinessEntityID = PP.BusinessEntityID
 
)
SELECT * FROM EmployeeData;

-- Podpunkt 2

USE AdventureWorksLT2019;
WITH Revenue AS (
	SELECT 
		SalesLT.Customer.CompanyName AS CompanyContact, SOH.TotalDue AS Yields
	FROM SalesLT.Customer
		JOIN SalesLT.SalesOrderHeader SOH
	ON SalesLT.Customer.CustomerID = SOH.CustomerID
) 
SELECT * FROM Revenue
ORDER BY Yields DESC;

-- Podpunkt 3
USE AdventureWorksLT2019;
WITH Sales AS (
	SELECT 
		PC.Name AS ProductCategory, 
		SUM(soh.TotalDue) AS SalesValue
	FROM SalesLT.SalesOrderDetail
		JOIN SalesLT.SalesOrderHeader soh
	ON SalesLT.SalesOrderDetail.SalesOrderID = soh.SalesOrderID
		JOIN SalesLT.Product 
	ON SalesLT.Product.ProductID = SalesLT.SalesOrderDetail.ProductID
		JOIN SalesLT.ProductCategory PC
	ON pc.ProductCategoryID = SalesLT.Product.ProductCategoryID
	GROUP BY pc.Name
) SELECT * FROM Sales
ORDER BY SalesValue DESC;