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
