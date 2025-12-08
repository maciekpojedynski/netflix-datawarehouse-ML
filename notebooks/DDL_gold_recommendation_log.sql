IF OBJECT_ID('gold.logs_recommendation','U') IS NOT NULL
	DROP TABLE gold.logs_recommendation;
CREATE TABLE gold.logs_recommendation(
	Logsrecommendationkey INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	recommendation_id NVARCHAR(255),
	user_id NVARCHAR(255),
	movie_id NVARCHAR(255),
	recommendation_type NVARCHAR(255),
	device_type NVARCHAR(255),
	recommendation_score DECIMAL(15,3),
	position_in_list INT,
	recommendation_date DATE,
	time_of_day NVARCHAR(255),
	was_clicked NVARCHAR(6),
	algorithm_version NVARCHAR(255),
	loaddate DATE DEFAULT GETDATE()
