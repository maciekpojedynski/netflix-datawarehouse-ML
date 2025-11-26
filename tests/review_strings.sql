--- Divide and Conquer review. This part include only string columns

IF OBJECT_ID('tempdb..#TestTable')IS NOT NULL 
	DROP TABLE #TestTable;
CREATE TABLE #TestTable (
	review_id NVARCHAR(255),
	user_id NVARCHAR(255),
	movie_id NVARCHAR(255),
	review_text NVARCHAR(255),
	device_type NVARCHAR(255),
	sentiment NVARCHAR(255)
);

BULK INSERT #TestTable
FROM 'C:\Users\Maciek\Desktop\netflixdb\databases\netflix_silver_layer_test_string.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	CODEPAGE = '65001',
	FIELDQUOTE = '"'
);
