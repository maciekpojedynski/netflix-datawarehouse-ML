INSERT INTO gold.reviews(
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
	review_id,
	user_id,
	movie_id,
	rating,
	device_type,
	CAST(review_date AS DATE),
	review_text,
	sentiment,
	sentiment_score,
	helpful_votes,
	total_votes,
	is_helpful_votes_missing,
	is_total_votes_missing,
	is_verified_watch
FROM silver.reviews
WHERE sentiment IN('positive','negative','neutral') AND
device_type IN('Tablet','Laptop','Mobile','Smart TV');
