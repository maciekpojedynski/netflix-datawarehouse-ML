IF OBJECT_ID('silver.watch_history','U') IS NOT NULL
    DROP TABLE silver.watch_history;
CREATE TABLE silver.watch_history(
    session_id NVARCHAR(255),
    user_id NVARCHAR(255),
    movie_id NVARCHAR(255),
    watch_date DATE,
    device_type NVARCHAR(255),
    watch_duration_minutes DECIMAL(15,2),
    progress_percentage DECIMAL(15,4),
    action NVARCHAR(255),
    quality NVARCHAR(255),
    location_country NVARCHAR(255),
    is_dowload INT,
    user_rating DECIMAL(5,2),
    is_watch_duration_minutes_missing BIT,
    is_progress_percentage_missing BIT,
    is_user_rating_missing BIT,
	watched_more_then_once BIT
)
