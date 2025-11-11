. ⚙️ Data Engineering (Inżynieria Danych)

Ten etap koncentruje się na budowaniu niezawodnego i skalowalnego potoku danych.

Warstwa Brązowa (Bronze Layer) - Status: W Trakcie

    Cel: Surowe, niezmienione dane wejściowe.

    Zadania:

        Załadowanie Danych: Wczytanie plików CSV/JSON/innych (np. danych o filmach, użytkownikach, interakcjach) do surowego obszaru przechowywania (np. S3/ADLS/Storage w Databricks).

        Schema Inference: Zdefiniowanie/zaimportowanie surowego schematu danych.

Warstwa Srebrna (Silver Layer) - Transformacja i Czyszczenie

    Cel: Oczyszczone, znormalizowane i zdeszyfrowane dane.

    Zadania:

        Czyszczenie Danych: Obsługa brakujących wartości (imputacja lub usunięcie), usunięcie duplikatów, konwersja typów danych.

        Normalizacja: Ujednolicenie formatów tekstowych, dat i czasu.

        Klucze: Dodanie kluczy technicznych (np. unikalny identyfikator wiersza) i kluczy biznesowych.

Warstwa Złota (Gold Layer) - Agregacja i Wglądy (Insights)

    Cel: Wysoce przetworzone, zagregowane dane, gotowe do analizy biznesowej i modeli ML.

    Zadania:

        Agregacje: Tworzenie tabel faktów i wymiarów (Dimenional Modeling, np. Snowflake Schema), np. agregacja liczby oglądanych godzin na użytkownika/tytuł/gatunek.

        Feature Engineering (Podstawowy): Tworzenie podstawowych cech (np. wiek filmu, średnia ocena gatunku).

        Tworzenie Widoków: Zbudowanie tabel końcowych, które będą służyły jako źródło dla następnego etapu DS/ML.

2. 🧪 Data Science (Analiza Danych)

Ten etap służy zrozumieniu danych, zidentyfikowaniu wzorców i przygotowaniu zestawu cech.

    Exploratory Data Analysis (EDA):

        Statystyki Opisowe: Obliczenie podstawowych statystyk (średnia, mediana, odchylenie standardowe) dla kluczowych zmiennych (np. czas oglądania, ocena).

        Wizualizacje: Tworzenie wykresów, np.:

            Rozkład popularności gatunków.

            Trendy w czasie (np. wzrost produkcji filmów/seriali).

            Korelacje między cechami (np. korelacja między rokiem produkcji a oceną).

    Zaawansowany Feature Engineering:

        Stworzenie bardziej złożonych cech, specyficznych dla problemu ML, np. User-Item Interaction Matrix (jeśli budujesz system rekomendacyjny) lub cechy związane z demografią użytkowników.

    Definicja Problemu ML: Precyzyjne określenie, jaki problem będziesz rozwiązywać (np. przewidywanie, czy użytkownik obejrzy film do końca (klasyfikacja), czy przewidywanie oceny, jaką da filmowi (regresja), czy rekomendowanie następnego filmu (system rekomendacyjny)).

3. 🤖 Machine Learning (Modelowanie)

Ostatni etap, w którym budujesz, trenujesz i wdrażasz model.

    Wybór Modelu:

        Dla Systemu Rekomendacyjnego: Filtrowanie kolaboracyjne (np. SVD, ALS w Spark ML) lub modele oparte na treści.

        Dla Klasyfikacji/Regresji: Logistyczna Regresja, Drzewa Decyzyjne/Losowy Las, Gradient Boosting (XGBoost/LightGBM).

    Podział Danych: Podział zbioru danych na zbiory Treningowy, Walidacyjny i Testowy.

    Trening Modelu: Uczenie modelu na zbiorze treningowym.

    Ewaluacja Modelu: Ocena wydajności modelu na zbiorze testowym za pomocą odpowiednich metryk:

        Klasyfikacja: Accuracy, Precision, Recall, F1-Score, AUC/ROC.

        Regresja: MSE, RMSE, MAE.

        Rekomendacje: Precision@K, Recall@K, MAP.

    Hyperparameter Tuning: Optymalizacja hiperparametrów modelu.

    Wdrożenie (Deployment):

        Zapisanie wytrenowanego modelu (np. w MLflow).

        Integracja modelu z aplikacją (np. jako API za pomocą Flask/FastAPI) lub użycie go do generowania predykcji wsadowych (batch predictions) i zapisanie wyników z powrotem do Warstwy Złotej.
