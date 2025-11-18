TRUNCATE TABLE silver.reviews;

BULK INSERT silver.reviews
     FROM 'C:\Users\Maciek\Desktop\netflixdb\script\silver\python\netflix_silver_layer_reviews.csv'
     WITH (
                 FIRSTROW = 2,
                 FIELDTERMINATOR = ',',
                 ROWTERMINATOR = '0x0d0a', 
                 TABLOCK,
                 -- DODAJEMY: Ścieżka do pliku, gdzie trafią błędy
                 ERRORFILE = 'C:\Users\Maciek\Desktop\netflixdb\script\silver\python\error_log_reviews.txt',
                 MAXERRORS = 500 -- Zwiększamy, aby załadować większość danych
             );
