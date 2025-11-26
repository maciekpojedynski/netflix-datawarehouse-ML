BULK INSERT bronze.reviews_string
FROM 'C:\Users\Maciek\Desktop\netflixdb\databases\netflix_silver_layer_test_string.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	CODEPAGE = '65001',
	FIELDQUOTE = '"'
);
