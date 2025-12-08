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
	is_clicked_result_position_missing BIT,
	is_search_duration_seconds_missing BIT,
	loaddate DATETIME DEFAULT GETDATE()
)
