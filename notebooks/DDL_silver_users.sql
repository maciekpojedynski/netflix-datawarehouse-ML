IF OBJECT_ID('silver.users','U') IS NOT NULL
	DROP TABLE silver.users;
CREATE TABLE silver.users(
	user_id NVARCHAR(255),
	email NVARCHAR(255),
	first_name NVARCHAR(255),
	last_name NVARCHAR(255),
	age INT,
	gender NVARCHAR(255),
	country NVARCHAR(255),
	state_province NVARCHAR(255),
	city NVARCHAR(255),
	subscription_plan NVARCHAR(255),
	subscription_start_date NVARCHAR(255),
	is_active NVARCHAR(255),
	monthly_spend DECIMAL(18,4),
	primary_device NVARCHAR(255),
	household_size INT,
	created_at NVARCHAR(255),
	email_domain NVARCHAR(255),
	is_age_missing INT,      
    is_gender_missing INT, 
    is_monthly_spend_missing INT, 
    is_household_size_missing INT
)
