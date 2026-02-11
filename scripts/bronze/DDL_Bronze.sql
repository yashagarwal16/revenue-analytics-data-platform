/*
===============================================================================
Bronze Layer DDL Script: Raw Data Ingestion
===============================================================================
Script Purpose: 
    This script creates the tables in the 'bronze' schema. The Bronze layer 
    is used to store raw data exactly as it is received from source files 
    (Olist E-commerce dataset).
    
    Note: Data types in this layer are kept flexible (VARCHAR) where needed 
     to ensure successful ingestion before cleaning in the Silver layer.
===============================================================================
*/

USE Revenue;
GO

-- =============================================================================
-- 1. Calendar & Customers
-- =============================================================================
PRINT '-----------------------------------------------------------------------';
PRINT 'Creating Calendar and Customer tables...';

IF OBJECT_ID('bronze.olist_calander', 'U') IS NOT NULL DROP TABLE bronze.olist_calander;
CREATE TABLE bronze.olist_calander (
    Dates DATE
);
GO

IF OBJECT_ID('bronze.olist_customer','U') IS NOT NULL DROP TABLE bronze.olist_customer;
CREATE TABLE bronze.olist_customer (
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
    HomeOwner      VARCHAR(50)
);
GO

-- =============================================================================
-- 2. Product Catalog
-- =============================================================================
PRINT 'Creating Product-related tables...';

IF OBJECT_ID('bronze.olist_product_categories','U') IS NOT NULL DROP TABLE bronze.olist_product_categories;
CREATE TABLE bronze.olist_product_categories (
    ProductCategoryKey INT,
    CategoryName       VARCHAR(50)
);
GO

IF OBJECT_ID('bronze.olist_product_subcategories','U') IS NOT NULL DROP TABLE bronze.olist_product_subcategories;
CREATE TABLE bronze.olist_product_subcategories (
    ProductSubcategoryKey  INT,
    SubcategoryName        VARCHAR(50),
    ProductCategoryKey     INT
);
GO

IF OBJECT_ID('bronze.olist_product','U') IS NOT NULL DROP TABLE bronze.olist_product;
CREATE TABLE bronze.olist_product (
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
    ProductPrice           VARCHAR(250)
);
GO

-- =============================================================================
-- 3. Sales & Returns
-- =============================================================================
PRINT 'Creating Sales and Returns tables...';

IF OBJECT_ID('bronze.olist_returns','U') IS NOT NULL DROP TABLE bronze.olist_returns;
CREATE TABLE bronze.olist_returns (
    ReturnDate    DATE,
    TerritoryKey  INT,
    ProductKey    INT,
    ReturnQuantity INT
);
GO

-- Iterative creation for Sales tables
IF OBJECT_ID('bronze.olist_sales_2015','U') IS NOT NULL DROP TABLE bronze.olist_sales_2015;
CREATE TABLE bronze.olist_sales_2015 (
    OrderDate       DATE,
    StockDate       DATE,
    OrderNumber     VARCHAR(50),
    ProductKey      INT,
    CustomerKey     INT,
    TerritoryKey    INT,
    OrderLineItem   INT,
    OrderQuantity   INT
);
GO

IF OBJECT_ID('bronze.olist_sales_2016','U') IS NOT NULL DROP TABLE bronze.olist_sales_2016;
CREATE TABLE bronze.olist_sales_2016 (
    OrderDate       DATE,
    StockDate       DATE,
    OrderNumber     VARCHAR(50),
    ProductKey      INT,
    CustomerKey     INT,
    TerritoryKey    INT,
    OrderLineItem   INT,
    OrderQuantity   INT
);
GO

IF OBJECT_ID('bronze.olist_sales_2017','U') IS NOT NULL DROP TABLE bronze.olist_sales_2017;
CREATE TABLE bronze.olist_sales_2017 (
    OrderDate       DATE,
    StockDate       DATE,
    OrderNumber     VARCHAR(50),
    ProductKey      INT,
    CustomerKey     INT,
    TerritoryKey    INT,
    OrderLineItem   INT,
    OrderQuantity   INT
);
GO

-- =============================================================================
-- 4. Territories
-- =============================================================================
PRINT 'Creating Territory tables...';

IF OBJECT_ID('bronze.olist_territories','U') IS NOT NULL DROP TABLE bronze.olist_territories;
CREATE TABLE bronze.olist_territories (
    SalesTerritoryKey  INT,
    Region             VARCHAR(50),
    Country            VARCHAR(50),
    Continent          VARCHAR(50)
);
GO

PRINT '-----------------------------------------------------------------------';
PRINT 'Bronze Layer Tables Created Successfully.';
