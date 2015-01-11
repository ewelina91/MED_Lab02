zad 5.
SELECT LastName FROM Employees WHERE Region IS NULL 

zad 6.
SELECT ProductName as NazwaProduktu, UnitPrice as NajnizszaCena, HighestPrice = 0 FROM Products
WHERE UnitPrice = (SELECT TOP 1 MIN(UnitPrice) FROM Products)
UNION 
SELECT ProductName as NazwaProduktu, LowestPrice=0,UnitPrice as NajwyzszaCena FROM Products
WHERE UnitPrice = (SELECT TOP 1 MAX(UnitPrice) FROM Products)

zad 7.
SELECT ProductName as NazwaProduktu FROM Products 
WHERE UnitPrice > (Select AVG(UnitPrice) FROM Products) 
ORDER BY ProductName

SELECT SUM(Freight) as SumaFrachtow FROM Orders 

zad.8
SELECT distinct ProductName, datename(WEEKDAY,OrderDate) as dzien FROM Products, [Order Details], [Orders]
WHERE Products.ProductID=[Order Details].ProductID 
and [Order Details].OrderID=Orders.OrderID
and DATENAME(Weekday, OrderDate)='Saturday' 
or DATENAME(Weekday, OrderDate)='Sunday'

SELECT CategoryID as Kategoria, AVG(UnitPrice) as SredniaCenaWgKategorii 
FROM Products group by CategoryID

zad.9
SELECT CompanyName as NazwaKlienta,
SUM([Order Details].UnitPrice*Quantity-Discount) as Suma
FROM Customers, Orders, [Order Details],Products
WHERE Customers.CustomerID=Orders.CustomerID 
and Orders.OrderID=[Order Details].OrderID
and [Order Details].ProductID=Products.ProductID
group by CompanyName

zad.10
SELECT ProductName as NazwaProduktu, SUM([Order Details].ProductID) 
as IloscZamowionychProduktow
FROM Products, [Order Details]
WHERE Products.ProductID=[Order Details].ProductID
group by ProductName
