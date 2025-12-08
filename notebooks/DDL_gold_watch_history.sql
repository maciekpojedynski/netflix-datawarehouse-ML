IF OBJECT_ID('gold.watch_history','U') IS NOT NULL
	DROP TABLE gold.watch_history;
CREATE TABLE gold.watch_history(
	sessionkey INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	session_id NVARCHAR(255),
	user_id NVARCHAR(255),
	movie_id NVARCHAR(255),
	device_type NVARCHAR(255),
	location_country NVARCHAR(255),
	quality NVARCHAR(255),
	action NVARCHAR(255),
	watch_duration_minutes DECIMAL(15,2),
	progress_percentage INT,
	user_rating INT,
	watched_more_then_once BIT,
	is_download BIT,
	is_progress_percentage_missing BIT,
	is_user_rating_missing BIT,
	is_watch_duration_minutes_missing BIT,
	loaddate DATE DEFAULT GETDATE()
)
