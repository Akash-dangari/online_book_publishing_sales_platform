create database online_book_publishing_sales_platform;

use online_book_publishing_sales_platform;

create table publisher(
  PublisherID int primary key,
  name varchar(100) not null,
  ContactDetails varchar(255)
  );
  
CREATE TABLE Book(
	BookID INT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    ISBN VARCHAR(20) NOT NULL,
    Edition INT NOT NULL,
    PublisherID INT,
    FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherID )
);

CREATE TABLE Genre (
GenreID INT PRIMARY KEY,
GenreName VARCHAR(100) NOT NULL
);

CREATE TABLE BookGenre (
BookID INT,
GenreID INT,

PRIMARY KEY (BookID, GenreID),

FOREIGN KEY (BookID) REFERENCES Book (BookID),

FOREIGN KEY (GenreID) REFERENCES Genre (GenreID)
);


CREATE TABLE Author (

AuthorID INT PRIMARY KEY,

Name VARCHAR(100) NOT NULL,

Biography TEXT

);

CREATE TABLE BookAuthor (

BookID INT,

AuthorID INT,

PRIMARY KEY (BookID,AuthorID),

FOREIGN KEY (BookID) REFERENCES Book (BookID),

FOREIGN KEY (AuthorID) REFERENCES Author (AuthorID)

);
CREATE TABLE Customer ( CustomerID INT PRIMARY KEY, Name VARCHAR(100) NOT NULL  );

CREATE TABLE Address (

AddressID INT PRIMARY KEY,

CustomerID INT,

Street VARCHAR(100),

City VARCHAR(100),

State VARCHAR(100),

Country VARCHAR(100),

FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID)

);
CREATE TABLE Wishlist (

CustomerID INT,

BookID INT,

PRIMARY KEY (CustomerID, BookID),

FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID),

FOREIGN KEY (BookID) REFERENCES Book (BookID)


);
CREATE TABLE Orderr (

OrderID INT PRIMARY KEY,

OrderDate DATE NOT NULL,

CustomerID INT,

PaymentDetails VARCHAR(255),

ShipmentStatus VARCHAR(50),

ShippingAddressID INT,

FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID),

FOREIGN KEY (ShippingAddressID) REFERENCES Address (AddressID)
);

CREATE TABLE Order_Book (

OrderItemID INT PRIMARY KEY,

OrderID INT,

BookID INT,

Quantity INT NOT NULL,
ItemDiscount DECIMAL (5,2),

FOREIGN KEY (OrderID) REFERENCES Orderr (OrderID),

FOREIGN KEY (BookID) REFERENCES Book (BookID)

); 




INSERT INTO Publisher (PublisherID, name, ContactDetails) VALUES 
(1, 'Penguin Books', 'contact@penguinbooks.com'),
(2, 'HarperCollins', 'support@harpercollins.com'),
(3, 'Simon & Schuster', 'info@simonandschuster.com');


INSERT INTO Book (BookID, Title, ISBN, Edition, PublisherID) VALUES 
(1, 'The Great Gatsby', '9780743273565', 1, 1),
(2, 'To Kill a Mockingbird', '9780061120084', 2, 2),
(3, '1984', '9780451524935', 1, 3);

INSERT INTO Genre (GenreID, GenreName) VALUES 
(1, 'Fiction'),
(2, 'Classic'),
(3, 'Dystopian');

INSERT INTO BookGenre (BookID, GenreID) VALUES 
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 3);

INSERT INTO Author (AuthorID, Name, Biography) VALUES 
(1, 'F. Scott Fitzgerald', 'American novelist, known for The Great Gatsby.'),
(2, 'Harper Lee', 'Author of To Kill a Mockingbird.'),
(3, 'George Orwell', 'British writer famous for 1984 and Animal Farm.');

INSERT INTO BookAuthor (BookID, AuthorID) VALUES 
(1, 1),
(2, 2),
(3, 3);

INSERT INTO Customer (CustomerID, Name) VALUES 
(1, 'Alice Johnson'),
(2, 'Bob Smith'),
(3, 'Charlie Brown');

INSERT INTO Address (AddressID, CustomerID, Street, City, State, Country) VALUES 
(1, 1, '123 Main St', 'New York', 'NY', 'USA'),
(2, 2, '456 Elm St', 'Los Angeles', 'CA', 'USA'),
(3, 3, '789 Oak St', 'Chicago', 'IL', 'USA');

INSERT INTO Wishlist (CustomerID, BookID) VALUES 
(1, 1),
(2, 2),
(3, 3);

INSERT INTO Orderr (OrderID, OrderDate, CustomerID, PaymentDetails, ShipmentStatus, ShippingAddressID) VALUES 
(1, '2025-06-01', 1, 'Visa ****1234', 'Shipped', 1),
(2, '2025-06-02', 2, 'PayPal', 'Processing', 2);

INSERT INTO Order_Book (OrderItemID, OrderID, BookID, Quantity, ItemDiscount) VALUES 
(1, 1, 1, 1, 5.00),
(2, 2, 2, 2, 10.00);