# **📚 Słownik Danych: Warstwa Złota (Gold Layer)**

Ten dokument opisuje strukturę tabel i kolumn w Warstwie Złotej Hurtowni Danych Netflix. Model oparty jest na **Schemacie Gwiazdy**, zawierającym tabele wymiarów (dim) oraz tabele faktów (fact).

## **1\. Tabela Wymiarów: gold.dim\_movies**

Przechowuje statyczne informacje o filmach i serialach dostępnych na platformie.

| Kolumna | Typ (Sugerowany) | Opis |
| :---- | :---- | :---- |
| **movie\_id** (PK) | NVARCHAR(50) | Unikalny identyfikator filmu/serialu. Klucz główny. |
| title | NVARCHAR(255) | Tytuł filmu lub serialu. |
| content\_type | NVARCHAR(50) | Typ treści (np. 'Movie', 'TV Show', 'Documentary'). |
| genre\_primary | NVARCHAR(50) | Główny gatunek (np. 'Action'). |
| genre\_secondary | NVARCHAR(50) | Podgatunek lub drugi gatunek. |
| language | NVARCHAR(50) | Główny język audio. |
| rating | NVARCHAR(10) | Kategoria wiekowa (np. 'PG-13', 'TV-MA'). |
| release\_year | INT | Rok wydania produkcji. |
| added\_to\_platform | DATE | Data dodania tytułu do biblioteki platformy. |
| country\_of\_origin | NVARCHAR(50) | Kraj produkcji. |
| number\_of\_seasons | INT | Liczba sezonów (dla seriali). Wypełnione '1' dla filmów. |
| number\_of\_episodes | INT | Liczba odcinków (dla seriali). Wypełnione '1' dla filmów. |
| duration\_minutes | FLOAT | Czas trwania w minutach. |
| imdb\_rating | DECIMAL(3,1) | Ocena z serwisu IMDb. |
| production\_budget | DECIMAL(18,2) | Budżet produkcji (USD). |
| box\_office\_revenue | DECIMAL(18,2) | Przychód z Box Office (USD). |
| is\_netflix\_original | BIT | Flaga: 1 \= Produkcja oryginalna Netflix, 0 \= Licencja. |
| content\_warning | BIT | Flaga: 1 \= Treść zawiera ostrzeżenia (np. przemoc), 0 \= Brak. |

## **2\. Tabela Wymiarów: gold.dim\_users**

Przechowuje informacje demograficzne i subskrypcyjne o użytkownikach.

| Kolumna | Typ (Sugerowany) | Opis |
| :---- | :---- | :---- |
| **user\_id** (PK) | NVARCHAR(50) | Unikalny identyfikator użytkownika. Klucz główny. |
| first\_name | NVARCHAR(100) | Imię użytkownika. |
| last\_name | NVARCHAR(100) | Nazwisko użytkownika. |
| age | INT | Wiek użytkownika. |
| gender | NVARCHAR(20) | Płeć użytkownika. |
| country | NVARCHAR(50) | Kraj zamieszkania. |
| state\_province | NVARCHAR(100) | Stan lub województwo. |
| city | NVARCHAR(100) | Miasto. |
| email | NVARCHAR(255) | Adres email. |
| email\_domain | NVARCHAR(100) | Domena adresu email (wyciągnięta z emaila). |
| subscription\_plan | NVARCHAR(50) | Typ planu (np. 'Basic', 'Premium'). |
| subscription\_start\_date | DATE | Data rozpoczęcia subskrypcji. |
| primary\_device | NVARCHAR(50) | Urządzenie najczęściej używane przez użytkownika. |
| monthly\_spend | DECIMAL(10,2) | Miesięczny koszt subskrypcji. |
| household\_size | INT | Wielkość gospodarstwa domowego. |
| created\_at\_date | DATE | Data utworzenia konta. |
| created\_at\_time | TIME | Czas utworzenia konta. |
| is\_active | BIT | Flaga: 1 \= Konto aktywne, 0 \= Nieaktywne. |
| is\_age\_missing | BIT | Flaga DQ: 1 \= Wiek był imputowany. |
| is\_gender\_missing | BIT | Flaga DQ: 1 \= Płeć była imputowana. |
| is\_monthly\_spend\_missing | BIT | Flaga DQ: 1 \= Wydatki były imputowane. |
| is\_household\_size\_missing | BIT | Flaga DQ: 1 \= Wielkość gosp. była imputowana. |
| LoadDate | DATETIME | Data załadowania rekordu do DWH. |

## **3\. Tabela Faktów: gold.fact\_reviews**

Rejestruje recenzje i oceny wystawione przez użytkowników filmom.

| Kolumna | Typ (Sugerowany) | Opis |
| :---- | :---- | :---- |
| **review\_id** (PK) | NVARCHAR(50) | Unikalny identyfikator recenzji. |
| user\_id (FK) | NVARCHAR(50) | Klucz obcy do dim\_users. |
| movie\_id (FK) | NVARCHAR(50) | Klucz obcy do dim\_movies. |
| rating | INT | Ocena użytkownika (np. 1-10 lub 1-5). |
| device\_type | NVARCHAR(50) | Urządzenie użyte do napisania recenzji. |
| review\_date | DATE | Data wystawienia recenzji. |
| review\_text | NVARCHAR(MAX) | Treść komentarza. |
| sentiment | NVARCHAR(20) | Kategoria sentymentu (Positive/Neutral/Negative). |
| sentiment\_score | DECIMAL(10,6) | Wynik numeryczny analizy sentymentu. |
| helpful\_votes | INT | Liczba głosów uznających recenzję za pomocną. |
| total\_votes | INT | Łączna liczba głosów oddanych na recenzję. |
| is\_helpful\_votes\_missing | BIT | Flaga DQ: 1 \= Głosy pomocne były imputowane. |
| is\_total\_votes\_missing | BIT | Flaga DQ: 1 \= Głosy łączne były imputowane. |
| is\_verified\_watch | BIT | Flaga: 1 \= Użytkownik zweryfikowany (obejrzał film). |
| LoadDate | DATETIME | Data załadowania rekordu. |

## **4\. Tabela Faktów: gold.fact\_watch\_history**

Rejestruje sesje oglądania (playback sessions).

| Kolumna | Typ (Sugerowany) | Opis |
| :---- | :---- | :---- |
| **session\_id** (PK) | NVARCHAR(50) | Unikalny identyfikator sesji oglądania. |
| user\_id (FK) | NVARCHAR(50) | Klucz obcy do dim\_users. |
| movie\_id (FK) | NVARCHAR(50) | Klucz obcy do dim\_movies. |
| device\_type | NVARCHAR(50) | Urządzenie użyte do oglądania. |
| location\_country | NVARCHAR(50) | Kraj, z którego nastąpiło połączenie. |
| quality | NVARCHAR(20) | Jakość streamingu (np. 4K, HD). |
| action | NVARCHAR(50) | Akcja końcowa (np. 'Completed', 'Paused', 'Stopped'). |
| watch\_duration\_minutes | FLOAT | Czas oglądania w danej sesji (minuty). |
| progress\_percentage | DECIMAL(5,2) | Procent obejrzenia filmu/odcinka. |
| user\_rating | NVARCHAR(20) | Ocena wystawiona po seansie (z imputacji krzyżowej). |
| watched\_more\_then\_once | BIT | Flaga: 1 \= Użytkownik obejrzał to ponownie. |
| is\_download | BIT | Flaga: 1 \= Oglądano w trybie offline (pobranym). |
| is\_progress\_percentage\_missing | BIT | Flaga DQ. |
| is\_user\_rating\_missing | BIT | Flaga DQ. |
| is\_watch\_duration\_minutes\_missing | BIT | Flaga DQ. |
| LoadDate | DATETIME | Data załadowania rekordu. |

## **5\. Tabela Faktów: gold.fact\_recommendation\_logs**

Rejestruje rekomendacje wyświetlone użytkownikom przez algorytm.

| Kolumna | Typ (Sugerowany) | Opis |
| :---- | :---- | :---- |
| **recommendation\_id** (PK) | NVARCHAR(50) | Unikalny identyfikator zdarzenia rekomendacji. |
| user\_id (FK) | NVARCHAR(50) | Klucz obcy do dim\_users. |
| movie\_id (FK) | NVARCHAR(50) | Klucz obcy do dim\_movies. |
| recommendation\_type | NVARCHAR(50) | Typ rekomendacji (np. 'Top Picks', 'Because you watched'). |
| device\_type | NVARCHAR(50) | Urządzenie wyświetlające rekomendację. |
| recommendation\_score | DECIMAL(10,6) | Wynik pewności algorytmu (match score). |
| position\_in\_list | INT | Pozycja filmu na liście rekomendowanej (ranga). |
| recommendation\_date | DATE | Data wygenerowania rekomendacji. |
| time\_of\_day | NVARCHAR(20) | Pora dnia (Rano, Popołudnie, Wieczór). |
| was\_clicked | BIT | Flaga (Target): 1 \= Użytkownik kliknął w rekomendację. |
| algorithm\_version | NVARCHAR(50) | Wersja modelu ML generującego rekomendację. |
| loaddate | DATETIME | Data załadowania rekordu. |

## **6\. Tabela Faktów: gold.fact\_search\_logs**

Rejestruje zapytania wyszukiwania wpisywane przez użytkowników.

| Kolumna | Typ (Sugerowany) | Opis |
| :---- | :---- | :---- |
| **search\_id** (PK) | NVARCHAR(50) | Unikalny identyfikator wyszukiwania. |
| user\_id (FK) | NVARCHAR(50) | Klucz obcy do dim\_users. |
| device\_type | NVARCHAR(50) | Urządzenie użyte do wyszukiwania. |
| search\_query | NVARCHAR(255) | Tekst wpisany przez użytkownika. |
| search\_duration\_seconds | FLOAT | Czas trwania sesji wyszukiwania. |
| search\_date | DATE | Data wyszukiwania. |
| results\_returned | INT | Liczba zwróconych wyników. |
| had\_typo | BIT | Flaga: 1 \= Wykryto literówkę w zapytaniu. |
| used\_filters | BIT | Flaga: 1 \= Użyto filtrów (np. gatunek, rok). |
| location\_country | NVARCHAR(50) | Lokalizacja użytkownika podczas wyszukiwania. |

