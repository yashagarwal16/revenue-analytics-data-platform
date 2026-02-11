/*
===============================================================================
Database Initialization Script: Revenue Data Warehouse
===============================================================================
Project Name:    Revenue Analytics Data Platform
Script Purpose:  This script initializes the 'Revenue' database and establishes 
                 the Medallion Architecture (Bronze, Silver, Gold) schemas.
Version:         1.0
-------------------------------------------------------------------------------
WARNING:
    This script is destructive. If the 'Revenue' database exists, it will be 
    dropped and all data will be permanently deleted.
===============================================================================
*/

USE master;
GO

-- =============================================================================
-- 1. Create Database
-- =============================================================================
PRINT 'Initializing Database Creation...';

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'Revenue')
BEGIN
    PRINT 'Existing [Revenue] database found. Dropping for fresh install...';
    ALTER DATABASE Revenue SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Revenue;
END;
GO

CREATE DATABASE Revenue;
GO

USE Revenue;
GO

-- =============================================================================
-- 2. Create Medallion Schemas (Bronze -> Silver -> Gold)
-- =============================================================================
PRINT 'Creating Data Layers (Schemas)...';
GO

-- Bronze: Raw data ingestion from source systems
CREATE SCHEMA bronze;
GO 

-- Silver: Cleaned and standardized data
CREATE SCHEMA silver;
GO

-- Gold: Business-ready reporting and analytics layer
CREATE SCHEMA gold;
GO

PRINT 'Database [Revenue] and Schemas successfully created.';
