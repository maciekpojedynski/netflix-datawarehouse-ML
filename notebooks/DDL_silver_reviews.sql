IF OBJECT_ID('silver.reviews','U') IS NOT NULL
	DROP TABLE silver.reviews;
CREATE TABLE silver.reviews(
	review_id NVARCHAR(255),
	user_id NVARCHAR(255),
	movie_id NVARCHAR(255),
	rating INT,
	review_date NVARCHAR(255),
	device_type NVARCHAR(255),
	is_verified_watch NVARCHAR(50),
	helpful_votes DECIMAL(15,2),
	total_votes DECIMAL(15,2),
	review_text NVARCHAR(255),
	sentiment NVARCHAR(255),
	sentiment_score DECIMAL(15,2),
	is_helpful_votes_missing INT,
	is_total_votes_missing INT
)
