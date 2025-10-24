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
1. $L$ può essere continua o discreta, multi-dimensionale, a seconda di che cosa è $mu$, indipendentemente dalle caratteristiche dell'osservabile: dall'osservabile eredita solo le unità di misura.

2. Non è deto che la _likelihood_ sia integrabile, e comunque il suo integrale non è interpretabile.

3. Nel caso di trasformazioni dell'osservabile, la _pdf_ (e dunque $L$), viene moltiplicata solo per lo _Jacobiano_ $norm(J)$. Quest'ultimo è una funzione dei soli dati, quindi la forma funzionale di $L$ scala per una semplice costante, lasciando il rapporto di likelihood invariato:
$ "LR" = (L_(x_0) (mu_1) norm(J))/(L_(x_0) (mu_2) norm(J)) = (L_(x_0) (mu_1))/(L_(x_0) (mu_2)) $

    Si può per questo motivo considerare *$L$ definita a meno di una costante moltiplicativa*.

4. Se si fa una *trasformazione invertibile nello spazio dei parametri*, la _pdf_ resta invariata, e la *$L$ resta invariata in _valore_, ma cambia
_forma funzionale_*:
$ L_x(f(mu)) = L_x (mu) $

    *ESEMPIO*: distribuzione esponenziale
    $ L_t (lambda) = lambda e^(- lambda t) = lambda (tau) e^(- lambda(tau) t) = (e^(-t/tau))/tau eq.triple L_t (tau) $
    La forma funzionale rimane invariata così come la posizione di massimi e minimi della funzione.

5. La _likelihood_ ottenuta da misure di più osservabili indipendenti, dipendenti però da un certo set di parametri, è data dal *prodotto delle Likelihood individuali*:
$ L(x_0, x_1, dots; mu) = product_i L_(x_i) (mu) $
*ESEMPIO*: supponiamo di avere una distribuzione uniforme $U(0, m)$ e di aver osservato $x_i$; allora per eventi indipendenti
$ L_(arrow(x_i)) (m) = 1/m^N quad "per" quad m>max{x_i} $
*ESEMPIO*: ancora distribuzione esponenziale
$ L_(t_0, t_1) (lambda) = (lambda e^(-lambda t_0))(lambda e^(-lambda t_1)) = L_(t_0) (lambda) L_(t_1) (lambda) $

6. Dalle precedenti proprietà è facile comprendere che sia particolarmente comodo lavorare con le likelihood in quanto facilmente combinabili. Spesso risulta comodo lavorare anche con il loro logaritmo $log(L)$; in tal caso la likelihood è definita a meno di una costante additiva.

== Esempio di combinazione di Likelihood gaussiane
Supponiamo di avere due osservazioni $x_1$ e $x_2$, da una stessa distribuzione Gaussiana:
$ p_x (x; mu, sigma) = 1/(sqrt(2 pi)sigma) exp[-(x-mu)^2/(2 sigma^2)] $
Scriviamo la likelihood combinata:
$ L_(x_1, x_2) (mu) = 1/(2 pi sigma^2) exp[-((x_1-mu)^2+(x_2-mu)^2)/(2 sigma^2)] $
Ne calcoliamo il logaritmo:
$ log L_(x_1, x_2) (mu) = log(1/(2 pi sigma^2))  -((x_1-mu)^2+(x_2-mu)^2)/(2 sigma^2)= $
dove possiamo trascurare il primo termine in qaunto fattore additivo.
$ = -1/(2 sigma^2) (x_1^2 + x_2^2 -2 mu x_1 - 2 mu x_2 -2 mu^2) $
$ = -1/(2 sigma^2) [(x_1 + x_2 -2 mu)^2/2 + x_1^2/2 + x_2^2/2 - x_1 x_2] $
$ = -1/(2 sigma^2) [(x_1 + x_2 -2 mu)^2/2 + (x_1 - x_2)^2/2] $
$ = -1/(2 sigma^2)[2((x_1 + x_2)/2 - mu)^2] $
$ = -1/sigma^2 ((x_1 + x_2)/2 - mu)^2 $
$ = 1/(2 overline(sigma)^2) (overline(x)-mu)^2 quad, quad overline(sigma)= sigma/sqrt(2) $
Si può confrontare con il logaritmo della likelihood si $x$:
$ 1/(2 sigma^2) (x-mu)^2 $
per cui si osserva che il logaritmo della likelihood complessiva ha ancora la forma di una gaussiana in $mu$, centrata su $overline(x)$, con larghezza ridotta di $sqrt(2)$.

*NOTA*: non stiamo facendo la _propagazione degli errori_, stiamo usando un risultato esatto!

*NOTA*: il risultato non è legato al fatto che $x_1 + x_2$ abbia una probabilità gaussiana: stiamo _combinando l'informazione di due misure_, non le stiamo sommando!

== Likelihood e inferenza
La likelihood, pur non essendo interpretabile come una probabilità, ha un significato intuitivo abbastanza chiaro:
- se $L(mu)=0$ allora $mu$ può essere escluso come possibilità;
- valori più alti di $L$ corrispondono a parametri più “plausibili”. Se $L$ ha un grafico “stretto” attorno a una serie di valori, questi sono “favoriti” dal risultato (ma comunque non è interpretabile come una probabilità);
- la combinazione (prodotto) tende a produrre $L$ più "strette"

    *ESEMPIO*: la distribuzione uniforme composta da $N$ misure tende ad una Gaussiana

La likelihood presenta un modo promettente per esprimere un'*inferenza funzionale*:
$ s(x) : x arrow f_x (mu) = L_x (mu); quad f: A arrow RR $
cioè, per ogni possibile informazione $x$, si può associare una *funzione di inferenza $f_x$* che agisce su $mu$. In altre parole la likelihood
$ L_x (mu) = P(x| mu) $
è una funzione di $mu$ (il _parametro_) dati i _dati osservati_ $x$.
Nel caso in cui $mu$ sia essa stessa un'osservabile, allora ammetterà una distribuzione di probabilità $P(mu)$, per cui possiamo pensare di fare qualche inferenza  quantitativa su di essa a partire dai dati osservati. Se $mu$ possiede una distribuzione di probabilità, si può inoltre parlare di probabilità congiunta $P(x, mu)$. Si può dire allora
$ p(x; mu) = P(x|mu) $
*NOTA*: si tratta di un abuso di notazione giustificato dal fatto che, sapendo che $P(x|mu) eq.not P(mu|x)$, allora capiamo che $L_x (mu) eq.not P(mu|x)$.

== Uso inferenziale del teorema di Bayes
Supponiamo dunque che si possa scrivere
$ L_(x_0)(mu) = p(x_0|mu) $
Usando il teorema di Bayes si ottiene:
$ p(mu|x_0) = (p(mu) L_(x_0) (mu)) / p(x_0) $
La *probabilità a posteriori* (*_posterior_*) *$p(mu|x_0)$* è il prodotto della funzione di Likelihood per la *probabilità a priori* (*_prior_*) *$p(mu)$*, con un fattore di normalizzazione.
Vediamo alcune considerazioni:
- la posterior, quando esiste, è uno strumento migliore di $L$ per l'inferenza funzionale:
$ f_x (mu) = p(mu|x) $

- malgrado $L$ non sia in generale normalizzabile, il prodotto $p(mu) dot L(mu)$ deve certamente esserlo; infatti l'integrale
$ integral_M L_(x_0) (mu) p(mu) d mu $
è ben definito.

- se posso calcolare la $p(mu)$, posso calcolare tutto ciò che desidero, ad esempio:
    - la probabilità di un qualunque sottoinsieme di M;
    - la $mu$ per cui la posterior è massima;
    *NOTA*: nel caso di $M$ spazio discreto, questo si chiama 'Bayes Classifier' ed è il _classificatore di minimo rischio_ in teoria della decisione.

La teoria Bayesiana ha grandi applicazioni nel campo di test medici (es. Test del Covid).

== Altri utilizzi della formula Bayesiana
Per evitare il problema di dover calcolare la normalizzazione $p(x_0)$, può essere conveniente considerare il rapporto tra due $mu$ differenti:
$ (p(mu_1|x_0))/(p(mu_2|x_0)) = (L_(x_0) (mu_1))/(L_(x_0) (mu_2)) dot p(mu_1)/p(mu_2) $
La quantità *$"LR"_(x_0) (mu_1, mu_2) eq.triple (L_(x_0)(mu_1))/(L_(x_0)(mu_2))$*, detta *fattore di Bayes*, 'aggiorna' il valore della probabilità relativa delle due ipotesi a seguito dell'osservazione. Questa formula può essere applicata ripetutamente con misure successive,
diventando così una _regola di evoluzione_ del rapporto di probabilità.

Questa si può applicare anche al caso di una procedura di selezione a partire da una
popolazione. In tal caso, *$"LR"_(x_0) (mu_1, mu_2)$* viene chiamato anche *fattore di rejezione*, ed
il rapporto *$p(mu_1)/p(mu_2)$* *abbondanza relativa*.

*ESEMPIO* (PID): un fascio di particelle contiene una proporzione $1:100$ di muoni rispetto a pioni
(purezza $1%$). Un rivelatore di muoni ha efficienza $90%$ per i muoni e $1%$ per i
pioni; questo significa $"fattore di rejezione" = 90$. Gli eventi identificati dal rivelatore come muoni, hanno in realtà un'abbondanza relativa $= 0.01 dot 90 = 0.9 : 1$ rispetto ai pioni.

È importante osservare che tutti i tipi di utilizzo della formula di Bayes visti fin qui
sono esenti da controversie, e perfettamente in linea con il concetto di probabilità
operativamente misurabile (frequentista). Parleremo ora di un altro tipo di utilizzo del teorema di Bayes, che è quello a cui spesso ci si riferisce parando di _inferenza Bayesiana_.

== Inferenza Bayesiana _soggettivista_
Cosa si può fare se $mu$ non ha una _pdf_ o se non è nota?

L'approccio *Bayesiano soggettivo* (a volte detto ambiguamente 'Bayesiano') consiste nell'assegnare una distribuzione di probabilità a priori al parametro ignoto $mu$, basata sul *degree of belief* soggettivo *$pi(mu)$*. Trattando il d.o.b. come una probabilità (ed è stato dimostrato che ne rispetta gli assiomi), si può applicare il teorema di Bayes e ottenere un _posterior d.o.b._:
$ pi_(x_0) (mu) = (pi(mu) L_(x_0)(mu))/ pi(x_0) = (pi(mu) L_(x_0)(mu))/(sum_i p(x; mu_i) pi(mu_i)) $
Il campo di applicazione di questa formula è molto esteso, così come la sua potenza inferenziale; è doveroso però affrontare le sue difficoltà:

- può essere difficile decidere la _prior_ giusta;
- se $mu$ ha dominio illimitato, a volte si è condotti a scegliere una *$pi(mu)$ non normalizzabile* (_improper prior_). Questo costringe a sperare in L per la normalizzazione.

Nella formula con il rapporto tra $mu$ diversi si ha:
$ (pi(mu_1|x_0))/(pi(mu_2|x_0)) = (L_(x_0) (mu_1))/(L_(x_0) (mu_2)) dot pi(mu_1)/pi(mu_2) $
Il fattore di Bayes $"LR"_(x_0)(mu_1,mu_2)$ viene chiamato anche _belief-updating ratio_, e
i $pi(mu_1)/pi(mu_2)$ sono _betting odds_, nel linguaggio delle scommesse.

In seguito vedremo che questo non è l'unico modo per trarre inferenze statistiche quando $mu$ non ha una distribuzione definita, ma le altre strade possono essere più complesse. Un concetto connesso al teorema di Bayes è il cosiddetto *Principio di Likelihood*.


