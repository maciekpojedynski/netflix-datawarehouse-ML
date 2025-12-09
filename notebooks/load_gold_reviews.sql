IF OBJECT_ID('gold.reviews','U') IS NOT NULL
	DROP TABLE gold.reviews;
CREATE TABLE gold.reviews(
	review_id NVARCHAR(14) NOT NULL PRIMARY KEY,
	user_id NVARCHAR(255),
	movie_id NVARCHAR(10),
	rating NVARCHAR(1),
	device_type NVARCHAR(255),
	review_date DATE,
	review_text NVARCHAR(255),
	sentiment NVARCHAR(255),
	sentiment_score DECIMAL(12,2),
	helpful_votes INT,
	total_votes INT,
	loaddate DATETIME DEFAULT GETDATE()
)
INSERT INTO gold.reviews(
	review_id,
	user_id,
	movie_id,
	rating,
	device_type,
	review_date,
	review_text,
	sentiment,
	sentiment_score,
	helpful_votes,
	total_votes
)
SELECT 
	review_id,
	user_id,
	movie_id,
	rating,
	device_type,
	review_date,
	review_text,
	sentiment,
	sentiment_score,
	helpful_votes,
	total_votes
FROM(
	SELECT 
		ROW_NUMBER() OVER(PARTITION BY review_id ORDER BY review_id) as licznik,
		review_id,
		user_id,
		movie_id,
		rating,
		device_type,
		CAST(review_date AS DATE) as review_date,
		review_text,
		sentiment,
		sentiment_score,
		helpful_votes,
		total_votes
	FROM silver.reviews
	WHERE sentiment IN('positive','negative','neutral') AND
	device_type IN('Tablet','Laptop','Mobile','Smart TV')
	)t
WHERE licznik = 1;
