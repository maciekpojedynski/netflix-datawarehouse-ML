INSERT INTO gold.watch_history(
	session_id,
	user_id,
	movie_id,
	device_type,
	location_country,
	quality,
	action,
	watch_duration_minutes,
	progress_percentage,
	user_rating,
	watched_more_then_once,
	is_download,
	is_progress_percentage_missing,
	is_user_rating_missing,
	is_watch_duration_minutes_missing
)
SELECT 
	session_id,
	user_id,
	movie_id,
	device_type,
	CASE 
		WHEN location_country = 'USA' THEN 'United States'
		ELSE location_country
	END AS location_country,
	quality,
	action,
	watch_duration_minutes,
	CAST(SUBSTRING(CAST(progress_percentage AS NVARCHAR),1,LEN(progress_percentage)-5) AS INT),
	CAST(user_rating AS INT),
	watched_more_then_once,
	is_dowload AS is_download,
	is_progress_percentage_missing,
	is_user_rating_missing,
	is_watch_duration_minutes_missing
FROM silver.watch_history
WHERE licznik = 1;
