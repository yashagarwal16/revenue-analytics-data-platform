/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files.
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the BULK INSERT command to load data from CSV files into bronze tables.
    - Tracks and prints load duration per table.
    - Tracks total layer load duration.

Parameters:
    None.
    This stored procedure does not accept any parameters
    and does not return any values.

Usage Example:
    EXEC bronze.load_bronze;


===============================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze
AS
BEGIN
    DECLARE
        @start_layer DATETIME,
        @end_layer   DATETIME,
        @start_table DATETIME,
        @end_table   DATETIME;

    BEGIN TRY
        SET @start_layer = GETDATE();

        PRINT '================================================';
        PRINT 'Loading Bronze Layer';
        PRINT '================================================';

        /* ============================================================
           Olist Customer
        ============================================================ */
        PRINT '------------------------------------------------';
        PRINT 'Loading Olist Customer Tables';
        PRINT '------------------------------------------------';

        SET @start_table = GETDATE();

        PRINT '>> Truncating Table: bronze.olist_customer';
        TRUNCATE TABLE bronze.olist_customer;

        PRINT '>> Inserting Data Into: bronze.olist_customer';
        BULK INSERT bronze.olist_customer
        FROM 'C:\Users\MY PC\Downloads\archive\AdventureWorks_Customers.csv'
        WITH (
            FIRSTROW       = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_table = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_table, @end_table) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';

        /* ============================================================
           Olist Calander
        ============================================================ */
        PRINT '------------------------------------------------';
        PRINT 'Loading Olist Calander Tables';
        PRINT '------------------------------------------------';

        SET @start_table = GETDATE();

        PRINT '>> Truncating Table: bronze.olist_calander';
        TRUNCATE TABLE bronze.olist_calander;

        PRINT '>> Inserting Data Into: bronze.olist_calander';
        BULK INSERT bronze.olist_calander
        FROM 'C:\Users\MY PC\Downloads\archive\AdventureWorks_Calendar.csv'
        WITH (
            FIRSTROW       = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_table = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_table, @end_table) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';

        /* ============================================================
           Olist Products
        ============================================================ */
        PRINT '------------------------------------------------';
        PRINT 'Loading Olist Products Tables';
        PRINT '------------------------------------------------';

        SET @start_table = GETDATE();

        PRINT '>> Truncating Table: bronze.olist_product';
        TRUNCATE TABLE bronze.olist_product;

        PRINT '>> Inserting Data Into: bronze.olist_product';
        BULK INSERT bronze.olist_product
        FROM 'C:\Users\MY PC\Downloads\archive\AdventureWorks_Products.csv'
        WITH (
            FIRSTROW       = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_table = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_table, @end_table) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';

        /* ============================================================
           Olist Product Categories
        ============================================================ */
        PRINT '------------------------------------------------';
        PRINT 'Loading Olist Product Categories Tables';
        PRINT '------------------------------------------------';

        SET @start_table = GETDATE();

        PRINT '>> Truncating Table: bronze.olist_product_categories';
        TRUNCATE TABLE bronze.olist_product_categories;

        PRINT '>> Inserting Data Into: bronze.olist_product_categories';
        BULK INSERT bronze.olist_product_categories
        FROM 'C:\Users\MY PC\Downloads\archive\AdventureWorks_Product_Categories.csv'
        WITH (
            FIRSTROW       = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_table = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_table, @end_table) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';

        /* ============================================================
           Olist Product Subcategories
        ============================================================ */
        PRINT '------------------------------------------------';
        PRINT 'Loading Olist Product Subcategories Tables';
        PRINT '------------------------------------------------';

        SET @start_table = GETDATE();

        PRINT '>> Truncating Table: bronze.olist_product_subcategories';
        TRUNCATE TABLE bronze.olist_product_subcategories;

        PRINT '>> Inserting Data Into: bronze.olist_product_subcategories';
        BULK INSERT bronze.olist_product_subcategories
        FROM 'C:\Users\MY PC\Downloads\archive\AdventureWorks_Product_Subcategories.csv'
        WITH (
            FIRSTROW       = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_table = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_table, @end_table) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';

        /* ============================================================
           Olist Returns
        ============================================================ */
        PRINT '------------------------------------------------';
        PRINT 'Loading Olist Returns Tables';
        PRINT '------------------------------------------------';

        SET @start_table = GETDATE();

        PRINT '>> Truncating Table: bronze.olist_returns';
        TRUNCATE TABLE bronze.olist_returns;

        PRINT '>> Inserting Data Into: bronze.olist_returns';
        BULK INSERT bronze.olist_returns
        FROM 'C:\Users\MY PC\Downloads\archive\AdventureWorks_Returns.csv'
        WITH (
            FIRSTROW       = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_table = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_table, @end_table) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';

        /* ============================================================
           Olist Sales 2015
        ============================================================ */
        PRINT '------------------------------------------------';
        PRINT 'Loading Olist SALES 2015 Tables';
        PRINT '------------------------------------------------';

        SET @start_table = GETDATE();

        PRINT '>> Truncating Table: bronze.olist_sales_2015';
        TRUNCATE TABLE bronze.olist_sales_2015;

        PRINT '>> Inserting Data Into: bronze.olist_sales_2015';
        BULK INSERT bronze.olist_sales_2015
        FROM 'C:\Users\MY PC\Downloads\archive\AdventureWorks_Sales_2015.csv'
        WITH (
            FIRSTROW       = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_table = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_table, @end_table) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';

        /* ============================================================
           Olist Sales 2016
        ============================================================ */
        PRINT '------------------------------------------------';
        PRINT 'Loading Olist SALES 2016 Tables';
        PRINT '------------------------------------------------';

        SET @start_table = GETDATE();

        PRINT '>> Truncating Table: bronze.olist_sales_2016';
        TRUNCATE TABLE bronze.olist_sales_2016;

        PRINT '>> Inserting Data Into: bronze.olist_sales_2016';
        BULK INSERT bronze.olist_sales_2016
        FROM 'C:\Users\MY PC\Downloads\archive\AdventureWorks_Sales_2016.csv'
        WITH (
            FIRSTROW       = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_table = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_table, @end_table) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';

        /* ============================================================
           Olist Sales 2017
        ============================================================ */
        PRINT '------------------------------------------------';
        PRINT 'Loading Olist SALES 2017 Tables';
        PRINT '------------------------------------------------';

        SET @start_table = GETDATE();

        PRINT '>> Truncating Table: bronze.olist_sales_2017';
        TRUNCATE TABLE bronze.olist_sales_2017;

        PRINT '>> Inserting Data Into: bronze.olist_sales_2017';
        BULK INSERT bronze.olist_sales_2017
        FROM 'C:\Users\MY PC\Downloads\archive\AdventureWorks_Sales_2017.csv'
        WITH (
            FIRSTROW       = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_table = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_table, @end_table) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';

        /* ============================================================
           Olist Territories
        ============================================================ */
        PRINT '------------------------------------------------';
        PRINT 'Loading Olist Territories Tables';
        PRINT '------------------------------------------------';

        SET @start_table = GETDATE();

        PRINT '>> Truncating Table: bronze.olist_territories';
        TRUNCATE TABLE bronze.olist_territories;

        PRINT '>> Inserting Data Into: bronze.olist_territories';
        BULK INSERT bronze.olist_territories
        FROM 'C:\Users\MY PC\Downloads\archive\AdventureWorks_Territories.csv'
        WITH (
            FIRSTROW       = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_table = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_table, @end_table) AS NVARCHAR) + ' seconds';
        PRINT '>> -------------';

        /* ============================================================
           Layer Summary
        ============================================================ */
        SET @end_layer = GETDATE();

        PRINT '==========================================';
        PRINT 'Loading Bronze Layer is Completed';
        PRINT '   - Total Load Duration: ' + CAST(DATEDIFF(SECOND, @start_layer, @end_layer) AS NVARCHAR) + ' seconds';
        PRINT '==========================================';

    END TRY
    BEGIN CATCH
        PRINT '==========================================';
        PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER';
        PRINT 'Error Message' + ERROR_MESSAGE();
        PRINT 'Error Message' + CAST(ERROR_NUMBER() AS NVARCHAR);
        PRINT 'Error Message' + CAST(ERROR_STATE() AS NVARCHAR);
        PRINT '==========================================';
    END CATCH
END

