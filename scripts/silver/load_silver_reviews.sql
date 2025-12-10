INSERT INTO silver.reviews(
	review_id,
	user_id,
	movie_id,
	rating,
	device_type,
	review_date,
	review_text,
	sentiment,
	sentiment_score,
	helpful_votes,
	total_votes,
	is_helpful_votes_missing,
	is_total_votes_missing,
	is_verified_watch
)
SELECT 
	s.review_id,
	s.user_id,
	s.movie_id,
	n.rating,
	s.device_type,
	n.review_date,
	s.review_text,
	s.sentiment,
	n.sentiment_score,
	n.helpful_votes,
	n.total_votes,
	n.is_helpful_votes_missing,
	n.is_total_votes_missing,
	n.is_verified_watch
FROM bronze.reviews_string AS s
INNER JOIN bronze.reviews_numeric AS n
ON s.review_id = n.review_id
