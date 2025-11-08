IF OBJECT_ID('bronze.reviews','U') IS NOT NULL
	DROP TABLE bronze.reviews
CREATE TABLE bronze.reviews(
	review_id NVARCHAR(50),        
	user_id NVARCHAR(50),              
	movie_id NVARCHAR(50),            
	rating INT,              
	review_date NVARCHAR(50),          
	device_type NVARCHAR(50),          
	is_verified_watch NVARCHAR(50),      
	helpful_votes DECIMAL(15,2),       
	total_votes DECIMAL(15,2),         
	review_text NVARCHAR(50),          
	sentiment NVARCHAR(50),            
	sentiment_score DECIMAL(15,2)     
)
