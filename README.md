# 📊 Retail Intelligence & Customer LTV Pipeline
**Tech Stack:** Snowflake + dbt Cloud + GitHub + SQL (Snowflake Dialect)

## 🎯 Project Overview
I architected an end-to-end **ELT Pipeline** using the **Medallion Architecture** (Staging, Intermediate, Marts) to transform raw TPC-H retail data into actionable executive insights. The core objective was to move complex business logic—specifically **Customer Lifetime Value (LTV)**—out of ad-hoc queries and into a version-controlled, tested data model.

## 🏗 Data Architecture (The Medallion Approach)
* **Staging Layer (`stg_`):** Here, I cast the raw data types and renamed columns to follow a consistent naming convention (e.g., order_date instead of o_orderdate). This creates a clean "Source of Truth.".
* **Intermediate Layer (`int_`):** This is where the heavy lifting happens. I joined orders and customers to calculate LTV and Average Order Value. By doing this here, I ensure the math is only calculated once, saving Snowflake compute costs.
* **Marts Layer (`fct_`):** The final output. This table is "Wide and Flat," meaning it’s ready to be plugged into Tableau or Power BI without needing any further joins or complex formulas.

## 🛡️ Data Quality & Governance
* **Automated Testing:** Deployed `unique` and `not_null` schema tests to ensure 100% integrity of primary keys.
* **Documentation:** Leveraged dbt's native documentation engine to create a searchable data dictionary.
* **Version Control:** Managed all transformations via Git, ensuring a full audit trail of logic changes.

## 🚀 Key Achievements
* Successfully transitioned "Example" boilerplate into a production-ready custom schema.
* Optimized Snowflake performance by materializing intermediate and mart layers as **Tables** rather than views.
* Developed a scalable framework that can handle millions of rows of transaction data.
