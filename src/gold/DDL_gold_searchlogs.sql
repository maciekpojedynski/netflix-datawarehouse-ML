IF OBJECT_ID('gold.search_logs') IS NOT NULL
	DROP TABLE gold.search_logs;
CREATE TABLE gold.search_logs(
	search_id NVARCHAR(14) NOT NULL PRIMARY KEY,
	user_id NVARCHAR(255),
	device_type NVARCHAR(255),
	search_query NVARCHAR(255),
	search_duration_seconds DECIMAL(15,2),
	search_date DATE,
	results_returned INT,
	had_typo BIT,
	used_filters BIT,
	location_country NVARCHAR(255),
	loaddate DATETIME DEFAULT GETDATE()
)
