SELECT *
FROM Sales.SalesOrderDetail
--------------------------------------------------
SELECT *
FROM Production.Product
WHERE ProductSubcategoryID IS NULL
--------------------------------------------------
SELECT *
FROM Production.Product
INNER JOIN Sales.SalesOrderDetail
ON Production.Product.ProductID=
Sales.SalesOrderDetail.ProductID
--------------------------------------------------
SELECT SalesOrderID,SalesOrderDetailID,Production.Product.ProductID,
Name,OrderQty,LineTotal
FROM Production.Product
INNER JOIN Sales.SalesOrderDetail
ON Production.Product.ProductID=
Sales.SalesOrderDetail.ProductID
--------------------------------------------------
SELECT Name,SUM(OrderQty)'Quantity'
FROM Production.Product
INNER JOIN Sales.SalesOrderDetail
ON Production.Product.ProductID=
Sales.SalesOrderDetail.ProductID
GROUP BY Name
--------------------------------------------------
SELECT Production.Product.ProductID,Name,SUM(OrderQty)'Quantity'
FROM Production.Product
INNER JOIN Sales.SalesOrderDetail
ON Production.Product.ProductID=
Sales.SalesOrderDetail.ProductID
GROUP BY Production.Product.ProductID,Name
--------------------------------------------------
SELECT Production.ProductSubcategory.Name,SUM(OrderQty)'Quantity'
FROM Production.ProductSubcategory INNER JOIN
Production.Product
ON Production.ProductSubcategory.ProductSubcategoryID=
Production.Product.ProductSubcategoryID
INNER JOIN Sales.SalesOrderDetail
ON Production.Product.ProductID=Sales.SalesOrderDetail.ProductID
GROUP BY Production.ProductSubcategory.Name
--------------------------------------------------
SELECT c.Name,SUM(OrderQty)'Quantity'
FROM Production.ProductCategory c
INNER JOIN Production.ProductSubcategory sc
ON c.ProductCategoryID=sc.ProductCategoryID
INNER JOIN Production.Product p
ON sc.ProductSubcategoryID=p.ProductSubcategoryID
INNER JOIN Sales.SalesOrderDetail s
ON p.ProductID=s.ProductID
GROUP BY c.Name
--------------------------------------------------
SELECT Name,SUM(OrderQty)'Quantity'
FROM Production.Product p
LEFT OUTER JOIN Sales.SalesOrderDetail s
ON p.ProductID=s.ProductID
GROUP BY Name
--------------------------------------------------
SELECT sc.Name,p.Name
FROM Production.ProductSubcategory sc
LEFT OUTER JOIN Production.Product p
ON sc.ProductSubcategoryID=p.ProductSubcategoryID
--------------------------------------------------
SELECT sc.Name,p.Name
FROM Production.ProductSubcategory sc
RIGHT OUTER JOIN Production.Product p
ON sc.ProductSubcategoryID=p.ProductSubcategoryID
--------------------------------------------------
SELECT sc.Name'Subcategory',p.Name'Product',SUM(OrderQty)'Quantity'
FROM Production.ProductSubcategory sc
FULL OUTER JOIN Production.Product p
ON sc.ProductSubcategoryID=p.ProductSubcategoryID
FULL OUTER JOIN Sales.SalesOrderDetail s
ON p.ProductID=s.ProductID
GROUP BY sc.Name,p.Name
ORDER BY 1,2
--------------------------------------------------
SELECT sc.Name,YEAR(s.ModifiedDate),''As Quantity
FROM Production.ProductSubcategory sc
CROSS JOIN Sales.SalesOrderDetail s
GROUP BY sc.Name,YEAR(s.ModifiedDate)
ORDER BY 1,2
--------------------------------------------------
SELECT c.Name,YEAR(s.ModifiedDate),''As Quantity
FROM Production.ProductCategory c
CROSS JOIN Sales.SalesOrderDetail s
GROUP BY c.Name,YEAR(s.ModifiedDate)
ORDER BY 1,2
--------------------------------------------------
SELECT *
FROM HumanResources.Employee
--------------------------------------------------
SELECT emp.EmployeeID,mng.EmployeeID
FROM HumanResources.Employee emp
INNER JOIN HumanResources.Employee mng
ON emp.ManagerID=mng.EmployeeID
--------------------------------------------------END-->SESSION08