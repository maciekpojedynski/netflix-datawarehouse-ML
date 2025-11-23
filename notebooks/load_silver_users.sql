TRUNCATE TABLE silver.users;
	BULK INSERT silver.users
	FROM 'C:\Users\Maciek\Desktop\netflixdb\script\silver\python\netflix_silver_layer_users.csv'
	WITH(
		FIRST_ROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
		);
