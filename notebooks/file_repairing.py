import pandas as pd
import re
import io

# Ścieżka do uszkodzonego pliku
file_path = r'databases/netflix_silver_layer_watch_history.csv' 

# 1. Wczytaj cały plik jako jeden surowy string
with open(file_path, 'r', encoding='utf-8') as f:
    raw_data = f.read()

# 2. Usuń niedrukowalne znaki kontrolne Unicode (np. BOM, ukryte spacje)
cleaned_data = re.sub(r'[\x00-\x08\x0B\x0C\x0E-\x1F\x7F]', '', raw_data) 

# 3. Wymuszenie standardowego terminatora wiersza
cleaned_data = cleaned_data.replace('\r\n', '\n').replace('\r', '\n')

# 4. Wczytaj oczyszczony string do DataFrame
df_watch_history = pd.read_csv(io.StringIO(cleaned_data), sep=',')

print(df_watch_history.head())

output_file_path = r'databases/netflix_silver_layer_watch_history_cleaned.csv'

df_watch_history.to_csv(
    output_file_path,
    index=False,
    sep=',',
    encoding='utf-8'
)