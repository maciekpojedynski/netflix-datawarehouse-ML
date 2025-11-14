IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'silver')
BEGIN
    EXEC('CREATE SCHEMA silver');
END
GO

IF OBJECT_ID('silver.movies','U') IS NOT NULL
    DROP TABLE silver.movies
CREATE TABLE silver.movies(
    movie_id NVARCHAR(255),
    title NVARCHAR(255),
    content_type NVARCHAR(255),
    genre_primary NVARCHAR(255),
    genre_secondary NVARCHAR(255),
    release_year INT,
    duration_minutes DECIMAL(15,2),
    rating NVARCHAR(255),
    language NVARCHAR(255),
    country_of_origin NVARCHAR(255),
    imdb_rating DECIMAL(18,2),
    production_budget DECIMAL(18,2),
    box_office_revenue DECIMAL(18,2),
    number_of_seasons INT,
    number_of_episodes INT,
    is_netflix_original NVARCHAR(255),
    added_to_platform NVARCHAR(255),
    content_warning NVARCHAR(255),
    is_imdb_rating_missing INT,
    is_production_budget_missing INT,
    is_box_office_revenue_missing INT
)
