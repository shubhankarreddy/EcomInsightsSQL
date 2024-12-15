-- create database ecommerce_db
CREATE DATABASE ecommerce_db;

-- use database ecommerce_db
USE ecommerce_db;


-- Creating Tables

-- 01 Products Table

CREATE TABLE products
(
    product_id         INT PRIMARY KEY,
    product_name       VARCHAR(100),
    category           VARCHAR(50),
    sub_category       VARCHAR(50),
    brand              VARCHAR(50),
    base_price         DECIMAL(10, 2),
    manufacturing_cost DECIMAL(10, 2),
    warranty_months    INT
);

-- 02 Suppliers Table

CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100),
    country VARCHAR(50),
    reliability_score DECIMAL(3, 2),
    lead_time_days INT,
    annual_supply_volume INT
);

-- 03 Inventory Table

CREATE TABLE inventory
(
    inventory_id       INT PRIMARY KEY,
    product_id         INT,
    supplier_id        INT,
    current_stock      INT,
    reorder_level      INT,
    last_restock_date  DATE,
    warehouse_location VARCHAR(100),
    FOREIGN KEY (product_id) REFERENCES products (product_id),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers (supplier_id)
);

-- 04 Sales Table

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    sale_date DATE,
    quantity_sold INT,
    total_sale_amount DECIMAL(10, 2),
    customer_region VARCHAR(50),
    discount_applied DECIMAL(5, 2),
    shipping_cost DECIMAL(10, 2),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- 04 Shipping Routes Table

CREATE TABLE shipping_routes(
    route_id INT PRIMARY KEY,
    origin_warehouse VARCHAR(100),
    destination_region VARCHAR(100),
    average_delivery_time INT,
    shipping_cost_per_unit DECIMAL (10, 2),
    carbon_footprint_kg DECIMAL (10, 2)
);