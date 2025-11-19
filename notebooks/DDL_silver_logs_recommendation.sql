IF OBJECT_ID('silver.logs_recommendation','U') IS NOT NULL
	DROP TABLE silver.logs_recommendation;
CREATE TABLE silver.logs_recommendation(
	recommendation_id NVARCHAR(255),
	user_id NVARCHAR(255),
	movie_id NVARCHAR(255),
	recommendation_date NVARCHAR(255),
	recommendation_type NVARCHAR(255),
	recommendation_score DECIMAL(15,3),
	was_clicked NVARCHAR(50),
	position_in_list INT,
	device_type NVARCHAR(255),
	time_of_day NVARCHAR(255),
	algorithm_version NVARCHAR(255)
)
