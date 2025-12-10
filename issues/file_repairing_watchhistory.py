import pandas as pd
import re
import io

# Damaged file path
file_path = r'databases/netflix_silver_layer_watch_history.csv' 

# 1. Loading data as one string
with open(file_path, 'r', encoding='utf-8') as f:
    raw_data = f.read()

# 2. Deleting invisibale chars 
cleaned_data = re.sub(r'[\x00-\x08\x0B\x0C\x0E-\x1F\x7F]', '', raw_data) 

# 3. Standard terminator
cleaned_data = cleaned_data.replace('\r\n', '\n').replace('\r', '\n')

# 4. Load data into df
df_watch_history = pd.read_csv(io.StringIO(cleaned_data), sep=',')

print(df_watch_history.head())

output_file_path = r'databases/netflix_silver_layer_watch_history_cleaned.csv'

df_watch_history.to_csv(
    output_file_path,
    index=False,
    sep=',',
    encoding='utf-8'

)
