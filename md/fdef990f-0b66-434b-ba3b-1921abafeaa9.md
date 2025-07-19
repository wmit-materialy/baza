---
title: KOLOKWIUM I
date: 2024-11-27
author: ZESTAW D
lang: pl
geometry: margin=1.5cm
header-includes: |
  ```{=latex}
  \usepackage{icomma}
  \pagenumbering{gobble}
  ```
---

1. (6p.) Dany jest ciąg rekurencyjny określony następująco:

   $$
     a_n = \begin{cases}
       1,6 & \text{dla } n = 1\\
       2,1 & \text{dla } n = 2\\
       - a_{n-1} + 0,4 a_{n-2} & \text{dla } n > 2\\
     \end{cases}
   $$

   napisz funkcję o nagłówku

   ```cpp
   double NieRek(int n)
   ```

   która w sposób [nierekursywny]{.underline} dla zadanej wartości całkowitej
   indeksu $n$ wyznacza element ciągu $a_n$.

2. (8p.) Teoria funkcji tworzących pozwala przybliżać wartość funkcji
   $\frac{1}{1-2x}$ dla $x \in (0; \frac{1}{2})$ za pomocą sumy:

   $$
     \frac{1}{1-2x} = \sum_{i = 0}^{\infty} 2^i x^i,
   $$

   w którym składniki sumy da się wyrazić wzorem rekurencyjnym

   $$
     a_n = \begin{cases}
       1                &\text{dla } n = 0\\
       2x \cdot a_{n-1} &\text{dla } n > 0
     \end{cases}
   $$

   Napisz rekursywną funkcję która dla zadanych w argumentach wartości
   rzeczywistej $x$, oraz dokładności Eps, wyznaczy wartość funkcji
   $\frac{1}{1-2x}$ z zadanym przybliżeniem Eps, zgodnie z powyższą sumą.
   Przybliżenie jest osiągnięte, gdy wartość bezwzględna ostatnio dodanego
   składnika do sumy, będzie mniejsza od Eps.

3. (10p.) Napisz procedurę o nagłówku

   ```cpp
   void SortujBab(int *tab, int n)
   ```

   która zadaną w zmiennej tab tablicę wartości całkowitych o liczbie elementów
   podanej w zmiennej n, stosując algorytm [sortowania bąbelkowego]{.underline}
   posortuje [malejąco względem wartości bezwzględnych jej
   elementów]{.underline}.
