CREATE NONCLUSTERED INDEX NC_watchhistory_userid_duration
ON silver.watch_history (user_id ASC)
INCLUDE (watch_duration_minutes);
