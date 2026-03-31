# 📊 Retail Intelligence & Customer LTV Pipeline
**Tech Stack:** Snowflake + dbt Cloud + GitHub + SQL (Snowflake Dialect)

## 🎯 Project Overview
I architected an end-to-end **ELT Pipeline** using the **Medallion Architecture** (Staging, Intermediate, Marts) to transform raw TPC-H retail data into actionable executive insights. The core objective was to move complex business logic—specifically **Customer Lifetime Value (LTV)**—out of ad-hoc queries and into a version-controlled, tested data model.

## 🏗 Data Architecture (The Medallion Approach)
* **Staging Layer (`stg_`):** Cleaned, casted, and renamed raw tables from Snowflake's sample data.
* **Intermediate Layer (`int_`):** Built the heavy-lifting logic to aggregate order frequency and calculate lifetime spend.
* **Marts Layer (`fct_`):** Created a "Gold" table that segments customers (Platinum, Gold, Standard) for direct use in BI tools like Tableau or Power BI.

## 🛡️ Data Quality & Governance
* **Automated Testing:** Deployed `unique` and `not_null` schema tests to ensure 100% integrity of primary keys.
* **Documentation:** Leveraged dbt's native documentation engine to create a searchable data dictionary.
* **Version Control:** Managed all transformations via Git, ensuring a full audit trail of logic changes.

## 🚀 Key Achievements
* Successfully transitioned "Example" boilerplate into a production-ready custom schema.
* Optimized Snowflake performance by materializing intermediate and mart layers as **Tables** rather than views.
* Developed a scalable framework that can handle millions of rows of transaction data.
