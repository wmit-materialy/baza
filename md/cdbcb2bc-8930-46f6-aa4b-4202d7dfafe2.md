---
title: IAD – Rachunek prawdopodobieństwa – egzamin – zestaw 2
lang: pl
documentclass: article
classoption:
  - a4paper
pagestyle: empty
header-includes: |
  \usepackage{icomma}
  \pagenumbering{gobble}
  \usepackage[left=1.5cm, right=1.5cm, top=1.5cm, bottom=1.5cm]{geometry}
---

1. W miesiącu działają dwa przedsiębiorstwa taksówkowe: Zielone Taxi (85%
   samochodów) i Niebieskie Taxi (15% samochodów). Świadek nocnego wypadku
   zakończonego ucieczką kierowcy twierdzi, że samochód był niebieską taksówką.
   Eksperyment wykazał, że świadek rozpoznaje kolor poprawnie w 80% przypadków, a
   myli się w 20% przypadków. Jaka jest szansa, że rzeczywiście w wypadku
   uczestniczyła niebieska taksówka.

2. Dwóch przyjaciół umówiło się na spotkanie pomiędzy godziną 10 a 11.
   Przychodzą w umówione miejsce niezależnie od siebie i każdy z nich zobowiązał
   się czekać 20 minut. Jakie jest prawdopodobieństwo, że przyjaciele spotkają się?

3. Mamy 100 żarówek wyprodukowanych przez pewną fabrykę. Do lampy wkręcamy
   jedną z nich gdy się przepali zastępujemy ją następną żarówką i dalej
   postępujemy w ten sam sposób. Jakie jest prawdopodobieństwo, że posiadany zapas
   żarówek wystarczy na co najmniej 80000 godzin świecenia, jeżeli czas świecenia
   żarówki pochodzącej z tej fabryki jest zmienną losową o rozkładzie wykładniczym
   $\displaystyle f(x) = \frac{1}{1000} \cdot e^{-\frac{x}{1000}} I_{(0; \infty)}(x)$?

4. Załóżmy, że $X_1, X_2, X_3$ są niezależnymi zmiennymi losowymi o jednakowym
   rozkładzie jednostajnym na przedziale $[0,2]$. Obliczyć $E Z$, gdzie
   $Z = \min(X_1, X_3, X_3)$.

5. Zmienna losowa $T_F$ wyrażająca temperaturę w stopniach Fahrenheita ma rozkład
   jednostajny na przedziale $[t_1; t_2]$, $t_1, t_2 \in \mathbb{R}$. Znaleźć
   rozkład zmiennej losowej $T_C = (\frac{5}{9})(T - 32)$. Wyznaczyć
   dystrybuantę, wartość oczekiwaną, wariancję i funkcję charakterystyczną zmiennej
   losowej $T_C$.

6. Dwuwymiarowa zmienna losowa $(X, Y)$ ma rozkład prawdopodobieństwa określony
   następująco:

   - $P[X = 1, Y = 1] = P[X = 2, Y = 1] = P[X = 2, Y = 2] = 0,1$
   - $P[X = 1, Y = 2] = 0,3$
   - $P[X = 3, Y = 1] = 0,3$
   - $P[X = 3, Y = 2] = 0,1$

   (a) Czy zmienne losowe $X$ i $Y$ są niezależne?
   (b) Wyznaczyć postać regresji II rodzaju.
   (c) Wyznaczyć wartość dystrybuanty $F_{(X, Y)}$ w punktach $(1, 1), (3, 2)$.

7. Pokazać, że jeśli $P(A) = 0.7$ i $P(B) = 0,8$, to $P(A \cap B) \ge 0,5$.
