IF OBJECT_ID('bronze.reviews_numeric')IS NOT NULL 
	DROP TABLE bronze.reviews_numeric;
CREATE TABLE bronze.reviews_numeric (
	review_id NVARCHAR(255),
	rating INT,                 
	is_verified_watch INT,                  
	helpful_votes INT,                  
	total_votes INT,                
	sentiment_score DECIMAL(15,4),             
	is_helpful_votes_missing BIT,                         
	is_total_votes_missing BIT,
	review_date DATE
)
