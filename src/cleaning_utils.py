import logging
from typing import Optional

# Konfiguracja loggera dla tego konkretnego pliku
logger = logging.getLogger(__name__)

def standardize_country(country_name: str) -> str:
    """
    Czyści nazwę kraju, usuwając spacje i zamieniając na małe litery.
    Np. " Poland" -> "poland"
    """
    if not isinstance(country_name, str):
        return ""
    
    clean_name = country_name.strip().lower()
    return clean_name

def convert_duration_to_int(duration_str: str) -> Optional[int]:
    """
    Zamienia tekst '90 min' na liczbę 90.
    """
    if not isinstance(duration_str, str):
        return None

    try:
        
        clean_str = duration_str.replace("min", "").strip()
        
        minutes = int(clean_str)
        return minutes
        
    except ValueError:

        logger.warning(f"Nie można przekonwertować '{duration_str}' na liczbę. Zwracam None.")
        return None