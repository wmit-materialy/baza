---
title: Zaliczenie Bazy Danych
date: 2025-01-21
geometry: margin=1.5cm, top=3cm, bottom=3cm
classoption:
  - twocolumn
header-includes: |
  \usepackage{multicol}
---

1. System zarządzania bazami danych to:
   a) narzędzie przeznaczone do tworzenia kopii bezpieczeństwa
   b) sposób na dostarczanie podstawowych funkcjonalności biznesowych w
      systemach informatycznych
   c) zbiór programów umożliwiających tworzenie i utrzymywanie danych

2. Abstrakcja danych to:
   a) artystyczne ujęcie danych w przestrzeni kolorów RGB
   b) własność umożliwiająca zapewnienie niezależności programu od danych oraz
      od operacji
   c) zdeterminowanie dużej zależności pomiędzy programem a danymi które
   przetwarza

3. Projektanci baz danych są odpowiedzialni przede wszystkim za:
   a) uwierzytelnienie dostępu do bazy danych
   b) implementowanie dostępu osadzonego kodu w języku wyższego poziomu
   c) identyfikacje danych, odpowiednich dla nich typów oraz komunikację bazy
      danych z jej odbiorcami

4. Modele danych to:
   a) aparat pozwalający na manipulacje poziomem dostępu do danych
   b) zbiór pojęć przeznaczonych do opisu struktury danych
   c) obiekty przeznaczone do wymiany danych w sposób relacyjny

5. Schemat bazy danych:
   a) reprezentuje opis bazy danych i może mieć postać grafu
   b) to wypełnienie relacji krotkami danych
   c) reprezentuje pojedynczy obiekt w ujęciu schematu obiektowego

6. W środowiskach gdzie zastosowano architekturę klient-serwer:
   a) występują wyłączenie komputery scentralizowane
   b) występuje duża liczba komputerów i dedykowanych serwerów
   c) najczęściej występuje wyłączenie jeden terminal i komputer główny

7. Język DDL to:
   a) język definiujący dane i służy do tworzenia schematu koncepcyjnego
   b) jest przeznaczony do tworzenia diagramu ERD
   c) to skrót od driven design landscape i jest to dynamiczny język
      projektowania perspektyw

8. Diagram związku encji to:
   a) wysokopoziomowy, koncepcyjny model danych
   b) niskopoziomowy sposób tworzenia struktur danych
   c) obiektowe odzwierciedlenie implementacji bazodanowej w języku obiektowym

9. Projektowanie fizyczne bazy danych to:
   a) definiowanie wewnętrznych struktur składowania danych, plików, indeksów,
   ścieżek dostępu do danych
   b) zwięzły opis wymagań
   c) implementacja odwzorowanego modelu danych w oparciu o konkretny komercyjny
      system zarządzania bazami danych

10. Atrybuty pochodne w encji:
    a) są tworzone na podstawie innych atrybutów
    b) mają ciągłą funkcję bazową
    c) są złożeniem prostych typów danych

11. Krotka w modelu relacyjnym to:
    a) reprezentuje jeden wiersz z tabeli nazywanej także relacją
    b) jest określeniem liczby powtórzeń wybranego wiersza w tabeli
    c) jest definicją tabeli

12. Płaski model relacyjny:
    a) to model w którym wartości atrybutów są wartościami atomowymi
    b) zawiera wyłącznie typy numeryczne dla atrybutów
    c) jest uproszczoną wersją

13. Klucz relacji to:
    a) minimalny zbiór atrybutów który jednoznacznie identyfikuje jej krotkę
    b) podzbiór jej atrybutów który jednoznacznie identyfikuje jej krotkę
    c) podzbiór atrybutów odnoszący się do innej relacji

14. Klucz kandydujący w relacji to:
    a) to każdy zidentyfikowany podklucz w danej relacji
    b) taki klucz który może zostać wybrany do jednoznacznej identyfikacji
       krotki w relacji
    c) taki podzbiór atrybutów, który identyfikuje inną relację powiązaną

15. Wyzwalacze to:
    a) możliwe operacje wołane w momencie próby modyfikacji tabeli
    b) zapytanie testowe dotyczące jakości danych
    c) zapytanie SQL usuwające klucze obce z relacji

16. Proces normalizacji zaproponowany przez Codda:
    a) jest zbiorem kolejnych etapów pozwalających na testowanie schematów
       relacji w kontekście spełnienia kolejnych postaci normalnych
    b) to proces łączenia relacji bazowych w większe relacje w kontekście
       kolejnych postaci normalnych
    c) to transformacja modeli relacyjnych w modele obiektowe

17. Atrybut podstawowy to taki, który:
    a) ma zawsze wartość wieloelementową
    b) taki, który wchodzi w skład pewnego klucza kandydującego
    c) taki, który nie wchodzi w skład klucza kandydującego

18. Druga postać normalna opiera się na:
    a) przechodniej zależności funkcjonalnej
    b) pojęciu atomowych dziedzin typów atrybutów
    c) zależności funkcyjnych: częściowej i zupełnej

19. Następujące stwierdzenie jest prawdziwe:
    a) Postacie normalne 3NF i BCNF są równoważne
    b) Każdy schemat relacji będący w 3NF jest też w BCNF
    c) Każdy schemat relacji będący w BCNF jest też w 3NF

20. Encja słaba to:
    a) encja która zajmuje minimalną ilość miejsca na dysku
    b) taka w której nie występuje atrybut klucza
    c) encja zawierająca minimalną ilość atrybutów

Pytania otwarte:

1. Opisz architekturę trójwarstwową systemu zarządzania bazami danych.

2. Opisz i scharakteryzuj pierwszą i drugą postać normalną dla schematów relacji
   baz danych. Jak wygląda test oraz sposób normalizacji dla tych postaci?

3. Scharakteryzuj model relacyjny, wymień i omów podstawowe pojęcia modelu
   relacyjnego.
