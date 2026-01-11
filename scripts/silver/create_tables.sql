USE DataWarehouse;

-- Drop and create silver.crm_customer_info
DROP TABLE IF EXISTS silver.crm_customer_info;
CREATE TABLE silver.crm_customer_info (
    cst_id              INT NULL,
    cst_key             VARCHAR(50) NULL,
    cst_firstname       VARCHAR(50) NULL,
    cst_lastname        VARCHAR(50) NULL,
    cst_marital_status  VARCHAR(50) NULL,
    cst_gndr            VARCHAR(50) NULL,
    cst_create_date     DATE NULL,
    dwh_create_date     DATETIME2 DEFAULT GETDATE()
);


-- Drop and create silver.crm_prd_info
DROP TABLE IF EXISTS silver.crm_prd_info;
CREATE TABLE silver.crm_prd_info (
    prd_id              INT NULL,
    prd_key             VARCHAR(50) NULL,
    prd_nm              VARCHAR(50) NULL,
    prd_cost            INT NULL,
    prd_line            VARCHAR(50) NULL,
    prd_start_dt        DATETIME NULL,
    prd_end_dt          DATETIME NULL,
    dwh_create_date     DATETIME2 DEFAULT GETDATE()
);


-- Drop and create silver.crm_sales_details
DROP TABLE IF EXISTS silver.crm_sales_details;
CREATE TABLE silver.crm_sales_details (
    sls_ord_num         VARCHAR(50) NULL,
    sls_prd_key         VARCHAR(50) NULL,
    sls_cust_id         INT NULL,
    sls_order_dt        INT NULL,
    sls_ship_dt         INT NULL,
    sls_due_dt          INT NULL,
    sls_sales           INT NULL,
    sls_quantity        INT NULL,
    sls_price           INT NULL,
    dwh_create_date     DATETIME2 DEFAULT GETDATE()
);


-- Drop and create silver.erp_loc_a101
DROP TABLE IF EXISTS silver.erp_loc_a101;
CREATE TABLE silver.erp_loc_a101 (
    cid                 VARCHAR(50) NULL,
    cntry               VARCHAR(50) NULL,
    dwh_create_date     DATETIME2 DEFAULT GETDATE()
);


-- Drop and create silver.erp_cust_az12
DROP TABLE IF EXISTS silver.erp_cust_az12;
CREATE TABLE silver.erp_cust_az12 (
    cid                 VARCHAR(50) NULL,
    bdate               DATE NULL,
    gen                 VARCHAR(50) NULL,
    dwh_create_date     DATETIME2 DEFAULT GETDATE()
);


-- Drop and create silver.erp_px_cat_g1v2
DROP TABLE IF EXISTS silver.erp_px_cat_g1v2;
CREATE TABLE silver.erp_px_cat_g1v2 (
    id                  VARCHAR(50) NULL,
    cat                 VARCHAR(50) NULL,
    subcat              VARCHAR(50) NULL,
    maintenance         VARCHAR(50) NULL,
    dwh_create_date     DATETIME2 DEFAULT GETDATE()
);