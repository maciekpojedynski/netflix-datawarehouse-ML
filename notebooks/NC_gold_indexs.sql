CREATE NONCLUSTERED INDEX NC_DimMovie_MovieID ON gold.movies (movie_id ASC);
CREATE NONCLUSTERED INDEX NC_DimUsers_user_id ON gold.users (user_id ASC);
CREATE NONCLUSTERED INDEX NC_DimReviews_review_id ON gold.reviews (review_id ASC);
CREATE NONCLUSTERED INDEX NC_gold_FactSearchLogs ON gold.search_logs (search_id ASC);
CREATE NONCLUSTERED INDEX nc_fact_watch_history ON gold.watch_history (session_id ASC);
CREATE NONCLUSTERED INDEX nc_fact_logs_recommendation ON gold.logs_recommendation (recommendation_id ASC);
