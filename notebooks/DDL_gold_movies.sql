IF NOT EXISTS(SELECT 1 FROM sys.schemas WHERE name = 'gold')
	EXEC('Create schema gold');


IF OBJECT_ID('gold.movies','U') IS NOT NULL
	DROP TABLE gold.movies;
CREATE TABLE gold.movies(
	movie_id NVARCHAR(10) NOT NULL PRIMARY KEY,
	title NVARCHAR(255),
	content_type NVARCHAR(255),
	genre_primary NVARCHAR(255),
	genre_secondary NVARCHAR(255),
	language NVARCHAR(20),
	rating NVARCHAR(5),
	release_year INT,
	added_to_platform DATE,
	country_of_origin NVARCHAR(50),
	number_of_seasons INT,
	number_of_episodes INT,
	duration_minutes DECIMAL(7,3),
	imdb_rating DECIMAL(4,2),
	production_budget DECIMAL(14,2),
	box_office_revenue DECIMAL(14,2),
	is_netflix_original BIT,
	content_warning BIT,
	LoadDate DATETIME DEFAULT GETDATE()
);
