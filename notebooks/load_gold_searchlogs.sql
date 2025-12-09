INSERT INTO gold.search_logs(
	search_id,
	user_id,
	device_type,
	search_query,
	search_duration_seconds,
	search_date,
	results_returned,
	had_typo,
	used_filters,
	location_country
)
SELECT
	search_id,
	user_id,
	device_type,
	search_query,
	search_duration_seconds,
	search_date,
	results_returned,
	CASE 
		WHEN had_typo = 'True' THEN 1
		ELSE 0
	END AS had_typo,
	CASE 
		WHEN used_filters = 'True' THEN 1
		ELSE 0
	END AS used_filters,
	CASE 
		WHEN location_country = 'USA' THEN 'United States'
		ELSE location_country
	END AS location_country
FROM silver.search_logs;
