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
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'bronze')
BEGIN
    EXEC('CREATE SCHEMA bronze');
END
GO

IF OBJECT_ID('bronze.movies', 'U') IS NOT NULL
	DROP TABLE bronze.movies
CREATE TABLE bronze.movies (
	movie_id NVARCHAR(50),
	title NVARCHAR(50),
	content_type NVARCHAR(50),
	genre_primary NVARCHAR(50),
	release_year INT,
	duration_minutes DECIMAL(15,1),
	rating NVARCHAR(50),
	language NVARCHAR(50),
	country_of_origin NVARCHAR(50),
	imdb_rating DECIMAL(15,1),
	production_budget DECIMAL(15,1),
	box_office_revenue DECIMAL(15,1),
	number_of_seasons DECIMAL(15,1),
	number_of_episodes DECIMAL(15,1),
	is_netflix_original NVARCHAR(50),
	added_to_platform NVARCHAR(50),
	content_warning NVARCHAR(50)
)
