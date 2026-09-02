# dbt Practice Project Challenge

## Project goal

Build a small analytics layer for a fictional e-commerce business. The goal is to turn raw transaction and customer data into a few useful reporting tables that answer business questions.

You are not expected to build a production-grade system. The purpose is to practice the full dbt workflow: defining seeds, creating sources, building staging models, adding tests, and shaping a final reporting layer.

---

## Business context

You work for a small online retailer that wants to understand:

- which customers are most valuable
- which products generate the most revenue
- which order channels perform best
- which customers return products most often
- how sales trends change over time

---

## Suggested data sources

You will imagine the following upstream sources:

1. Customers
   - customer_id
   - name
   - signup_date
   - country
   - segment

2. Orders
   - order_id
   - customer_id
   - order_date
   - order_status
   - channel

3. Order items
   - order_id
   - product_id
   - quantity
   - unit_price

4. Products
   - product_id
   - product_name
   - category
   - price

5. Payments
   - payment_id
   - order_id
   - payment_date
   - amount
   - payment_method

6. Returns
   - return_id
   - order_id
   - return_date
   - reason

---

## What you should define yourself

You should create or design the following pieces in your dbt project:

### 1. Seeds
Create small CSV files for the sources above. Keep them small and realistic, for example 20–50 rows each.

Suggested seed files:

- seeds/customers.csv
- seeds/products.csv
- seeds/orders.csv
- seeds/order_items.csv
- seeds/payments.csv
- seeds/returns.csv

### 2. Sources
Create source declarations that describe the upstream data you are using.

### 3. Staging models
Create staging models for each source, for example:

- stg_customers.sql
- stg_orders.sql
- stg_order_items.sql
- stg_products.sql
- stg_payments.sql
- stg_returns.sql

The staging layer should do light cleaning and standardization, such as:

- trimming whitespace
- standardizing date formats
- converting status values to lowercase or consistent casing
- renaming columns to business-friendly names

### 4. Intermediate models
Create one or two intermediate models that combine the staging data, for example:

- int_orders_enriched.sql
- int_customer_order_summary.sql

### 5. Marts
Create one or two final reporting models, for example:

- mart_daily_sales.sql
- mart_customer_summary.sql
- mart_product_performance.sql

---

## Suggested business logic

You can model the following concepts:

- total revenue per order
- revenue per day
- revenue per product category
- repeat customers
- return rate by customer or product
- sales by channel

---

## Tests to include

Add basic tests that make the project feel realistic:

- uniqueness on primary keys
- not null on important fields
- relationship tests between orders and customers
- accepted values for order status or payment method

---

## Deliverables

By the end of the project, you should be able to answer questions like:

- Which customer segment generates the most revenue?
- Which product category sells best?
- Which channel has the highest conversion or the highest return rate?
- Which day or month had the strongest sales performance?

---

## Recommended learning flow

1. Define the seed data.
2. Create source definitions.
3. Build staging models.
4. Add tests.
5. Build intermediate models.
6. Build one or two marts.
7. Review the lineage and explain how the data flows.

This is a good project because it is small enough to manage, but rich enough to teach the core dbt patterns you want to learn.
