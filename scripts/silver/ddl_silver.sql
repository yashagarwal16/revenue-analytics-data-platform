/*
===============================================================================
DDL Script: Create Silver Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'silver' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/


-- =============================================================================
-- 1. Calendar & Customers
-- =============================================================================
PRINT '-----------------------------------------------------------------------';
PRINT 'Creating Calendar and Customer tables...';

IF OBJECT_ID('silver.olist_calander', 'U') IS NOT NULL DROP TABLE silver.olist_calander;
CREATE TABLE silver.olist_calander (
	cal_pk					INT	IDENTITY(1,1) PRIMARY KEY,
    Dates					DATE,
	Revenue_curr_date		DATETIME DEFAULT GETDATE()
);
GO

IF OBJECT_ID('silver.olist_customer','U') IS NOT NULL DROP TABLE silver.olist_customer;
CREATE TABLE silver.olist_customer (
    Customer_no    INT,
    Prefix         VARCHAR(50),
    FirstName      VARCHAR(50),
    LastName       VARCHAR(50),
    BirthDate      VARCHAR(50),
    MartialStatus  VARCHAR(50),
    Gender         VARCHAR(50),
    EmailAddress   VARCHAR(50),
    AnnualIncome   VARCHAR(50),
    TotalChild     VARCHAR(50),
    Education      VARCHAR(50),
    Occupation     VARCHAR(50),
    HomeOwner      VARCHAR(50),
	Revenue_curr_date		DATETIME DEFAULT GETDATE()
);
GO

-- =============================================================================
-- 2. Product Catalog
-- =============================================================================
PRINT 'Creating Product-related tables...';

IF OBJECT_ID('silver.olist_product_categories','U') IS NOT NULL DROP TABLE silver.olist_product_categories;
CREATE TABLE silver.olist_product_categories (
    ProductCategoryKey INT,
    CategoryName       VARCHAR(50),
	Revenue_curr_date		DATETIME DEFAULT GETDATE()
);
GO

IF OBJECT_ID('silver.olist_product_subcategories','U') IS NOT NULL DROP TABLE silver.olist_product_subcategories;
CREATE TABLE silver.olist_product_subcategories (
    ProductSubcategoryKey  INT,
    SubcategoryName        VARCHAR(50),
    ProductCategoryKey     INT,
	Revenue_curr_date		DATETIME DEFAULT GETDATE()
);
GO

IF OBJECT_ID('silver.olist_product','U') IS NOT NULL DROP TABLE silver.olist_product;
CREATE TABLE silver.olist_product (
    ProductKey             INT,
    ProductSubcategoryKey  INT,
    ProductSKU             VARCHAR(50),
    ProductName            VARCHAR(50),
    ModelName              VARCHAR(200),
    ProductDiscription     VARCHAR(2000),
    ProductColour          VARCHAR(2000),
    ProductSize            VARCHAR(200),
    ProductStyle           VARCHAR(200),
    ProductCost            VARCHAR(250),
    ProductPrice           VARCHAR(250),
	Revenue_curr_date		DATETIME DEFAULT GETDATE()
);
GO

-- =============================================================================
-- 3. Sales & Returns
-- =============================================================================
PRINT 'Creating Sales and Returns tables...';

IF OBJECT_ID('silver.olist_returns','U') IS NOT NULL DROP TABLE silver.olist_returns;
CREATE TABLE silver.olist_returns (
    ReturnDate    DATE,
    TerritoryKey  INT,
    ProductKey    INT,
    ReturnQuantity INT,
	Revenue_curr_date		DATETIME DEFAULT GETDATE()
);
GO

-- Iterative creation for Sales tables
IF OBJECT_ID('silver.olist_sales_2015','U') IS NOT NULL DROP TABLE silver.olist_sales_2015;
CREATE TABLE silver.olist_sales_2015 (
    OrderDate       DATE,
    StockDate       DATE,
    OrderNumber     VARCHAR(50),
    ProductKey      INT,
    CustomerKey     INT,
    TerritoryKey    INT,
    OrderLineItem   INT,
    OrderQuantity   INT,
	Revenue_curr_date		DATETIME DEFAULT GETDATE()
);
GO

IF OBJECT_ID('silver.olist_sales_2016','U') IS NOT NULL DROP TABLE silver.olist_sales_2016;
CREATE TABLE silver.olist_sales_2016 (
    OrderDate       DATE,
    StockDate       DATE,
    OrderNumber     VARCHAR(50),
    ProductKey      INT,
    CustomerKey     INT,
    TerritoryKey    INT,
    OrderLineItem   INT,
    OrderQuantity   INT,
	Revenue_curr_date		DATETIME DEFAULT GETDATE()
);
GO

IF OBJECT_ID('silver.olist_sales_2017','U') IS NOT NULL DROP TABLE silver.olist_sales_2017;
CREATE TABLE silver.olist_sales_2017 (
    OrderDate       DATE,
    StockDate       DATE,
    OrderNumber     VARCHAR(50),
    ProductKey      INT,
    CustomerKey     INT,
    TerritoryKey    INT,
    OrderLineItem   INT,
    OrderQuantity   INT,
	Revenue_curr_date		DATETIME DEFAULT GETDATE()
);
GO

-- =============================================================================
-- 4. Territories
-- =============================================================================
PRINT 'Creating Territory tables...';

IF OBJECT_ID('silver.olist_territories','U') IS NOT NULL DROP TABLE silver.olist_territories;
CREATE TABLE silver.olist_territories (
    SalesTerritoryKey  INT,
    Region             VARCHAR(50),
    Country            VARCHAR(50),
    Continent          VARCHAR(50),
	Revenue_curr_date		DATETIME DEFAULT GETDATE()
);
GO

PRINT '-----------------------------------------------------------------------';
PRINT 'silver Layer Tables Created Successfully.';
