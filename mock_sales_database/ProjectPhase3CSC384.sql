DROP TABLE Brand;
DROP TABLE CarriedBy;
DROP TABLE Collections;
DROP TABLE Customers;
DROP TABLE Influencers;
DROP TABLE OnlineStore;
DROP TABLE Products;
DROP TABLE Sales;
DROP TABLE Sponsors;
DROP TABLE Stores;


CREATE TABLE Customers(
    custName VARCHAR(25),
    CustomerID INT PRIMARY KEY,
    custAddress VARCHAR(50)
);

CREATE TABLE Stores(
    CompanyName VARCHAR(25) PRIMARY KEY
);

CREATE TABLE OnlineStores(
    CompanyName PRIMARY KEY references Stores,
    StoreURL VARCHAR(50)
);

CREATE TABLE Brand(
    BrandName VARCHAR(30) PRIMARY KEY,
    HeadQuarters VARCHAR(50)
);

CREATE TABLE Sales(
    saleDate VARCHAR(9),
    SaleID VARCHAR(10) PRIMARY KEY
);

CREATE TABLE Collections(
    collectionName VARCHAR(30) PRIMARY KEY,
    LaunchDate VARCHAR(9)
);

CREATE TABLE Influencer(
    InfluencerName VARCHAR(25),
    SocialTag VARCHAR(20),
    InfluencerAddress VARCHAR(50),
    SSN VARCHAR(9) PRIMARY KEY
);

DROP TABLE products;

CREATE TABLE Products(
    BrandName VARCHAR(30),
    foreign key(BrandName) references Brand,
    Manufacturer VARCHAR(25),
    ProductType VARCHAR(21),
    PRIMARY KEY(BrandName,ProductType)--no supporting relationship b/c it is already captured here
);

CREATE TABLE Sponsors(
    SSN VARCHAR(9),
    BrandName VARCHAR(30),
    foreign key(SSN) references Influencer,
    foreign key(BrandName) references Brand,
    AffiliateCode VARCHAR(25),
    primary key(SSN,BrandName)
);

CREATE TABLE CarriedBy(
    CompanyName VARCHAR(25),
    BrandName VARCHAR(30),
    foreign key(CompanyName) references Stores,
    foreign key(BrandName) references Brand,
    primary key(CompanyName,BrandName)
);

CREATE TABLE WasBought(
    SaleID VARCHAR(10),
    foreign key(SaleID) references Sales,
    ProductType VARCHAR(21),
    BrandName VARCHAR(30),
    foreign key(BrandName, ProductType) references Products,
    Quantity INT,
    primary key(SaleID, BrandName,ProductType)
);

CREATE TABLE PurchasedFrom(
    SaleID VARCHAR(10),
    CompanyName VARCHAR(25),
    foreign key(SaleID) references Sales,
    foreign key(CompanyName) references Stores,
    primary key(SaleID)
);

CREATE TABLE PurchasedBy(
    SaleID VARCHAR(10),
    CustomerID INT,
    foreign key(SaleID) references Sales,
    foreign key(CustomerID) references Customers,
    pointsEarned INT,
    primary key(SaleID)
);

CREATE TABLE Includes(
    ProductType VARCHAR(21),
    BrandName VARCHAR(30),
    collectionName VARCHAR(30),
    foreign key(BrandName,ProductType) references Products,
    foreign key(collectionName) references Collections,
    primary key(BrandName,ProductType)
);







