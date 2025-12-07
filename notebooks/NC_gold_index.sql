CREATE NONCLUSTERED INDEX NC_DimMovie_MovieID ON gold.movies (movie_id ASC);
CREATE NONCLUSTERED INDEX NC_DimUsers_user_id ON gold.users (user_id ASC);
CREATE NONCLUSTERED INDEX NC_DimReviews_review_id ON gold.reviews (review_id ASC);
