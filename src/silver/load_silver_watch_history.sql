INSERT INTO silver.watch_history(
	licznik,
	session_id,
    user_id,
    movie_id,
    watch_date,
    device_type,
    watch_duration_minutes,
    progress_percentage,
    action,
    quality,
    location_country,
    is_dowload,
    user_rating,
    is_watch_duration_minutes_missing,
    is_progress_percentage_missing,
    is_user_rating_missing,
	watched_more_then_once
)
SELECT 
	ROW_NUMBER() OVER(PARTITION BY session_id ORDER BY session_id) as licznik,
	w.session_id,
	w.user_id,
	w.movie_id,
	w.watch_date,
	w.device_type,
	w.watch_duration_minutes,
	ROUND(w.watch_duration_minutes / m.duration_minutes,2)* 100 AS progress_percentage,
	w.action,
	w.quality,
	w.location_country,
	w.is_dowload,
	w.user_rating,
	w.is_watch_duration_minutes_missing,
	w.is_progress_percentage_missing,
	w.is_user_rating_missing,
	CASE 
		WHEN ROUND(w.watch_duration_minutes / m.duration_minutes,2)* 100 > 100 THEN 1
		ELSE 0
	END AS watched_more_then_once
FROM bronze.watch_history AS w
LEFT JOIN silver.movies AS m
ON w.movie_id = m.movie_id
WHERE m.duration_minutes != 0;
