IF OBJECT_ID('bronze.search_logs','U') IS NOT NULL
	DROP TABLE bronze.search_logs
CREATE TABLE bronze.search_logs(
	search_id NVARCHAR(50),               
	user_id NVARCHAR(50),                    
	search_query NVARCHAR(50),               
	search_date NVARCHAR(50),               
	results_returned INT,        
	clicked_result_position DECIMAL(15,2),  
	device_type NVARCHAR(50),               
	search_duration_seconds DECIMAL(15,2),  
	had_typo NVARCHAR(50),                     
	used_filters NVARCHAR(50),                
	location_country NVARCHAR(50)   
)
