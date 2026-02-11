# 📊 SQL Data Warehouse Project  

An end-to-end **Data Warehouse implementation** showcasing data modeling, ETL pipelines, and analytical querying.  
This project demonstrates how raw data is transformed into meaningful business insights.  
*(Detailed project documentation is available on [Notion](https://www.notion.so/SQL-Data-Warehouse-Project-2786f2c67aeb801d9aa0e464b9d520b0?source=copy_link))*  

---

## 🚀 Features
- ✅ Star schema design for data warehousing  
- ✅ ETL scripts for data ingestion and transformation  
- ✅ Fact and dimension tables for business insights  
- ✅ Analytical SQL queries for reporting  

---

## 🏗️ Architecture
![Architecture](./images/architecture.png)  
*ETL flow: Raw Data → Staging → Transformation → Data Warehouse → BI Tools*  

---

## 🔑 Schema Design (Star Schema)
- **Fact Table:** `fact_sales`  
- **Dimension Tables:**  
  - `dim_customer`  
  - `dim_product`  
  - `dim_time`  
  - `dim_region`  

![ER Diagram](./images/er_diagram.png)  
*Star schema connecting fact and dimension tables*  

---

## 🔄 ETL Process
1. Load raw data into staging tables  
2. Clean, transform, and standardize the data  
3. Load into fact and dimension tables  

---

## 📊 Sample Queries
```sql
-- Top 5 products by revenue
SELECT p.product_name, SUM(s.sales_amount) AS total_revenue
FROM fact_sales s
JOIN dim_product p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 5;
