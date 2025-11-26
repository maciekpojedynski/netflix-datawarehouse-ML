CREATE NONCLUSTERED INDEX NC_watchhistory_userid_duration
ON silver.watch_history (user_id ASC)
INCLUDE (watch_duration_minutes);

CREATE NONCLUSTERED INDEX NC_reviews_reviewid
ON bronze.reviews_numeric (review_id ASC);

CREATE NONCLUSTERED INDEX NC_reviews_reviewid_string
ON bronze.reviews_string (review_id, user_id ASC)
