SELECT ProductID,Name,Color
FROM Production.Product
----------------------------------------
SELECT SalesOrderID OrderID,SalesOrderDetailID,ProductID,(1-UnitPriceDiscount)*OrderQty*UnitPrice TotalPrice
FROM Sales.SalesOrderDetail
----------------------------------------
SELECT SalesOrderID AS OrderID,SalesOrderDetailID,ProductID,(1-UnitPriceDiscount)*OrderQty*UnitPrice AS TotalPrice
FROM Sales.SalesOrderDetail
----------------------------------------
SELECT SalesOrderID AS OrderID,SalesOrderDetailID,ProductID,(1-UnitPriceDiscount)*OrderQty*UnitPrice'Total Price'
FROM Sales.SalesOrderDetail
----------------------------------------
SELECT SalesOrderID AS OrderID,SalesOrderDetailID,ProductID,(1-UnitPriceDiscount)*OrderQty*UnitPrice AS 'Total Price'
FROM Sales.SalesOrderDetail
----------------------------------------
SELECT *
FROM Production.Product
WHERE ProductID >700
----------------------------------------
SELECT *
FROM Production.Product
WHERE ProductID%2=0
----------------------------------------
SELECT Name
FROM Production.Product
WHERE ProductID=777
----------------------------------------
SELECT *
FROM Production.Product
WHERE Color=Color
----------------------------------------
SELECT *
FROM Production.Product
WHERE Color IS NULL
----------------------------------------
SELECT *
FROM Production.Product
WHERE Color IS NOT NULL
----------------------------------------
SELECT SalesOrderID,SalesOrderDetailID,ProductID,
(1-UnitPriceDiscount)*OrderQty*UnitPrice 'Total'
FROM Sales.SalesOrderDetail
WHERE (1-UnitPriceDiscount)*OrderQty*UnitPrice >4000
----------------------------------------
SELECT *
FROM Production.Product
WHERE Name='Blade'
----------------------------------------
SELECT *
FROM Production.Product
WHERE Name LIKE 'a%'
----------------------------------------
SELECT *
FROM Production.Product
WHERE Name LIKE '%a%'
----------------------------------------
SELECT *
FROM Production.Product
WHERE Name LIKE '_a%'
----------------------------------------
SELECT *
FROM Production.Product
WHERE Name LIKE '%e'
----------------------------------------
SELECT *
FROM Production.Product
WHERE Name LIKE '%[%]%'
----------------------------------------
SELECT *
FROM Production.Product
WHERE Name LIKE '%\[%' ESCAPE '\'
----------------------------------------
SELECT *
FROM Production.Product
WHERE Name LIKE '[afw]%'
----------------------------------------
SELECT *
FROM Production.Product
WHERE Name LIKE '[a-f]%'
----------------------------------------
SELECT *
FROM Production.Product
WHERE Name LIKE '[^a-f]%'
----------------------------------------
SELECT *
FROM Production.Product
WHERE ProductID BETWEEN 700 AND 800
--------------------------------
SELECT *
FROM Production.Product
WHERE Name BETWEEN 'a' AND 'm'
--------------------------------
SELECT *
FROM Production.Product
WHERE Name BETWEEN 'a' AND 'n'
--------------------------------
SELECT *
FROM Production.Product
--------------------------------
SELECT *
FROM Production.Product
ORDER BY Name
--------------------------------
SELECT *
FROM Production.Product
ORDER BY Name DESC
--------------------------------
SELECT SalesOrderID,SalesOrderDetailID,
(1-UnitPriceDiscount)*OrderQty*UnitPrice 'Total'
FROM Sales.SalesOrderDetail
ORDER BY Total
--------------------------------
SELECT *
FROM Production.Product
ORDER BY Color
--------------------------------
SELECT *
FROM Production.Product
ORDER BY Color DESC
--------------------------------
SELECT *
FROM Production.Product
ORDER BY Color DESC,Name
--------------------------------
SELECT ProductID,Name,Color
FROM Production.Product
ORDER BY 2 DESC
--------------------------------
SELECT COUNT(*)
FROM Production.Product
--------------------------------
SELECT COUNT(ProductID)
FROM Production.Product
--------------------------------
SELECT COUNT(Color)
FROM Production.Product
--------------------------------
SELECT SUM(OrderQty)
FROM Sales.SalesOrderDetail
--------------------------------
SELECT SUM(LineTotal)
FROM Sales.SalesOrderDetail
--------------------------------
SELECT SUM(OrderQty)
FROM Sales.SalesOrderDetail
WHERE ProductID=777
--------------------------------
SELECT SUM(LineTotal)
FROM Sales.SalesOrderDetail
WHERE ProductID=777
--------------------------------
SELECT MAX(UnitPrice)
FROM Sales.SalesOrderDetail
WHERE ProductID=777
--------------------------------
SELECT MIN(UnitPrice)
FROM Sales.SalesOrderDetail
WHERE ProductID=777
--------------------------------
SELECT AVG(UnitPrice)
FROM Sales.SalesOrderDetail
WHERE ProductID=777
--------------------------------
SELECT VAR(UnitPrice)
FROM Sales.SalesOrderDetail
WHERE ProductID=777
--------------------------------
SELECT CONVERT(DECIMAL(10,2),SUM(OrderQty*UnitPrice*UnitPriceDiscount))
FROM Sales.SalesOrderDetail
WHERE ProductID=777
--------------------------------
SELECT ProductID,SUM(OrderQty)
FROM Sales.SalesOrderDetail
GROUP BY ProductID
--------------------------------
SELECT ProductID,MAX(UnitPrice),MIN(UnitPrice)
FROM Sales.SalesOrderDetail
GROUP BY ProductID
--------------------------------
SELECT Color,COUNT(*)
FROM Production.Product
GROUP BY Color
--------------------------------
SELECT LEFT('sample',2)
--------------------------------
SELECT LEFT(Name,1)
FROM Production.Product
-------------------------------
SELECT LEFT(Name,1),COUNT(*)
FROM Production.Product
GROUP BY LEFT(Name,1)
--------------------------------
SELECT *
FROM HumanResources.Employee
--------------------------------
SELECT YEAR(HireDate),COUNT(*)
FROM HumanResources.Employee
GROUP BY YEAR(HireDate)
--------------------------------
SELECT YEAR(GETDATE())-YEAR(BirthDate),COUNT(*)
FROM HumanResources.Employee
GROUP BY YEAR(GETDATE())-YEAR(BirthDate)
--------------------------------
--------------------------------
SELECT YEAR(ModifiedDate)'Year',ProductID,SUM(OrderQty)'Total'
FROM Sales.SalesOrderDetail
GROUP BY YEAR(ModifiedDate),ProductID
--------------------------------
SELECT YEAR(ModifiedDate)'Year',MONTH(ModifiedDate)'Month',SUM(OrderQty)'Qty'
FROM Sales.SalesOrderDetail
GROUP BY YEAR(ModifiedDate),MONTH(ModifiedDate)
WITH ROLLUP
ORDER BY 1,2
--------------------------------
SELECT YEAR(ModifiedDate)'Year',MONTH(ModifiedDate)'Month',SUM(OrderQty)'Qty'
FROM Sales.SalesOrderDetail
GROUP BY YEAR(ModifiedDate),MONTH(ModifiedDate)
WITH CUBE
ORDER BY 1,2
--------------------------------
SELECT YEAR(ModifiedDate)'Year',MONTH(ModifiedDate)'Month',
ProductID,SUM(OrderQty)'Qty'
FROM Sales.SalesOrderDetail
GROUP BY YEAR(ModifiedDate),MONTH(ModifiedDate),ProductID
WITH CUBE
ORDER BY 1,2,3
--------------------------------
SELECT ProductID,Name,Color
FROM Production.Product
--------------------------------
SELECT ProductID,Name,ISNULL(Color,'No Color')'Color'
FROM Production.Product
--------------------------------
SELECT ProductID,Name,REPLACE(Color,'Blue','------')
FROM Production.Product
--------------------------------
IF EXISTS
(
	SELECT *
	FROM Sales.SalesOrderDetail
	WHERE ProductID=1
)
	PRINT 'Yes'
ELSE
	PRINT 'No'
--------------------------------
SELECT *
FROM Sales.SalesOrderDetail
WHERE ProductID=777
--------------------------------
SELECT ProductID
FROM Sales.SalesOrderDetail
--------------------------------
SELECT DISTINCT ProductID
FROM Sales.SalesOrderDetail
--------------------------------
SELECT COUNT(UnitPrice)
FROM Sales.SalesOrderDetail
WHERE ProductID=777
--------------------------------
SELECT COUNT(*)
FROM Sales.SalesOrderDetail
WHERE ProductID=777
--------------------------------
SELECT COUNT(DISTINCT UnitPrice)
FROM Sales.SalesOrderDetail
WHERE ProductID=777
--------------------------------
SELECT MAX(UnitPrice)-MIN(UnitPrice)
FROM Sales.SalesOrderDetail
WHERE ProductID=777
--------------------------------
SELECT ProductID,SUM(OrderQty)'Quantity'
FROM Sales.SalesOrderDetail
WHERE ProductID BETWEEN 700 AND 800
GROUP BY ProductID
--------------------------------
SELECT YEAR(ModifiedDate),SUM(OrderQty)'Quantity'
FROM Sales.SalesOrderDetail
WHERE YEAR(ModifiedDate)=2003
GROUP BY YEAR(ModifiedDate)
--------------------------------
SELECT ProductID,SUM(OrderQty)'Quantity'
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(OrderQty)>4000
--------------------------------
SELECT ProductID,COUNT(DISTINCT UnitPrice)
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING COUNT(DISTINCT UnitPrice)=1
--------------------------------
SELECT SUM(OrderQty)
FROM Sales.SalesOrderDetail
GROUP BY ProductID
--------------------------------
SELECT TOP 1 ProductID,SUM(OrderQty)
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY SUM(OrderQty) DESC
--------------------------------
----------------------------
SELECT *
FROM Sales.SalesOrderDetail
ORDER BY UnitPrice DESC
----------------------------
SELECT TOP 3 *
FROM Sales.SalesOrderDetail
ORDER BY UnitPrice DESC
----------------------------
SELECT TOP 3 WITH TIES *
FROM Sales.SalesOrderDetail
ORDER BY UnitPrice DESC
----------------------------
SELECT ROW_NUMBER()OVER(ORDER BY Name)'Row',Name
FROM Production.Product
----------------------------
SELECT ROW_NUMBER()
OVER(ORDER BY SUM(OrderQty) DESC)'Row',ProductID,SUM(OrderQty)'Total Qty'
FROM Sales.SalesOrderDetail
GROUP BY ProductID
----------------------------
SELECT ROW_NUMBER()
OVER(ORDER BY SUM(OrderQty) DESC)'Row',ProductID,SUM(OrderQty)'Total Qty'
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY ProductID
----------------------------
SELECT ROW_NUMBER()
OVER(ORDER BY Name)'Row',Name
FROM Production.Product
WHERE Color='Red'
----------------------------
SELECT NTILE(10)OVER(ORDER BY Color)'Part',Name,Color
FROM Production.Product
----------------------------
SELECT @@CONNECTIONS
----------------------------
DECLARE @C INT
SELECT @C=COUNT(DISTINCT ISNULL(Color,''))
FROM Production.Product
--SELECT @C
SELECT NTILE(@C)OVER(ORDER BY Color)'Part',Name,Color
FROM Production.Product
----------------------------
SELECT RANK()
OVER(ORDER BY Color)'Rank',Name,Color
FROM Production.Product
----------------------------
SELECT DENSE_RANK()
OVER(ORDER BY Color)'Rank',Name,Color
FROM Production.Product
----------------------------
WITH Q
AS
(
	SELECT ProductID,Name
	FROM Production.Product
	WHERE Color='Red'
)
SELECT *
FROM Q
WHERE Name LIKE 'm%'
----------------------------
WITH Q
AS
(
	SELECT ProductID,SUM(OrderQty*UnitPrice)'Price'
	FROM Sales.SalesOrderDetail
	GROUP BY ProductID
)
SELECT *
FROM Q
WHERE Price BETWEEN 4000 AND 8000
----------------------------
WITH Q
AS
(
	SELECT ProductID,SUM(OrderQty)'Qty'
	FROM Sales.SalesOrderDetail
	GROUP BY ProductID
)
SELECT AVG(Qty),MAX(Qty),MIN(Qty),SUM(Qty)
FROM Q
----------------------------
WITH Q
AS
(
	SELECT NTILE(20)OVER(ORDER BY Name)'Part',Name
	FROM Production.Product
)
SELECT *
FROM Q
WHERE Part=5
----------------------------
-------------------------------
WITH Q
AS
(
	SELECT ProductID,SUM(OrderQty)'Qty'
	FROM Sales.SalesOrderDetail
	GROUP BY ProductID
	ORDER BY Qty
)
SELECT *
FROM Q
-------------------------------
WITH Q
AS
(
	SELECT TOP 50 PERCENT ProductID,SUM(OrderQty)'Qty'
	FROM Sales.SalesOrderDetail
	GROUP BY ProductID
	ORDER BY Qty
)
SELECT *
FROM Q
-------------------------------
USE Session6
-------------------------------
WITH Q
AS
(
	SELECT *
	FROM Product
)
DELETE Q
-------------------------------
USE AdventureWorks
-------------------------------
SELECT *
FROM Production.Product
WHERE ProductID IN
(
	SELECT DISTINCT ProductID
	FROM Sales.SalesOrderDetail
)
-------------------------------
SELECT Name
FROM Production.Product
WHERE ProductID NOT IN
(
	SELECT DISTINCT ProductID
	FROM Sales.SalesOrderDetail
)
-------------------------------
SELECT Name
FROM Production.Product
WHERE ProductID IN
(
	SELECT TOP 1 ProductID
	FROM Sales.SalesOrderDetail
	GROUP BY ProductID
	ORDER BY SUM(OrderQty) DESC
)
-------------------------------
SELECT Name
FROM Production.Product
WHERE ProductID IN
(
	SELECT TOP 1 WITH TIES ProductID
	FROM Sales.SalesOrderDetail
	GROUP BY ProductID
	ORDER BY SUM(OrderQty) DESC
)
-------------------------------
SELECT Name
FROM Production.Product
WHERE ProductID IN
(
	SELECT ProductID
	FROM Sales.SalesOrderDetail
	GROUP BY ProductID
	HAVING SUM(OrderQty) IN
		(
			SELECT TOP 1 SUM(OrderQty)
			FROM Sales.SalesOrderDetail
			GROUP BY ProductID
			ORDER BY 1 DESC
		)
)
-------------------------------
SELECT Name
FROM Production.Product
WHERE ProductID IN
(
	SELECT ProductID
	FROM Sales.SalesOrderDetail
	GROUP BY ProductID
	HAVING COUNT(DISTINCT UnitPrice)=1
)
-------------------------------
SELECT Name
FROM Production.Product
WHERE ProductID NOT IN
(
	SELECT ProductID
	FROM Sales.SalesOrderDetail
	GROUP BY ProductID
	HAVING COUNT(DISTINCT UnitPrice)=1
)
-------------------------------
SELECT *
FROM Production.ProductCategory
-------------------------------
SELECT *
FROM Production.ProductSubcategory
-------------------------------
SELECT Name
FROM Production.ProductSubcategory
WHERE ProductSubcategoryID IN
(
	SELECT ProductSubcategoryID
	FROM Production.Product
	WHERE ProductID IN
		(
			SELECT ProductID
			FROM Sales.SalesOrderDetail
			GROUP BY ProductID
			HAVING SUM(OrderQty) IN	
			(
				SELECT TOP 1 SUM(OrderQty)
				FROM Sales.SalesOrderDetail
				GROUP BY ProductID
				ORDER BY 1 DESC
			)
		)
)
---------------------------------------------
SELECT Name
FROM Production.ProductCategory
WHERE ProductCategoryID IN
(
	SELECT ProductCategoryID
	FROM Production.ProductSubcategory
	WHERE ProductSubcategoryID IN
	(
		SELECT ProductSubcategoryID
		FROM Production.Product
		WHERE ProductID IN
			(
				SELECT ProductID
				FROM Sales.SalesOrderDetail
				GROUP BY ProductID
				HAVING SUM(OrderQty) IN	
				(
					SELECT TOP 1 SUM(OrderQty)
					FROM Sales.SalesOrderDetail
					GROUP BY ProductID
					ORDER BY 1 DESC
				)
			)
	)
)
---------------------------------------------
CREATE DATABASE SessionX
---------------------------------------------
USE SessionX
---------------------------------------------
CREATE TABLE JobGroups
(
	JobGroupID INT PRIMARY KEY,
	JobGroupName NVARCHAR(50)
)
---------------------------------------------
CREATE TABLE Courses
(
	CourseID INT PRIMARY KEY,
	CourseTitle NVARCHAR(50)
)
---------------------------------------------
CREATE TABLE Requirements
(
	JobGroupID INT,
	CourseID INT,
	PRIMARY KEY(JobGroupID,CourseID)
)
---------------------------------------------
CREATE TABLE Employees
(
	EmployeeID INT PRIMARY KEY,
	JobGroupID INT
)
---------------------------------------------
CREATE TABLE History
(
	EmployeeID INT,
	CourseID INT,
	PRIMARY KEY(EmployeeID,CourseID)
)
---------------------------------------------
SELECT *
FROM Courses
WHERE CourseID IN
(
	SELECT CourseID
	FROM Requirements
	WHERE JobGroupID IN
	(
		SELECT JobGroupID
		FROM Employees
		WHERE EmployeeID=3021
	)
)
AND CourseID NOT IN
(
	SELECT CourseID
	FROM History
	WHERE EmployeeID=3021
)
---------------------------------------------
SELECT ProductID
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(OrderQty)>= ALL
	(
		SELECT SUM(OrderQty)
		FROM Sales.SalesOrderDetail
		GROUP BY ProductID
	)
---------------------------------------------
SELECT *
FROM Production.ProductCategory
---------------------------------------------
SELECT SUM(OrderQty)
FROM Sales.SalesOrderDetail
WHERE ProductID=ANY
	(
		SELECT ProductID
		FROM Production.Product
		WHERE ProductSubcategoryID=ANY
			(
				SELECT ProductSubcategoryID
				FROM Production.ProductSubcategory
				WHERE ProductCategoryID=
					(
						SELECT ProductCategoryID
						FROM Production.ProductCategory
						WHERE Name='Bikes'	
					)
			)
	)
---------------------------------------------
--به ازای هر رکورد جدول کالا
--کد کالای آن رکورد را ارسال کن به پرس و جوی داخل پرانتز
--جواب پرس و جوی داخل پرانتز که مجموع تعداد فروش کالای جاری هست
--در کنار اسم آن کالا ظاهر شود
SELECT Name,
ISNULL(
(
	SELECT SUM(OrderQty)
	FROM Sales.SalesOrderDetail
	WHERE ProductID=p.ProductID
)
,0)'Total'
FROM Production.Product p
ORDER BY Total DESC
---------------------------------------------
