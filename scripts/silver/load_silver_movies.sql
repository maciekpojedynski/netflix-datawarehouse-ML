TRUNCATE TABLE silver.movies;
BULK INSERT silver.movies
	 FROM 'C:\Users\Maciek\Desktop\netflixdb\script\silver\python\netflix_silver_layer_movies.csv'
	 WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
