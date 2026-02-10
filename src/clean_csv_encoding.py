import pandas as pd
import re
import io
import os
import logging
import sys 

# Konfiguracja logowania
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

def clean_netflix_data(input_path, output_path):
    """
    Wczytuje plik z input_path, czyści i zapisuje do output_path.
    """
    if not os.path.exists(input_path):
        logging.error(f"Plik wejściowy nie istnieje: {input_path}")
        return

    try:
        logging.info(f"Otwieram plik: {input_path}")
        
        with open(input_path, 'r', encoding='utf-8') as file:
            content = file.read()
        
        logging.info("Usuwanie niewidzialnych znaków...")
        cleaned_data = re.sub(r'[\x00-\x08\x0B\x0C\x0E-\x1F\x7F]', '', content)
        cleaned_data = cleaned_data.replace('\r\n', '\n').replace('\r', '\n')

        # Ładowanie do DataFrame
        df = pd.read_csv(io.StringIO(cleaned_data))
        
        # Zapisywanie wyniku
        df.to_csv(output_path, index=False, encoding='utf-8')
        logging.info(f"SUKCES! Wyczyszczony plik zapisano jako: {output_path}")

    except Exception as e: 
        logging.error(f"Wystąpił niespodziewany błąd: {e}")


if __name__ == "__main__":
    
    # Sprawdzamy, czy użytkownik podał nazwę pliku
    if len(sys.argv) < 2:
        print("BŁĄD: Nie podałeś nazwy pliku!")
        print("Użycie: python clean_csv_encoding.py <nazwa_pliku.csv>")
    else:
        filename = sys.argv[1]  # Pobieramy to, co wpisałeś po spacji
        
        # Budujemy ścieżki
        # Zakładamy, że szukamy w data/bronze, a zapisujemy w data/silver
        input_file = os.path.join("..", "data", "bronze", filename)
        output_file = os.path.join("..", "data", "silver", f"cleaned_{filename}")
        
        clean_netflix_data(input_file, output_file)