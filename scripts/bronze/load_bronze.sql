CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @batchstart_time DATETIME, @batchend_time DATETIME, @start_time DATETIME, @end_time DATETIME;
	BEGIN TRY
		SET @batchstart_time = GETDATE();
		PRINT 'Loading Bronze Layer';
		PRINT '=================================';

		PRINT 'Loading CRM Tables';
		PRINT '---------------------------------';

		SET @start_time = GETDATE();
		PRINT'Truncating table: bronze.crm_customer_info';
		TRUNCATE TABLE bronze.crm_customer_info;
		PRINT'Insert data into: bronze.crm_customer_info';
		BULK INSERT bronze.crm_customer_info
		FROM '/var/opt/mssql/data/data/source_crm/cust_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT'LOAD DURATION: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
		PRINT '---------------------------------';

		SET @start_time = GETDATE();
		PRINT'Truncating table: bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info;
		PRINT'Insert data into: bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM '/var/opt/mssql/data/data/source_crm/prd_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT'LOAD DURATION: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
		PRINT '---------------------------------';

		SET @start_time = GETDATE();
		PRINT'Truncating table: bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details;
		PRINT'Insert data into: bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM '/var/opt/mssql/data/data/source_crm/sales_details.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT'LOAD DURATION: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
		PRINT '---------------------------------';

		PRINT 'Loading ERP Tables';
		PRINT '---------------------------------';

		SET @start_time = GETDATE();
		PRINT'Truncating table: bronze.erp_cust_az12';
		TRUNCATE TABLE bronze.erp_cust_az12;
		PRINT'Insert data into: bronze.erp_cust_az12';
		BULK INSERT bronze.erp_cust_az12
		FROM '/var/opt/mssql/data/data/source_erp/CUST_AZ12.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT'LOAD DURATION: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
		PRINT '---------------------------------';

		SET @start_time = GETDATE();
		PRINT'Truncating table: bronze.erp_loc_a101';
		TRUNCATE TABLE bronze.erp_loc_a101;
		PRINT'Insert data into: bronze.erp_loc_a101';
		BULK INSERT bronze.erp_loc_a101
		FROM '/var/opt/mssql/data/data/source_erp/LOC_A101.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT'LOAD DURATION: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
		PRINT '---------------------------------';

		SET @start_time = GETDATE();
		PRINT'Truncating table: bronze.erp_px_cat_g1v2';
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		PRINT'Insert data into: bronze.erp_px_cat_g1v2';
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM '/var/opt/mssql/data/data/source_erp/PX_CAT_G1V2.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT'LOAD DURATION: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
		PRINT '---------------------------------';

		SET @batchend_time = GETDATE();
		PRINT 'LOADING BRONZE LAYER COMPLETED';
		PRINT'LOAD DURATION FOR BRONZE LAYER: ' + CAST(DATEDIFF(second,@batchstart_time,@batchend_time) AS NVARCHAR) + ' seconds';
		PRINT '---------------------------------';

	END TRY
	BEGIN CATCH
		PRINT'Error occured during loading bronze layer';
		PRINT ERROR_MESSAGE();
	END CATCH
END