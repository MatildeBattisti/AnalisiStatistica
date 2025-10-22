= Inferenza funzionale

== Distribuzioni dipendenti da parametri
Abbiamo finora richiamato alcuni concetti riguardanti le
distribuzioni di probabilità, con alcuni teoremi base e tecniche di calcolo. Per arrivare a discutere l'*inferenza*, abbiamo ancora bisogno di un altro ingrediente.

Se un'osservabile ha una _distribuzione di probabilità
completamente nota_, farne delle (misure/osservazioni) non dà
alcuna informazione oltre al valore della misura stessa. Le cose diventano interessanti quando la distribuzione dell'osservabile (che rimane aleatoria) dipende da un qualche parametro, come abbiamo visto negli esempi notevoli precedenti.

Consideriamo una osservabile $X$, dotata di una _pmf/pdf_
dipendente da un qualche parametro $mu in M$. Scriveremo:
$ p_X (x; mu) $
*NOTA*: stiamo usando il ";" per evitare la virgola, usata invece per indicare la probabilità congiunta (intersezione) di più osservabili.

La quantità $mu$ può essere un qualunque parametro del mondo da
cui dipende la distribuzione: in generale non ha bisogno di
essere nè un'osservabile, nè una variabile aleatoria (dotata di
una distribuzione statistica). Potrebbe essere il numero $N$ di
estrazioni di una binomiale, o il parametro $p$ di una Bernoulli. È intuitivamente chiaro che l'osservazione di uno o più valori della $x$, fornisce qualche genere di informazione sul valore del parametro $mu$. Per formalizzare questo concetto, è utile introdurre una nuova definizione.

== Funzione di _Likelihood_
*Definizione*

Sia $X tilde p(x; mu)$, $mu in M$, dove $p(x)$
può indicare indifferentemente la _pmf_ o la _pdf_ di $x$. Data una osservazione $x_0$ dell'osservabile $x$, si definisce *funzione di Likelihood* il valore della probabilità/densità di $x_0$ in funzione di $mu$:
$ L : M arrow R_0^+: L_(x_0) (mu)= p(x_0 ; mu) $
Ne notiamo alcune caratteristiche:
- la Likelihood *non è* nè *una probabilità*, nè una densità di probabilità;
- la likelihood è una *funzione non negativa il cui dominio è differente da quello dell'osservabile*;
- ha le stesse dimensioni fisiche di $p$.

Ribadiamo che* la Likelihood è una funzione dell'osservazione $x_0$*.

=== Esempio: distribuzione di Bernoulli
$ B = binom(n, k) p^k (1-p)^(n-k) $
Supponiamo di fare un lancio ($n=1$) e di osservare $k=1$. Otterremo allora:
$ L(B)=p^1 (1-p)^0 $
(Mettere il primo grafico pag 4)
Se invece dal lancio otteniamo $k=0$:
$ L(B) = p^0 (1-p)^1 $
(Mettere il secondo grafico pag 4)

=== Esempio: distribuzione uniforme
Supponiamo di avere una distribuzione uniforme del tipo $U([0, m])$ e di osservare $x_0$. In generale $m$ sarà un parametro ignoto, per cui per $x in [0, m]$ avremo:
$ L_(x_0) (m)=1/m id_(m > x_0) $
(Terzo disegno pag 4)

=== Esempio: Gaussiana
Vediamo adesso qual è la _Likelihood_ corrispondente ad una _pdf gaussiana_ centrata in $mu$ con una certa varianza $sigma_0^2$.
$ p_x (x; mu, sigma_0) = 1/(sqrt(2 pi) sigma_0) exp[-(x-mu)^2 / (2 sigma_0^2)] $
$ arrow.double L_(x_0) (mu) = 1/(sqrt(2 pi) sigma_0) exp[-(mu-x_0)^2 / (2 sigma_0^2)] $
Come si vede dalla formula, la _Likelihood_ è ancora una funzione gaussiana centrata in $x_0$ con varianza $sigma_0^2$.

*NOTA*: Si tratta di un esempio fuorviante: ribadiamo infatti che la likelihood non rappresenta una probabilità e non è neanche detto che lo spazio $M$ a cui appartiene $mu$ sia un sottoinsieme di $RR$!

Per comprendere meglio questo aspetto, supponiamo ora che la varianza sia un parametro libero $sigma$:
$ p_x (x; mu, sigma) = 1/(sqrt(2 pi) sigma) exp[-(x-mu)^2 / (2 sigma^2)] quad arrow.double L_(x_0) (mu, sigma) = 1/(sqrt(2 pi) sigma) exp[-(mu-x_0)^2 / (2 sigma^2)] $
Cioè adesso la _Likelihood_ è una funzione di due parametri e non è più una \"gaussiana\".

== Proprietà della _Likelihood_
Alcune proprieta' della Likelihood
1. L puo' essere continua o discreta, multi-D, a seconda di che cosa e'
μ, indipendentemente dalle caratteristiche della osservabile. Dalla
osservabile eredita solo le unita' di misura.
2. La Likelihood non si "integra". Non e' detto che sia integrabile - e
comunque il suo integrale non e' interpretabile.

3. trasformazioni:
$ "LR" = (L_(x_0) (mu_1))/ (L_(x_0) (mu_2)) $
Quando facciamo il camnio di variabili
$ "LR" = (L_(x_0) (mu_1))||J||/ L_(x_0) (mu_2)||J|| $
I Jacobuani si cancellano

4. $L_x(f(mu)) = L_x (mu) $
Vogliamo vederlo in un caso particolare:
$ L_t (lambda) = lambda e^(- lambda t) ...$
La forma funzionale è invariata così come la posizione di massimi e minimi della funzione.

6. $ L(x_0, x_1, dots)= product_i L_(x_i) (mu) $
Supponiamo di avere una distribuzione uniforme $U(0, m)$ e di aver osservato $x_i$; allora per eventi indipendenti
$ L_(arrow(x_i)) (m) = 1/m^N $
dove $m>max{x_i}$.

Nel caso precedente
$ L_(t_0, t_1) (lambda) = (lambda e^(-lambda t_0))(lambda e^(-lambda t_1)) = L_(t_0) (lambda) L_(t_1) (lambda) $

8. log(L) da cui la combianzione diventa la somma delle likelihood e si possono definire i log a meno di costnti additive (prima a meno di fattori moltiplicativi).

== Esempio di combinazione di likelihood
Prendiamo due gaussiane
$ p_x (x; mu, sigma) = $
Abbiamo ottenuto due misure $x_1$ e $x_2$; scriviamo la likelihood combinata
$ L_(x_1, x_2) = ...$
Ne vediamo il logaritmo, a meno di un fattore costante:
$ log L_x... = log(1/(2 pi sigma^2)) +...$
dove il primo termine non ci interessa perchè è un fattore additivo
Svolgiamo il calcolo come appunti con un pò di manipolazioni algebriche.
L'oggetto ha la forma di una gaussiana centrata nel valor medio delle misure.

== Likelihood e inferenza
Likelihood -> loss per ML

== Uso inferenziale del teorema di Bayes
Supponiamo di poter scrivere
$ l_(x_0) (mu) = p(x_0 | mu) $
Usando il teorema di Bayes
$ p (mu| x_0) = p(mu) L_(x_0) / p(x_0) $

In generale L non è normalizzabile, ma l'integrale è definito.

Esempio test covid

