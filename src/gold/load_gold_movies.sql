INSERT INTO gold.movies(
	movie_id,
	title,
	content_type,
	genre_primary,
	genre_secondary,
	language,
	rating,
	release_year,
	added_to_platform,
	country_of_origin,
	number_of_seasons,
	number_of_episodes,
	duration_minutes,
	imdb_rating,
	production_budget,
	box_office_revenue,
	is_netflix_original,
	content_warning
)
SELECT 
	movie_id,
	title,
	content_type,
	genre_primary,
	genre_secondary,
	language,
	rating,
	release_year,
	CAST(added_to_platform AS DATE),
	CASE
		WHEN country_of_origin = 'USA' THEN 'United States'
		WHEN country_of_origin = 'UK' THEN 'United Kingdom'
		ELSE country_of_origin
	END as country_of_origin,
	number_of_seasons,
	number_of_episodes,
	duration_minutes,
	imdb_rating,
	production_budget,
	box_office_revenue,
	is_netflix_original,
	content_warning
FROM silver.movies;
