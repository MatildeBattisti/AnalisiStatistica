= Inferenza e probabilità

== Inferenza in Fisica

In Fisica, si assume l'esistenza di _leggi fisiche_ che determinano i valori e l'evoluzione temporale delle *osservabili* ($x, y, z$). Queste leggi sono parametrizzate da *parametri* ($mu, nu, dots$), quantità fisiche reali ma inaccessibili all'osservazione diretta. Le osservabili, al contrario, sono quantità misurabili attraverso qualche definizione operativa.

L'analisi dei dati è intrinseca al _paradigma scientifico galileiano_, il cui flusso si sviluppa come segue:

$ "Teoria" arrow "Predizione" arrow "Osservazione" arrow bold("Inferenza") arrow "Teoria" $

L'Inferenza consiste nel dedurre affermazioni sui parametri ignoti $mu in A$ a partire dalle osservabili $x in X$.

=== Inferenza non-deterministica e incertezza

Supponiamo che la relazione tra osservabili e parametri sia *deterministica*:

$ (x, y, dots) = f(mu, nu, dots) $ <eq-deterministica>

Ciò implica *inferenza deterministica*:

$ (mu, nu, dots) = f^(-1)(x, y, dots) $ <eq-inf-deterministica>

Tuttavia, l'inferenza è spesso *non-deterministica* per due motivi principali:

+ La relazione $f$ _non è invertibile_ a causa dell'*indeterminazione*: questa rende l'informazione incompleta, generando ambiguità poiché le osservabili non determinano univocamente i parametri;
+ La relazione $f$ _non è ripetibile o deterministica_, indicando la presenza di "errori".

È importante sottolineare che *l'indeterminazione non ha origine statistica*.

In questi casi, si può esclusivamente fare un'inferenza che produce come risultato una _regione nello spazio dei parametri $A$_; il risultato è affetto dunque da un'incertezza non statistica. Tale risultato può essere ottenuto come immagine inversa dell'osservazione $x$, effettuando una sorta di "propagazione all'indietro" dell'errore.

=== L'inferenza statistica

L'*inferenza* (anche non statistica) consiste nel dire qualcosa sui parametri a partire dalle osservabili. Si parla di *inferenza statistica* quando qualche osservabile, non solo non è determinata, ma ha un comportamento che si può esprimere tramite una *distribuzione di probabilità* $P(x, y, z; mu, nu, Theta)$ dipendente dai parametri. L'osservabile che rispetta queste condizioni si dice *aleatoria* / *casuale* / *random*.

#figure( 
  image("immagini/InferenzaProbabilita.png", width: 50%),
  caption: [Schema relazionale di osservabili e parametri.]
)

È fondamentale ricordare che solo le osservabili si misurano (si osservano), mentre i parametri si possono *stimare o inferire* a partire dalle misure. In statistica, tale inferenza si basa sul calcolo di opportune funzioni delle osservabili, dette *statistiche* $s(x, y, dots)$. Le statistiche, in quanto funzioni di variabili aleatorie, sono anch'esse variabili aleatorie, cioè hanno distribuzioni di probabilità.

La *scienza statistica* è lo studio del comportamento delle statistiche, e l'_inferenza statistica_ è il capitolo che usa queste statistiche per compiere inferenze.

L'Inferenza, intesa come il determinare i parametri a partire da osservabili aleatorie, è solo un capitolo della disciplina Statistica. Altri aspetti includono:

- *Teoria della Probabilità*: scienza che indaga le proprietà delle "statistiche";
- *Statistica predittiva*: scienza che si occupa della predizione di altre osservabili;
- *Teoria della decisione*: scienza che permette di suggerire azioni appropriate od ottimali.

Concetti più recenti, come quello di *"Data Science"*, mirano a fare predizioni assumendo un modello comodo, senza necessariamente richiedere un'inferenza sui parametri ignoti o la conoscenza della legge di probabilità.

=== Diversi Tipi di Inferenza Statistica

L'inferenza può assumere varie forme, qui elencate in ordine inverso di ricchezza dell'output.

==== Inferenza funzionale

Si tratta di un'inferenza che non finisce nello spazio dei parametri:

$ s(x) : x arrow.bar f_x (mu); quad f: A arrow RR $

Questa statistica associa uno "score" (plausibilità) ad ogni possibile stato di $mu$.

==== Stima intervallare

Quest'inferenza definisce limite superiore e/o inferiore dell'intervallo che contiene il valore del parametro; si dice allora che $Q$ è il sottoinsieme di valori plausibili nello spazio dei parametri.

$ s(x) : x arrow.bar Q_x; quad Q_x subset A $

L'intervallo potrà essere dei seguenti tipi

$ Q_x = [mu_min (x), mu_max], quad (-infinity, mu_max], quad [mu_min (x), +infinity) $

da cui si evince che:

- esiste una statistica per ciascun limite;
- l'intervallo cambia ad ogni misura perché i parametri sono funzione dell'osservabile.

==== Stima puntuale

Produce un singolo valore che rappresenta il "miglior valore" per il parametro ignoto.

$ s(x) : x arrow.bar mu_x; quad mu_x in A $

==== Test di ipotesi

Dato un set di _ipotesi predefinite_ $H$, questo tipo di inferenza determina quale sia la favorita dalle osservazioni; può essere visto quindi come un processo di "classificazione".

$ s_({H_i}) (x) : x arrow.bar i; quad H_i subset A quad forall i in {0, dots, n} $

==== Goodness-Of-Fit (GOF)

Valuta l'accordo dei dati con una certa ipotesi fissata $H$.

$ s_H (x) : x arrow.bar y; quad y in [0, 1] quad (H subset A) $

Un esempio di questa inferenza è il _p-value_.

==== Test di Goodness-Of-Fit

Valuta *se* i dati sono in accordo con una certa ipotesi $H$ oppure no.

$ s_H (x) : x arrow.bar y; quad y in {0,1} quad (H subset A) $

Ribadiamo, stavolta con più cognizione di causa, che esistono due tipi di incertezza: l'incertezza sulla conclusione dell'inferenza è chiamata *incertezza statistica*; se la legge di probabilità dell'osservabile non è completamente nota, si parla invece di *incertezza sistematica*.

== Probabilità

Vi sono due punti fondamentali nell'analisi statistica dei dati:

- determinare quale sia la distribuzione di probabilità $P(x, mu)$;
- scegliere l'inferenza giusta per studiare il problema.

È allora giunto il momento di parlare del concetto di *probabilità* di un'osservabile: la sua _definizione operativa_, prodotta a partire da quella matematica, presenta grandi ambiguità a seconda del contesto in cui viene usata.

=== Definizione frequentista di probabilità

Per definire la probabilità in modo operativo, si considera una procedura di osservazione sperimentale ben definita che è possibile replicare illimitatamente; tale insieme di ripetizioni è detto *ensemble*. Ogni ripetizione produce un valore di una certa osservabile $x in X$.

Sia $E subset X$ un sottoinsieme di possibili risultati di $x$ chiamato *evento*, allora ogni osservazione dell'ensemble è ben definita se si verifica $E$.

==== Definizione operativa frequentista

La definizione *frequentista* (Neyman, Pearson, Von Mises 1939) definisce la Probabilità dell'evento $E$ come:

$ P(E) = lim_(N arrow infinity) n(E)/N $ <eq-freq>

dove $n(E)$ è il numero di casi in cui si osserva l'evento $E$ in $N$ tentativi.

È importante specificare che il limite ha significato _fisico_ (analogo alla definizione di velocità in meccanica), non matematico. Inoltre *il limite non deve dipendere da come si selezionano gli $N$ tentativi*.

Vediamo alcune proprietà della definizione frequentista:

- $P(E)$ dipende dall'ensemble $N$ (non un difetto);
- $P(E)$ è una quantità fisica misurabile (come massa o velocità), e perciò ha senso parlarne in fisica, e discuterne le proprietà;
- questa definizione è compatibile con quella adottata dalla Meccanica Quantistica (principio di Born);
- $P(E)$ si può definire solo per quantità osservabili $x$, non per i parametri ignoti $mu$.

=== La probabilità di Kolmogorov

In matematica si definisce formalmente una probabilità su un insieme $S$ come una qualunque *funzione di insieme $P$*, definita su una $sigma$-algebra di sottoinsiemi di $S$, avente le seguenti proprietà:

+ $bold(forall A subset S), P(A) >= 0$;
+ $bold(P(S) = 1)$;
+ $bold(forall {A_i}_(i in NN): A_i subset S), A_i inter A_j = emptyset$ $bold(forall i != j ==> P(union.big_i A_i) = sum_i P(A_i))$.

dette *assiomi di Kolmogorov*.

La probabilità frequentista verifica banalmente questi assiomi, perciò le si applicano tutti i teoremi della teoria matematica di Kolmogorov.

Nel contesto fisico possiamo allora considerare:

- $S$ come lo spazio di tutte le possibili osservazioni sperimentali;
- $A$ come un insieme di potenziali osservazioni;
- l'*intersezione* come un AND di due letture e l'*unione* come l'OR di esse.

=== La probabilità Bayesiana

La probabilità frequentista non è l'unico concetto che soddisfa gli assiomi di Kolmogorov. Abbiamo infatti preannunciato come, alla stessa definizione matematica di probabilità, possano corrispondere più definizioni operative.

Tra queste figura la definizione *Bayesiana* di probabilità, la quale utilizza un concetto differente da quello di Von Mises, indicato come *degree of belief* (*d.o.f* o *credibilità*):

$ pi(x): "degree of belief di un soggetto nel fatto che la quantità abbia valore" x $

==== Proprietà della probabilità Bayesiana

La probabilità Bayesiana (Bayes, Ramsey, De Finetti ...) è considerata essere una definizione _soggettiva_ di probabilità.

Riassumiamo le sue proprietà principali:

- è costruita sul principio che *eventi su cui si hanno informazioni equivalenti sono per definizione equiprobabili*. Ad esempio, se si ha la stessa informazione su $x_1$ e $x_2$, allora $pi(x_1) = pi(x_2)$;
- è applicabile a qualunque quantità, _anche non osservabile_;
- intuitivamente rappresenta l'informazione che il soggetto ha su $x$;
- è stata dimostrata formalmente essere una probabilità di Kolmogorov;
- non dipende da un ensemble, ma *dipende dal soggetto*;
- permette una formulazione dell'inferenza statistica basata sulla determinazione di $pi$ per i parametri ignoti.

=== Teoremi sulla probabilità

Riprendendo gli assiomi di Kolmogorov, si possono dimostrare alcuni semplici teoremi sulla probabilità.

==== Probabilità del complementare

$ bold(P(overline(A)) = 1 - P(A)) $ <eq-complementare>

Il teorema è dimostrato da

$ "K3:" quad P(A) + P(overline(A)) = P(A union overline(A)) = P(S) $

$ "K2:" quad P(A) + P(overline(A)) = 1 ==> P(overline(A)) = 1 - P(A) $

==== Limite inferiore e superiore della probabilità

$ bold(0 <= P(A) <= 1) $ <eq-limiti>

dal precedente teorema.

==== Probabilità dell'insieme vuoto

$ bold(P(emptyset) = 0) $ <eq-vuoto>

dimostrato dal primo teorema, usando che l'insieme vuoto è il complementare di $S$.

==== Probabilità del sottoinsieme

$ bold(A subset B ==> P(A) <= P(B)) $ <eq-sottoinsieme>

dimostrato da

$ B = A union (B without A) $

$ "K3:" quad P(B) = P(A) + P(B without A) >= P(A) $

==== Probabilità dell'unione

$ bold(P(A union B) = P(A) + P(B) - P(A sect B)) $ <eq-unione>

da

$ A union B = A union (B without A) ==> P(A union B) = P(A) + P(B without A) $

$ (B without A) union (A sect B) = B ==> P(B without A) = P(B) - P(A sect B) $

=== Probabilità condizionata

La *probabilità condizionata* $bold(P(A|B))$ è la probabilità che si verifichi un evento $A$ sotto la condizione che si sia verificato l'evento $B$ (con $P(B)>0$).

$ P(A|B) = (P(A sect B))/(P(B)) quad "ovvero" quad P(A sect B) = P(A|B) dot P(B) $ <eq-cond>

$P(A|B)$ si legge "probabilità di $A$ dato $B$"; si tratta solo di una _restrizione della probabilità a un ensemble più piccolo_, per cui non implica una relazione causale o temporale tra $B$ e $A$.

È importante notare che *$bold(B)$ deve essere un sottoinsieme in uno spazio su cui è definita la probabilità $bold(P)$*; ad esempio $P(x|mu)$ non è una probabilità perché $mu$ è un parametro, non un'osservabile!

La funzione di insieme $P_B (A) equiv P(A|B)$ è una probabilità del senso di Kolmogorov, definita sullo spazio $S$. Rispetta infatti gli assiomi:

+ $P(A|B) >= 0$: $P(A sect B) >= 0$ e $P(B)>0$;
+ $P_B (S) = P(S|B) = (P(S sect B))/(P(B)) = (P(B))/(P(B)) = 1$;
+ $P_B (A union C) = (P((A union C) sect B))/(P(B)) = (P((A sect B) union (C sect B)))/(P(B)) = (P(A sect B) + P(C sect B))/(P(B)) = P_B (A) + P_B (C)$.

Vediamo alcune leggi e proprietà ulteriori che si possono evincere dalla definizione di probabilità condizionata.

==== Legge della Probabilità Totale

Se ${A_i}$ è una _partizione_ (finita o numerabile) dello spazio $S$, per cui $S = union.big_i A_i$, allora la probabilità di un evento $B$ è data da:

$ P(B) = sum_i P(B sect A_i) = sum_i P(B|A_i) dot P(A_i) $ <eq-prob-totale>

#figure(
  image("immagini/teorema_probabilità_totale.jpg", width: 50%),
  caption: [Rappresentazione grafica del teorema della probabilità totale.]
)

==== Eventi Indipendenti

Due eventi $A$ e $B$ si dicono *indipendenti* se:

$ P(A|B) = P(A) $ <eq-indipendenti>

o equivalentemente se

$ P(A sect B) = P(A) dot P(B) $

Questa è detta *legge del prodotto di probabilità*. La condizione è simmetrica, per cui ne segue anche che $P(B|A) = P(B)$.

Ovviamente la legge è generalizzabile al caso di più sottoinsiemi $A_i dots A_n$, per cui

$ P(A_1 sect dots sect A_n) = product_(i=1)^n P(A_i) $

Infine è da notare che:

- un set di eventi a due a due indipendenti non è necessariamente un "set indipendente";
- _se due variabili sono indipendenti non vuol dire che siano scorrelate_.

==== Teorema di Bayes

Scrivendo la probabilità dell'intersezione $P(A sect B)$ in due modi diversi:

$ P(A sect B) = P(B|A) dot P(A) = P(A|B) dot P(B) $

si deriva il *teorema di Bayes*

$ P(B|A) = (P(A|B) dot P(B))/(P(A)) $ <eq-bayes>

Nota bene:

- se $A$ e $B$ sono indipendenti, il teorema diventa banale;
- *non* è il teorema di Bayes a caratterizzare la probabilità Bayesiana.