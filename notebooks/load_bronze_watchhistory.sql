TRUNCATE TABLE bronze.watch_history;
	BULK INSERT bronze.watch_history
	FROM 'C:\Users\Maciek\Desktop\netflixdb\databases\netflix_silver_layer_watch_history_cleaned.csv'
	WITH(
		FIRST_ROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);
