TRUNCATE TABLE silver.logs_recommendation;
	BULK INSERT silver.logs_recommendation
	FROM 'C:\Users\Maciek\Desktop\netflixdb\script\silver\python\netflix_silver_layer_recomm_logs.csv'
	WITH(
		FIRST_ROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);
