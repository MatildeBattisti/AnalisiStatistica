= La legge dei grandi numeri

L'espressione _Legge dei grandi numeri_ (_LLN_), ricorrente persino nel linguaggio comune, si riferisce ad un teorema matematico fondamentale in
statistica, cruciale nella dimostrazione di molti teoremi.
Di questa legge esistono molte varianti, con formulazioni e/o ipotesi leggermente diverse; si tratta di un risultato molto “forte", sul cui significato si e' spesso
discusso - qualcuno lo considera persino una "validazione" della "interpretazione frequentista" di probabilita' (cosa per
noi non necessaria, perche' la consideriamo una definizione
operativa, non un'interpretazione).

Per formulare la LLN, introduciamo alcune definizioni utili:
1. Data una osservabile aleatoria $X$, si dice *media aritmetica* o media campionaria (su N) la statistica:
$ overline(x)_N = 1/N S_N = 1/N sum_i^N x_i $

2. Se $p_X(x)$ è la _pdf_ di X, si dice media di distribuzione o *valore atteso* di $X$, l'integrale di Lebesgue:
$ angle.l x angle.r eq.triple E[x] eq.triple integral_(O_X) x dot p_X(x) d x $

== Teorema della LLN
Sia $X$ una osservabile a valori in $RR$, e sia $p_X(x)$ la sua _pdf_. Supponiamo che esista finita la media di $X$:
$ mu = E[x] = integral_(O_X) x dot p(x) d x $ <LLNhp>
Si ha allora:
$ forall epsilon > 0: lim_(N arrow.r infinity) P(|overline(x)_N - mu| > epsilon)=0 $ <LLNth>
L'esistenza del limite sopra viene chiamata _convergenza in probabilità_.
Ciò che ci dice è che *la media campionaria di un'osservabile converge in
probabilità al suo valore atteso ogni volta che questo esiste ed è finito*.

=== Esempio: la distribuzione di Bernoulli
Sia $x=1$ con probabilità $p$; 0 con probabilità $1-p$. Allora la @LLNth ha la forma di un'asserzione di esistenza della "probabilità frequentista" degli '1': $ 0 dot (1-p) + 1 dot p = p$.

=== Considerazioni sulla LLN
- La tesi @LLNth, nonostante le apparenze, non si riferisce alla probabilità sperimentalmente misurabile; è tuttavia effettivamente una proprietà passibile di verifica sperimentale per una data osservabile $X$, se si intende la probabilità in senso fisico.
- Si potrebbe essere tentati di prendere la tesi del teorema come definizione operativa del valore atteso $mu$, e allora la LLN prenderebbe la seguente forma: _se l'integrale @LLNhp esiste finito, allora esiste anche il valore atteso di $X$, ed e'
uguale ad esso_.
• L'importanza della LLN non è quella di una banale riformulazione della probabilità in un formato frequentista: si applica a qualunque distribuzione di probabilità in cui il valore atteso esiste, e la sua potenza ed applicabilità sono enormi.

== Dimostrazione della LLN
Discutiamo una versione più limitata della LLN, facile fa dimostrare ma che permette comunque di introdurre un lemma utile anche per altre applicazioni.
Dimostriamo allora che l'LLN vale anche sotto l'ipotesi più forte che esista finito il seguente integrale (varianza di $X$):
$ sigma ^2 eq.triple V a r(X) eq.triple integral_(O_X) (x-E[x])^2 p_X (x) d x $

=== Lemma: Teorema di Čebyšëv
Sia $X$ una osservabile a valori in $RR$, per cui esistono finiti $mu$ e $sigma ^2$ sopra definiti. Vale allora la disuguaglianza:
$ P(|x- mu| > k sigma) <= 1/k^2 $ <DisChebishev>
per ogni numero reale positivo $k$ (non banale solo per $k > 1$).

=== Dimostrazione
$ P(|x- mu| > k sigma) = integral_(|x- mu| > k sigma) p_X (x) d x = integral_(O_X) F(|x- mu| > k sigma)p_X (x) d x $
Dove $F(X)$ rappresenta la funzione indicatrice dell'insieme $X$. Sostituendo nell'integranda la maggiorazione ovvia
$ f[(|x-mu|) /(k sigma) >= 1] <= (|x-mu|^2)/ (k^2 sigma^2) $
si ottiene subito:
$ P(|x- mu| > k sigma) <= integral (|x-mu|^2)/ (k^2 sigma^2) p_X (x) d x = (V a r(X))/(k^2 sigma^2) = 1/k^2 $
Questa maggiorazione non è particolarmente forte, ma risulta utile per la sua
applicabilità molto generale.

Servendoci della disuguaglianza di Čebyšëv, facciamo ora vedere che la LLN vale perlomeno sotto l'ipotesi più restrittiva di varianza finita. Si noti che la _pdf_ dell'osservabile vettoriale, essendo le osservazioni supposte indipendenti, si puo' scrivere come prodotto
$ product_i^N p_X (x_i) $
Osserviamo quindi che:
$ V a r(overline(x_N))=V a r[(sum_i x_i)/N] = (V a r [sum_i x_i])/N^2 $
$ = 1/N^2 integral [sum_i x_i - E[sum_i x_i]]^2 product_i p_X (x_i) d x^N $
$ = 1/N^2 integral [sum_i x_i - sum_i mu]^2 product_i p_X (x_i)d x^N $
$ = 1/N^2 integral [sum_i (x_i - mu)]^2 product_i p_X (x_i) d x^N $
$ 1/N^2 sum_(i, j) integral (x_i - mu)(x_j - mu) product_i p_X (x_i) d x^N $
$ = 1/N^2 sum_i integral (x_i - mu)^2 p_X (x_i) d x^N = sigma^2 / N $
e che inoltre
$ angle.l overline(x)_N angle.r = integral overline(x)_N product_i p_X (x_i) d x^N) $
Ricordando la disuguaglianza di Čebyšëv @DisChebishev, e applicandola alla statistica $overline(x)_N$, prendendo $k= epsilon/sqrt("Var"(overline(x)_N))$ si ottiene:
$ P(|overline(x)_N - mu| > epsilon) <= "Var"(overline(x)_N)/ epsilon^2 = sigma^2/(N epsilon^2) $
È chiaro che, qualunque sia $epsilon$, il secondo membro può essere reso arbitrariamente piccolo per $N$ sufficientemente grande. Da ciò segue immediatamente che:
$ forall epsilon quad exists lim_(N arrow.r infinity) P(|overline(x)_N - mu|> epsilon)= 0 $
C.V.D.

== Strong LLN
Una variante è la *legge forte* (*SLLN*):
$ P(lim_(N arrow.r infinity)|overline(x)_N - mu| > epsilon) = 0 $
Questa ci dice che il limite di ogni successione siffatta converge a $mu$ "_quasi certamente_"; si tratta di un'affermazione più forte della convergenza in probabilità, e in effetti la implica.
Questa variante è più complicata da dimostrare, e non la utilizzeremo; diremo solo che richiede condizioni leggermente
più forti di quella debole, come ad esempio l'esistenza di varianza finita.

La SLLN è _invertibile_: cioè la convergenza quasi certa implica l'esistenza del valore di aspettazione $E[x]$.

== Valore atteso di una statistica
Le considerazioni precedenti hanno messo in luce l'importanza del *valore
atteso*, a volte chiamato *speranza matematica*, di una osservabile:
$ E[x] = integral_O x p_X (x) d x $
Questo conduce spontaneamente a considerare il valore atteso di una generica statistica $f(x)$:
$ E[f(X)] = E_X[f] = cases(integral f(x) p_X (x) d x quad "se X continua",
 sum_i f(x_i) P_X (x_i) quad "se X discreta") $
Per la LLN, questo costituisce il valore a cui tende (nel senso della probabilità) la media aritmetica dei valori di $f$ osservati in lunghe serie di osservazioni ripetute.

Abbiamo così definito un nuovo operatore $E_X$. Alcune sue proprietà sono:
1. $E_X [x] = mu$;
2. $E_X [c] = c$;
3. $E_X [a dot f(X) + b dot g(X)] = a dot E_X [f(X)]+ b dot E_X [g(X)]$;
4. $E_X [(x-mu)^2] = E_X [x^2] - μ^2 = "Var"(X)$;
5. $E[X Y] <= sqrt(E[X^2] dot E[Y^2])$ disuguaglianza di Schwartz.
Osserviamo che il valore atteso di una funzione $f(X)$ può essere calcolato in due modi equivalenti:
$ E_X[f] = integral f(x) p_X (x) d x = integral f p_F (f) d f = E_F [f] = mu_f $
Questo vuol dire che, anche se calcoliamo la media di $f(X)$ integrando rispetto alla _variabile di partenza_ $X$ o rispetto alla _nuova variabile_ $F=f(X)$, il risultato non cambia: l'informazione probabilistica è la stessa, solo espressa in modo diverso.
Questo dipende dal fatto che la *densità di probabilità* associata ad un’osservabile (una variabile casuale) si ottiene sempre a partire dalla probabilità degli eventi fondamentali nello spazio degli eventi elementari $S$; in simboli:
$ forall B subset f(O_X) : P_F (f in B) eq.triple P(x in f^(-1) (B)) $
cioè la probabilità che $F=f(X)$ assuma un valore in un certo insieme $B$ è uguale alla probabilità che la variabile $X$ assuma un valore tale che $f(X)$ cada in $B$.
In conclusione, il valore atteso $E_X [f]$ non dipende da quale variabile di base (cioè da quale osservabile originaria) usiamo per calcolarlo. Per questo motivo in seguito ometteremo il pedice e scriveremo solo $E[f]$.

Supponiamo ora che $F=f(X)$ e $G=g(X)$ siano osservabili indipendenti. Si ha:
$ E[f g] = integral f g p_("FG") (f, g) "dfdg" = integral f g p_F (f) p_G (g) "dfdg" $
$ = integral f p_F (f) "df" integral g p_G (g) "dg" = E[f]E[g] $
$ arrow.r.double E[f g] = E[f]E[g] $
Questo suggerisce un'altra definizione utile, la *covarianza*:
$ "cov"(f, g) = E[(f-E(f)(g-E(g))] = E(f g)-E(f)E(g) $
$ "cov"(f,f) = "Var"(f) $
Se $f$ e $g$ sono indipendenti, allora va⇒ $"cov"(f,g) = 0$, ma non vale il viceversa (es. $f=x$, $g=x^2$).

== Distrubuzione di una statistica
Se conosco la _pmf_ di $x$ (discreta) è facile ricavare la _pmf_ di $f(x)$ come _pmf_ $(x(f))$.

*Ci chiediamo allora, se conosco la densità $p_x (x)$ ($x in RR$), quale sia la densità $p_f (f)$ di $f(x)$.*

Se $f$ monotona (de)crescente, la cumulante di $f$ è data semplicemente da
$ F_f (f) = (1-) F_x (x(f)) $
Questo deriva direttamente da quanto visto in precedenza sulla probabilità delle statistiche. Ne segue
$ p_f (f) = p_x (x(f)) abs("dx"/"df") = p_x (x(f)) abs("df"/"dx")^(-1)_(x=x(f)) $
(si noti la consistenza delle dimensioni fisiche delle densità).
In generale, per più variabili ed una $arrow(y)(arrow(x))$ invertibile:
$ p_y (y_1, dots, y_n) = p_x (x_1, dots, x_n) norm(partial(y_1, dots, y_n)/ partial(x_1, dots, x_n)) $
In caso di soluzioni multiple di $x=x(y)$, occorre sommare le espressioni di cui sopra su ciascuna delle soluzioni.
Se si applica questa regola alla somma di due variabili $x_1+x_2$, si può vedere
subito che la _pdf_ della somma è la _convoluzione delle pdf_.
Un'applicazione pratica importante è la seguente: determinare $f(x)$ con la distribuzione voluta:
$ abs("dx"/"df") = (p_f (f))/(p_x (x(f))) $
a partire da una $x$ con distribuzione assegnata $p_x (x)$ (spesso uniforme).

=== Esempio: $f$ esponenziale, $x$ uniforme
Le due distribuzioni sono:
$ p_f (f) = k e^(-k f) quad [f > 0] $
$ p_x (x) = 1 quad x in [0, 1] $
Allora
$ abs("dx"/"df") = (p_f (f)) arrow.r.double x(f) = plus.minus integral_0^f p_f (f') d f' + x(0) = plus.minus (1-e^(-"kf")) + 0 slash 1 $
due soluzioni monotone; scelgo la decrescente (con segno meno)
$ arrow.r.double x(f) = e^(-k f) arrow.r.double f = - log(x)/k $

== Momenti di una statistica
Generalizzando ciò che si è visto riguardo alla media e alla varianza di una distribuzione, risulta utile definire i *momenti di una distribuzione di probabilità* (_discreta o continua_):
$ mu_n (x_0) = E[(x - x_0)^n] $
Risulta allora:
$ mu_o (x_0)=1; quad mu_1 (0)= mu; quad mu_2 (mu_1) = "Var"(x) $
Ovviamente le funzioni pari hanno momenti dispari nulli.
Osserviamo la relazione tra momenti centrali e non:
$ mu_n (x_0) = sum_(k=0)^n binom(n, k) mu_k (0) (-x_0)^(n-k) $
Notiamo inoltre che $mu_n (0)$ è più spesso indicato come $mu_n '$; inoltre non necessariamente esistono finiti tutti i momenti (solo $mu_0 = 1$ sempre).

Un esempio di quest'ultima affermazione è la _distribuzione di Cauchy (o Lorentz)_:
$ p(x) = 1/pi 1/(1+x^2) $
In questo caso, $mu_1$ non esiste e $mu_2$ diverge. La LLN *non si applica a dati distribuiti secondo la distribuzione di Cauchy*!

Enunciamo infine il seguente teorema: se $p_1 (x)$ e $p_2 (x)$ hanno gli stessi momenti, e $(p_1 (x)-p_2 (x))$ è sviluppabile in serie di potenze, allora
$ p_1 (x) = p_2 (x) $
per cui la conoscenza dei momenti caratterizza in modo stringente la
distribuzione.

=== Calcolo approssimato dei momenti di una statistica
Consideriamo ancora il problema di determinare la densità di una statistica $f(x)$.
Farlo esattamente, seguendo quanto mostrato in precedenza, può essere complicato. Si può alternativamente ricorrere a delle approssimazioni:
$ f(arrow(x)) tilde.eq f(arrow(mu)) + (partial f)/(partial x_i) (x_i - mu_i) + 1/2 (partial^2 f)/(partial x_i partial x_j) (x_i - mu_i)(x_j - mu_j) + dots $
$ arrow.r.double E[f(arrow(x))] tilde.eq f(arrow(mu)) + 1/2 (partial^2 f)/(partial x_i partial x_j) "cov"(x_i, x_j) + dots $
Inoltre
$ "cov"(f_1, f_2) = sum_(i, j) (partial f_1)/(partial x_i) (partial f_2)/ (partial x_j) "cov"(x_i, x_j)+ dots $
che per $x$ scorrelate (matrice di covarianza diagonale) diventa:
$ sigma^2_f = "Var"(f) = sum_i abs((partial f)/ (partial x_i))^2 sigma^2_i + dots $
cosiddetta *formula di propagazione degli errori/incertezze*. Questa si tratta in effetti solo della _varianza approssimata di una statistica_. Il concetto di incertezza entra in gioco solo quando si comincia a fare
inferenza.

È da notare inoltre che abbiamo trattato _approssimazioni_: i termini successivi possono essere importanti!

== Funzione generatrice dei momenti
Definiamo la *funzione generatrice dei momenti* di una data distribuzione (discreta o continua):
$ M(t) = E[e^(t x)] $
Se $M(t)$ esiste finita (e derivabile) in un intorno dell'origine (richiede ovviamente $p(x)$ rapidamente decrescente), allora la distribuzione ammette infiniti momenti, dati da:
$ mu'_n = (partial^n M)/(partial t^n) |_(t=0) quad ; quad mu_n (x_0)= (partial^n (M e^(-t x_0)))/(partial t^n) |_(t=0) $
$ (partial^n M)/(partial t^n) = partial^n/(partial t^n) E[e^(t x)]= E[(partial^n e^(t x))/(partial t^n)] = E[x^n e^(t x)]|_(t=0) = E[x^n] = mu'_n $

Vediamo alcune proprietà di $M(t)$:

- è una funzione adimensionale di un parametro $t$ con $[t]=[x]^(-1)$

- sia $x = x_1 + x_2$ con $x_1$, $x_2$ indipendenti; allora $M(t)=M_1 (t) M_2 (t)$. Vediamo un esempio:
  $ M(t) = E[e^(t x)] = E[e^(t(x_1 + x_2))] = E[e^(t x_1) e^(t x_2)] = E[e^(t x_1)] E[e^(t x_2)] $

- $M_S_N (t) = M_x^N (t)$ (segue dall'ultima proprietà). Ad esempio se $y = a x$, allora $M_y (t)=E[e^(a t x)] = M_x(a t)$.

La generatrice dei momenti fornisce spesso un modo comodo di calcolare in pratica i momenti, specialmente per distribuzioni discrete. Vediamo in seguito alcune applicazioni a distribuzioni note.

=== Esempio: Distribuzione di Bernoulli:
$ M(t) = E[e^(t x)] = (1-p)e^(t dot 0) + p e^(t dot 1) = 1-p+p e^t $
$ arrow.double forall n>0: (d^n M)/(d t^n)=p e^t arrow.double mu'_n = p $
per cui, ad esempio, la varianza è $"Var"[x] = p-p^2 = p(1-p)$.

=== Esempio: Distribuzione Uniforme
Se prendiamo una distribuzione discreta, come ad esempio quella del dado:
$ M(t) = E[e^(t x)] = 1/n sum_(i=1)^n e^(t i) = 1/n sum_(i=1)^n (e^t)^i = (e^((n+1)t)-e^t)/(e^t-1) $
Se prendiamo invece una distribuzione continua $p(x) = F([0, 1]) eq.triple U[0, 1]$:
$ M(t) = integral_0^1 e^(t x) d x = (e^t-1)/t $

=== Esempio: Momenti di somma di statistiche
Sia $x = x_1 + x_2$, $x_1$ e $x_2$ indipendenti. Allora $M(t)=M_1(t) M_2(t)$:
$ arrow.double M'(t) = M_1(t)M'_2(t) + M'_1(t)M_2(t) $
$ arrow.double M'(0) = M'_2(0) + M'_1(0) $
$ arrow.double mu = mu_1 + mu_2 $

$ arrow.double M''(t) = M_1(t)M''_2(t) + 2 M'_1(t)M'_2(t) + M''_1(t)M_2(t) $
$ arrow.double M''(0) = sigma^2 + mu^2 = M''_1(0) + 2 mu_1 mu_2 + M''_2(0) = $
$ = sigma_1^2 + sigma_2^2 + 2 mu_1 mu_2 + mu_1^2 + mu_2^2 = $
$ = sigma_1^2 + sigma_2^2 + (mu_1 + mu_2)^2 $
$ arrow.double sigma^2 = sigma_1^2 + sigma_2^2 $

== Funzione Caratteristica
Con distribuzioni a dominio _finito_ (o rapidamente decrescenti) la generatrice dei momenti risulta di utilità, però in molti altri casi essa non esiste. Alternativamente, si può usare la *funzione caratteristica* della distribuzione di _x_:
$ Phi(t) = E[e^(i t x)] $
Si tratta sostanzialmente della trasformata di Fourier della funzione di distribuzione. Ha proprietà analoghe a $M$, ma esiste per una classe molto più ampia di distribuzioni. Si ha:
$ mu'_n = (partial^n Phi)/(partial(i t)^n) |_(t=0) = (-i)^n (partial^n Phi)/(partial t^n) |_(t=0) $
e di nuovo, per $x_1, x_2$ indipendenti si ha $Phi(t) = Phi_1(t) Phi_2(t)$.
Vale inoltre il *teorema di Paul Levy*:
1. sia ${F_n}$ successione di cumulanti e ${Phi_n}$ le rispettive funzioni caratteristiche;
2. sia $lim_(n arrow infinity) Phi_n (t) = Phi(t)$ (puntualmente) con $R(Phi(t))$ continua in un intorno di t=0.
Allora:
$ exists F: lim_(n arrow infinity) F_n (x) = F(x) quad forall x:F(x) "continua" $
e *$Phi$ è la funzione caratteristica di $F$*.

== Teorema del Limite Centrale
*Teorema*:

Sia $x$ un'osservabile reale con distribuzione che ammette i primi due momenti. Allora la distribuzione della media campionaria $overline(x)_N$, nel limite di grandi N tende ad una distribuzione di forma universale, _indipendente da $p(x)$_.

*Dimostrazione*:

Si consideri la trasformazione
$ y=x-mu; quad y_n = sqrt(N) dot overline(y)_n = sum_i y_i/sqrt(N) $
Si noti che con questo ansatz si ha $"Var"(y_n)= sigma^2$ indipendentemente da $n$ (_la varianza è additiva, e scala con il quadrato di una eventuale costante moltiplicativa dell'osservabile_).

Utilizzando le proprietà della funzione caratteristica viste prima, definiamo:
$ Phi_n (t) eq.triple Phi_y_n (t) = Phi_y^N (t/sqrt(N)) $
da cui:
$ log(Phi_n (t)) = N log[Phi_y (t/sqrt(N))] tilde.eq N log[1+ (partial Phi_y)/(partial t) t/sqrt(N)+ (partial^2 Phi_y)/(partial t^2) t^2/(2N) + o(t/sqrt(N))^2] $
$ = N log[1+0- (sigma^2 t^2)/(2N) + o(t/sqrt(N)^2)] tilde.eq N(-(sigma^2 t^2)/(2N) + o(t/sqrt(N))^2) $
$ = -(sigma^2 t^2)/2 + N dot o(t^2/N) arrow.double log(Phi_n (t)) arrow log Phi (t) = -(sigma^2 t^2)/2 $
$ arrow.double Phi(t) = lim_(n arrow infinity) Phi_n (t) = exp(-(sigma^2 t^2)/2) $
Notiamo che $Phi(t)$ è una funzione _universale_, che non dipende da $p(x)$.
Il teorema di Paul Levy ci dice allora che la cumulante di $y_n$ convergerà ad una certa
universale $F(y)$, la cui derivata è la trasformata di Fourier inversa di $Phi(t)$.

== Distribuzione limite
Vogliamo sapere qual è la trasformata di Fourier inversa di $Phi(t)$:
$ Phi(t) = exp(-(sigma^2 t^2)/2) $
Calcoliamo esplicitamente tale distribuzione:
$ 1/(2 pi) integral_(-infinity)^infinity e^(-(sigma^2 t^2)/2 - i t x) d t = 1/(2 pi) integral_(-infinity)^infinity e^((-(sigma t - i x/sigma)^2)/2) e^(-x^2/(2 sigma^2)) d t = $
$ e^(-x^2/(2 sigma^2))/(2 pi) integral_(-infinity)^infinity e^((-(sigma t - i x/sigma)^2)/2) d t $
L'integranda è una _funzione olomorfa senza poli_. Si può perciò sostituire $z = sigma t - (i x)/sigma$, e traslare la retta di integrazione all'asse reale senza alterare il valore dell'integrale:
$ e^(-x^2/(2 sigma^2))/(2 pi sigma) integral_(-infinity)^infinity e^(-z^2/2) d z = 1/(sqrt(2 pi) sigma) e^(- x^2/(2 sigma^2)) $
Questa è chiamata *densità di probabilità Gaussiana* (o Normale).
Questa forma della distribuzione limite non dipende dalle caratteristiche della distribuzione di $x$, se non per media e varianza. Inoltre la somma di variabili Gaussiane è ancora Gaussiana, con varianza
uguale a somma varianze (come per qualunque distribuzione).

È importante non assumere che tutto segua la "legge Normale" così come è importante non assumere che le proprietà della Gaussiana
valgano per qualunque distribuzione.









