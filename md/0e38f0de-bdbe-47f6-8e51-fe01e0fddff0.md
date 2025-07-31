---
title: "I kolokwium z przedmiotu **Analiza matematyczna II**, grupa **IAD1 2.3**"
author: ""
date: "15.04.2025 r."
lang: pl
# classoption:
#   - landscape
#   - twocolumn
#   - symmetric
geometry: margin=1.5cm,top=0cm
header-includes: |
  ```{=latex}
  \usepackage{icomma}
  \pagenumbering{gobble}
  ```
---

#### Zadanie 1.

(10p) Obliczyć całki nieoznaczone:

(i) $\displaystyle \int \sin(2x)\left(\sqrt[3]{e}\right)^{\sin x}dx,$

(ii) $\displaystyle \int \frac{x+4}{(x^2+2x+1)(x^2+1)}dx.$

#### Zadanie 2.

(10p) Obliczyć całki oznaczone:

(i) $\displaystyle \int_{0}^{\frac{\pi}{6}} \frac{4+\cos x}{2-\cos x}dx,$

(ii) $\displaystyle \int_{1}^{2} \frac{dx}{\sqrt{x^2+4x-4}}dx.$

#### Zadanie 3.

(10p) Obliczyć pole obszaru ograniczonego przez 3 krzywe o równaniach:
$x = \sqrt{y+\frac{9}{4}}-\frac{3}{2}$, $y = \frac{4}{x^2}$,
$y = -\frac{1}{4}x^2 + x$. Wykonać rysunek oraz opisać odpowiednie obszary
normalne.

#### Zadanie 4.

(10p) Zbadać zbieżność całek:

(i) $\displaystyle \int_{3}^{+\infty} \frac{xdx}{\sqrt[3]{x^6 - 10x}},$

(ii) $\displaystyle \int_{0}^{4} \frac{\sqrt{x}}{\ln(1+3x)}dx.$

#### Zadanie 5.

Dla funkcji $f, g:\mathbb{R}^2\to\mathbb{R}$ wyrażonych wzorami

$$
  f(x, y) = \begin{cases}
    \frac{\sin(x^2)\cdot\cos(y^2)}{x^2+y^4}, & (x, y)\neq (0,0) \\
    0,                                       & (x, y) = (0,0)
  \end{cases} \qquad
  g(x, y) = \begin{cases}
    \frac{x^3-y+1}{\sqrt{x^2+(y-1)^2}}, & (x, y)\neq (0,1) \\
    0,                                  & (x, y) = (0,1)
  \end{cases}
$$

(i) (5p) Zbadać istnienie granic iterowanych oraz granicy podwójnej funkcji $f$
    w punkcie $(0,0)$.
(ii) (5p) Znaleźć pochodną kierunkową funkcji $g$ w kierunku dowolnego wektora
     $\mathbf{a} = [a_1, a_2]$ w punkcie $(0, 1)$ oraz gradient funkcji w tym
     punkcie.
