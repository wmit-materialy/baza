# Baza IAD

Repozytorium zawiera kolekcję kolosów, egzaminów (w tym ustnych), zaliczeń, przykładowych projektów itd. Wcześniej baza IAD była przechowywana na Dysku Google ([link](https://drive.google.com/drive/folders/1azc9t81HO-203bSIWgbalRk5beAc348I)) w formie przeważnie nieuporządkowanej.

## Struktura

Każda praca to pojedynczy plik z przypisanym [UUIDv4](https://en.wikipedia.org/wiki/Universally_unique_identifier#Version_4_(random)). Indeksem takich plików jest `index.toml`, w którym tablica `assignment` składa się z obiektów opisujących poszczególne prace (kolosy, egzaminy itd.).

Przykładowy wpis w indeksie:

``` toml
[[assignment]]
  date = 2025-01-25     # Data
  extension = ".zip"    # Rozszerzenie pliku źródłowego
  kierunek = "IAD"      # Kierunek
  subject = "PAI"       # Przedmiot
  type = "projekt"      # Typ wpisu
  uuid = "1f84ee73-f1c5-4d77-91e7-1eec522356eb"
```

Katalog `md/` zawiera przepisaną ze zdjęć treść prac — w niektórych przypadkach do odczytania źródeł trzeba było zaangażować trzy osoby ze względu na złą jakość zdjęć.

Oprócz tablicy `assignment`, indeks zawiera też tablicę `subject`.

Przykładowy element:

``` toml
[[subject]]
  name = "Algorytmy i Struktury Danych"
  notatki = "./notatki/sem3/AiSD.md"
  semester = 3
  shortname = "AiSD"
```

Indeks służy do dołączenia metadanych do poszczególnych prac i jest w formacie TOML ze względu na czytelność w dowolnym edytorze tekstu. Pliki źródłowe przechowywane są jako osobne pliki, co umożliwia śledzenie zmian za pomocą Git. Gdyby cała baza była w jednym pliku `.sqlite`, każda zmiana wymagałaby ponownego wgrania całej bazy — Git nie różnicuje efektywnie plików binarnych. Dlatego warto trzymać wiele małych plików.

### Skompilowane PDFy

(zobacz np. [ten kolos z rachunku prawdopodobieństwa](./pdf/20d31680-03e4-48b7-bad6-b2eb05259620.pdf))

Do każdego pliku markdown z katalogu `md/` odpowiada dokładnie jeden plik PDF w katalogu `pdf/`. Skompilowane PDFy zawierają (przez `embedfile` w LaTeX) co najmniej dwa załączniki: plik źródłowy (np. `.jpg`) oraz odpowiadający mu plik `.md`. Dzięki temu można:

- zweryfikować poprawność przepisanych treści,
- skopiować formuły LaTeX-owe.

Wadą jest zwiększony rozmiar pliku PDF — zawiera on oryginalne zdjęcie i plik `.md`.

Aby otworzyć załączone pliki z PDF, użyj czytnika obsługującego załączniki, np. [Okular](https://okular.kde.org/) (PC) lub [Firefox](https://firefox.com) (PC).

## Contributing

Aby dodać nowy wpis, otwórz nowe issue i dołącz zdjęcia prac, które chcesz dodać. Można dołączyć kilka plików jednocześnie.
