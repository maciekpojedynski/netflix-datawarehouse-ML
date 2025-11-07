/*
================================================================
Create Database and Schemas
================================================================
Script purpose:
  Creates schema for bronze layer in medallion architecture.
  This layer serves as an immutable, audit-ready copy of the source system
  data using a Full load approach for easy debugging and data lineage tracking.
Warning:
  Tables are truncated and reloaded fully with each run.
  To avoid data conversion errors, data types are deliberately kept wide (e.g. NVARCHAR).
*/
IF OBJECT_ID('recommendation_logs', 'U') IS NOT NULL
	DROP TABLE bronze.recommendation_logs
CREATE TABLE bronze.recommendation_logs (
	recommendation_id NVARCHAR(50),
	user_id NVARCHAR(50),                 
	movie_id NVARCHAR(50),                
	recommendation_date NVARCHAR(50),     
	recommendation_type  NVARCHAR(50),    
	recommendation_score DECIMAL(15,2),   
	was_clicked NVARCHAR(50),               
	position_in_list NVARCHAR(50),         
	device_type NVARCHAR(50),             
	time_of_day NVARCHAR(50),             
	algorithm_version NVARCHAR(50)
)
