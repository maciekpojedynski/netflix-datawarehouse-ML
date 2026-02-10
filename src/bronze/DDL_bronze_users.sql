IF OBJECT_ID('bronze.users','U') IS NOT NULL
	DROP TABLE bronze.users
CREATE TABLE bronze.users(
	user_id NVARCHAR(50),               
	email NVARCHAR(50),                       
	first_name NVARCHAR(50),               
	last_name NVARCHAR(50),                 
	age DECIMAL(15,2),                       
	gender NVARCHAR(50),                      
	country NVARCHAR(50),                     
	state_province NVARCHAR(50),              
	city NVARCHAR(50),                       
	subscription_plan NVARCHAR(50),          
	subscription_start_date NVARCHAR(50),   
	is_active NVARCHAR(50),                  
	monthly_spend DECIMAL(15,2),            
	primary_device NVARCHAR(50),             
	household_size DECIMAL(15,2),           
	created_at  NVARCHAR(50)               
)
