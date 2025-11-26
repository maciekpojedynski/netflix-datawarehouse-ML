---Divide and Conquer table 'review' into 2 parts. One is dimensional another is fact table. 

IF OBJECT_ID('tempdb..#TestTable1')IS NOT NULL 
	DROP TABLE #TestTable1;
CREATE TABLE #TestTable1 (
	review_id NVARCHAR(255),
	rating INT,                 
	is_verified_watch INT,                  
	helpful_votes INT,                  
	total_votes INT,                
	sentiment_score DECIMAL(15,4),             
	is_helpful_votes_missing BIT,                         
	is_total_votes_missing BIT
)
BULK INSERT #TestTable1
FROM 'C:\Users\Maciek\Desktop\netflixdb\databases\netflix_silver_layer_test_numeric.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
	CODEPAGE = '65001',
	FIELDQUOTE = '"'
);

SELECT TOP(5) * FROM #TestTable1;

SELECT * FROM #TestTable1;
