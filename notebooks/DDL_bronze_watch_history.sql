IF OBJECT_ID('bronze.watch_history','U') IS NOT NULL
	DROP TABLE bronze.watch_history
CREATE TABLE bronze.watch_history(
	session_id NVARCHAR(50),               
	user_id NVARCHAR(50),                 
	movie_id NVARCHAR(50),                 
	watch_date NVARCHAR(50),                
	device_type NVARCHAR(50),             
	watch_duration_minutes DECIMAL(15,2),  
	progress_percentage DECIMAL(15,2),     
	action NVARCHAR(50),                   
	quality NVARCHAR(50),                  
	location_country  NVARCHAR(50),         
	is_download  NVARCHAR(50),               
	user_rating DECIMAL(15,2)                    
)
