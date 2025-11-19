TRUNCATE TABLE silver.search_logs;
BULK INSERT silver.search_logs
	FROM 'C:\Users\Maciek\Desktop\netflixdb\script\silver\python\netflix_silver_layer_search_logs.csv'
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);
