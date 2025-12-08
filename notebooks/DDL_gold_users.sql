IF OBJECT_ID('gold.users','U') IS NOT NULL
	DROP TABLE gold.users;
CREATE TABLE gold.users(
	user_id NVARCHAR(255),
	first_name NVARCHAR(255),
	last_name NVARCHAR(255),
	age INT,
	gender NVARCHAR(12),
	country NVARCHAR(40),
	state_province NVARCHAR(255),
	city NVARCHAR(255),
	email NVARCHAR(255),
	email_domain NVARCHAR(14),
	subscription_plan NVARCHAR(10),
	subscription_start_date DATE,
	primary_device NVARCHAR(255),
	monthly_spend DECIMAL(18,4),
	household_size INT,
	created_at_date DATE,
	created_at_time NVARCHAR(255),
	is_active NVARCHAR(255),
	is_age_missing BIT,
	is_gender_missing BIT,
	is_monthly_spend_missing BIT,
	is_household_size_missing BIT,
	LoadDate DATETIME DEFAULT GETDATE()
)
