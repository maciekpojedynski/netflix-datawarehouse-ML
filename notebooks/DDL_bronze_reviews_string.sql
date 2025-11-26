IF OBJECT_ID('bronze.reviews_string')IS NOT NULL 
	DROP TABLE bronze.reviews_string;
CREATE TABLE bronze.reviews_string (
	review_id NVARCHAR(255),
	user_id NVARCHAR(255),
	movie_id NVARCHAR(255),
	review_text NVARCHAR(255),
	device_type NVARCHAR(255),
	sentiment NVARCHAR(255)
);
