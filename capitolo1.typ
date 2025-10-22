= Dagli eventi alle osservabili fisiche

Abbiamo parlato di probabilità di singoli eventi, definiti come sottoinsiemi di un insieme di riferimento $S$. Tali sottoinsiemi possono rappresentare _eventi elementari_ o l'_unione di vari possibili eventi elementari_. In questo contesto allora un evento è un sottoinsieme $A subset S$ e $P(A)$ è la probabilità che l'evento accada.

Molto spesso però gli eventi di interesse in fisica consistono nell'aver compiuto una *misura di una particolare osservabile* $bold(X)$ e *aver trovato un particolare valore* $bold(x)$ *appartenente a un insieme* $bold(O_X)$ finito o continuo. Un'osservabile definisce allora una famiglia di sottoinsiemi di $S$, ognuno corrispondente a un certo specifico valore $x in X$. Formalmente:

$ X: S arrow RR $

e ad ogni esito $s in S$ corrisponde un valore numerico $x = X(s)$.

Si dice che l'osservabile $X$ è una *osservabile aleatoria/casuale/random*, se esiste ben definita (cioè misurabile sperimentalmente) la probabilità di:

- tutti i suoi possibili _valori_ se discreta;
- tutti i suoi _insiemi di valori_ (sottoinsiemi di $O_X$) se continua.

Se un'osservabile $X$ è aleatoria cioè si possono eseguire inferenze di tipo statistico a partire dalle sue osservazioni. Formalmente:

$ forall A subset O_x quad exists P(x in A) = lim_(N arrow infinity) (n(x in A))/N $

È da notare che non è sufficiente che esista la probabilità per alcuni valori per rendere un'osservabile aleatoria; la probabilità deve esistere per qualsiasi sottoinsieme misurabile di $O_X$.

== Variabili aleatorie e statistiche in matematica

Un'*osservabile fisica* viene modellata matematicamente come una *funzione misurabile* $X$:

$ X: S arrow O_X $

dove:

- $bold(S)$ è lo spazio degli esiti elementari (spazio dei mondi possibili);
- $bold(Sigma)$ è la $sigma$-algebra di sottoinsiemi di $S$ per i quali la probabilità è definita;
- $bold(P)$ è la misura di probabilità su $(S, Sigma)$;
- $bold(O_X subset RR)$ è lo spazio dei valori possibili dell'osservabile.

Affinché $X$ sia una *variabile aleatoria*, deve valere:

$ forall A subset O_X quad X^(-1)(A) subset Sigma $ <eq-var-aleatoria>

Questa condizione garantisce che la probabilità:

$ P(X^(-1)(A)) $

sia ben definita.

$X$ è quindi infine la funzione che associa a un particolare evento ("stato osservabile" del mondo) il valore di una certa particolare osservabile.

Notiamo che la condizione sopra è banale se $P$ è definita su tutte le parti di $S$.

==== Funzioni di variabili aleatorie

Se $X$ è una variabile aleatoria e $f$ è una funzione misurabile, allora anche la funzione composta

$ Y = f(X) $

è una variabile aleatoria. Infatti, per ogni $A subset O_X$,

$ Y^(-1)(A) = X^(-1)(f^(-1)(A)) $

e poiché $X$ è misurabile e $f^(-1)$ è un insieme misurabile, allora anche $Y^(-1)(A) in Sigma$; $Y$ eredita la misurabilità da $X$. In altre parole, *ogni funzione di una variabile aleatoria è una variabile aleatoria*.

Questo vale anche per qualunque *statistica* $f(x, y, dots)$ di più variabili casuali: è banalmente una variabile aleatoria essa stessa. Questa definizione matematica si trasferisce senza variazioni alle osservabili fisiche: una statistica calcolata sulle osservabili è essa stessa una quantità osservabile.

== Distribuzioni di probabilità di un'osservabile

Finora abbiamo descritto la probabilità come una *funzione di insiemi*: ad ogni sottoinsieme $A subset.eq S$ (evento) viene associato un numero $P(A)$ che rappresenta la probabilità dell'evento stesso.

Spesso però risulta utile introdurre una descrizione "puntuale" della probabilità, cioè una funzione che dipende direttamente dai _valori_ assunti da una determinata osservabile aleatoria $X$.

=== Osservabili discrete: funzione di massa

Se l'osservabile $X$ assume un insieme discreto di valori $O_X = {x_1, x_2, dots}$, definiamo la sua *distribuzione di probabilità discreta* (o *funzione di massa di probabilità*, *pmf*) come:

$ "pmf"(x) equiv P(E: X=x) $ <eq-pmf>

Talvolta in fisica si usa la notazione più compatta $P(x)$, ma è importante ricordare che $"pmf"(x)$ non è la probabilità di un evento nel senso assiomatico (sempre definita su un insieme), bensì una _funzione_ che riassume le probabilità degli eventi elementari ${X = x}$.

La proprietà di *additività* della misura di probabilità permette di calcolare la probabilità che $X$ appartenga a un qualunque sottoinsieme $E subset O_X$ come:

$ P(E subset O_X) = sum_(x in E) "pmf"(x) $ <eq-additività>

Lo spazio $O_X$ dei valori assunti da un'osservabile può essere discreto o continuo; ne sono esempi ${0,1}$, ${"testa", "croce"}$, $NN$, $RR$, ecc. Si evince dunque che la "somma" va definita opportunamente a seconda dell'insieme: è una somma ordinaria soltanto se è discreto, mentre diventa un integrale nel caso di _outcomes_ continui.

Gli esempi di dadi e carte costituiscono un buon esempio di pmf, in particolare di _distribuzioni uniformi_.

=== Osservabili continue: densità di probabilità

In molti casi sperimentali le osservabili assumono valori in uno *spazio continuo* di risultati, ad esempio $O_X subset RR$ o $RR^N$.

In realtà, ogni misura fisica reale ha precisione finita e quindi produce un insieme discreto di valori possibili, ma la rappresentazione continua è una _approssimazione teorica_ molto comoda.

Nel caso continuo, la probabilità che un'osservabile assuma un _valore esatto_ $x_0$ è nulla:

$ P(X = x_0) = 0 $

In tale contesto la funzione di massa $"pmf"(x) = P_X (x)$ non è più utile per descrivere la distribuzione. Per caratterizzare completamente la legge di probabilità servirebbe infatti conoscere $P(X in A)$ per _ogni_ sottoinsieme $A$ misurabile di $O_X$.

==== Definizione di densità di probabilità (pdf)

A fronte di quanto detto, introduciamo una funzione reale, positiva e integrabile chiamata *densità di probabilità* (in inglese _probability density function_, *pdf*) $bold(p_X (x))$:

$ P(x in A) = integral_A p_X (x) dif x $ <eq-pdf>

per ogni insieme misurabile $A subset.eq O_X$, con integrale inteso nel senso di Lebesgue. In termini intuitivi, $p_X (x) dif x$ rappresenta la probabilità che $X$ assuma un valore compreso tra $x$ e $x + dif x$.

La definizione si estende in modo naturale a $n$ osservabili.

==== Osservazione fisica

Nella pratica, ogni osservabile fisica ha un insieme discreto (o finitamente risolto) di possibili valori, e quindi le sottigliezze matematiche relative alla misura di Lebesgue o all'esistenza di insiemi non misurabili non hanno un vero significato fisico.

La rappresentazione continua su $RR$ è un'_astrazione ideale_ che semplifica i calcoli e permette di trattare i limiti di risoluzione come infinitesimi.

==== Proprietà della densità di probabilità

Riportiamo alcune proprietà fondamentali della _pdf_:

- $p_X (x): p_X (x) >= 0$;
- L'unità di misura è tale che $[x] ==> [P(x)] = 1/[x]$;
- *non è* $p_X (x) <= 1$, infatti non ha né senso dimensionalmente, né è normalizzato a priori l'integrale;
- $0 <= integral_A p_x (x) dif x <= 1$;

cioè quello che si evince è che *la _pdf_ non soddisfa gli assiomi di Kolmogorov*.

==== Distribuzioni generalizzate: la delta di Dirac

Si può estendere il concetto di densità di probabilità introducendo _distribuzioni generalizzate_ come la *delta di Dirac*.

La funzione $delta(x - x_0)$ è definita come quella "densità" che soddisfa:

$ P(X in A) = cases(
  1 quad &"se" x_0 in A,
  0 quad &"se" x_0 in.not A
) $ <eq-delta>

cioè concentra tutta la probabilità nel punto $x_0$.

In questo senso, anche una distribuzione discreta può essere rappresentata formalmente da una densità del tipo:

$ p_X (x) = sum_i p_i thin delta(x - x_i) $

dove $p_i = P(X = x_i)$. Questo permette di trattare con un unico formalismo sia casi discreti, sia continui o misti.

== Distribuzioni di osservabili multiple

Si può dimostrare che l'espressione della probabilità condizionata e la formula di Bayes si estendono direttamente alle funzioni densità:

$ p(x|y) = (p(x,y))/(p(y)) = p(y|x) (p(x))/(p(y)) $ <eq-bayes-pdf>

e per osservabili indipendenti vale

$ p(x,y) = p(x) p(y) $

Conoscendo la definizione insiemistica, vogliamo trovare l'equivalente continuo della probabilità $P(A sect B)$.

=== Distribuzione di probabilità congiunta

Supponiamo di avere due osservabili $X$ e $Y$. Posso considerare $P(X=x sect Y=y)$ come _funzione_ $bold(P_(X Y)(x,y))$ al variare di $x$ e $y$ nei rispettivi insiemi di esistenza. Questa si chiama *distribuzione* o *funzione di probabilità congiunta* di $X$ e $Y$.

Per semplificare la notazione, questa è spesso riportata come $p(x,y)$, ma è importante notare che si tratta ora di una *funzione* definita su $O_1 dot O_2$.

Ovviamente si può generalizzare a qualunque numero di osservabili:

$ P(X_1, X_2, dots, X_N) $

Abbiamo già definito l'indipendenza di due o più eventi casuali ponendo la condizione $P(A sect B) = P(A)P(B)$.

Due distribuzioni di probabilità definite sullo stesso $S$ si dicono indipendenti se per ogni $A$, $B$ si ha che

$ P((x in A) sect (y in B)) = P(x in A) P(y in B) $

Da ciò segue dunque che

$ P_(X Y)(x, y) = P(x in A) P(y in B) $

(vedremo in seguito perché può non essere sufficiente).

=== Distribuzione di probabilità condizionata

La distribuzione di probabilità condizionata è scritta come

$ P_X (x|y) P_Y (y) = P_(X Y)(x, y) $ <eq-cond-dist>

che si estende banalmente a $n$ variabili:

$ P_(X^M)(x_1 dots x_m | y_1 dots y_n) P_(Y_1)(y_1 | y_2 dots y_n) = P_(X^M, Y_1)(x_1 dots x_m, y_1 | y_2 dots y_n) $

=== Marginalizzazione

Considerata una partizione ${Y_i}$ di $O_Y$ si ha:

$ P(X=x) = sum_i P((X=x)|(Y in Y_i)) P(Y in Y_i) = sum_i P((X=x) sect (Y in Y_i)) $ <eq-marg>

Se $Y$ ha valori in uno spazio discreto, si può prendere in particolare $Y_i = {y_i}$, e allora si ha:

$ P_X (x) = sum_i P_(X Y)(x, y_i) = sum_i P_X (x|y_i) P_Y (y_i) $

Questa operazione si chiama *marginalizzazione*, e la $P_X (x)$ è chiamata *distribuzione marginale di* $bold(P_(X Y)(x,y))$ *rispetto a $y$*.

Si noti che la seconda uguaglianza corrisponde alla legge della probabilità totale.

== Funzione cumulante

In una dimensione, ad esempio $RR$, si può definire utilmente la *funzione cumulante (cdf)* come

$ F_X (x) equiv P(X in (-infinity, x]) = integral_(-infinity)^x p_X (x') dif x' $ <eq-cdf>

È facile vedere che $F(x)$ è:

- monotona crescente;
- $0 <= F(x) <= 1$;
- $p(x) = (dif F(x))/(dif x)$.

Nella pratica, la funzione cumulante è molto utile perché è più spesso facile da calcolare rispetto alla densità.