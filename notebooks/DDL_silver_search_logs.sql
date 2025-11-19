IF OBJECT_ID('silver.search_logs','U') IS NOT NULL
	DROP TABLE silver.search_logs;
CREATE TABLE silver.search_logs(
	search_id NVARCHAR(255),
	user_id NVARCHAR(255),
	search_query NVARCHAR(255),
	search_date DATE,
	results_returned INT,
	clicked_result_position INT,
	device_type NVARCHAR(255),
	search_duration_seconds DECIMAL(15,4),
	had_typo NVARCHAR(255),
	used_filters NVARCHAR(255),
	location_country NVARCHAR(255),
	is_clicked_result_position_missing INT,
	is_search_duration_seconds_missing INT
)
