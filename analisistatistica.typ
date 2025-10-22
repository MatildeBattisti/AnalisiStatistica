#set document(title: "Appunti di Analisi Statistica dei Dati", author: "Matilde Battisti")
#set page(numbering: "1", number-align: center)
#set text(font: "Linux Libertine", size: 11pt, lang: "it")
#set heading(numbering: "1.1")

// Numerazione equazioni
#set math.equation(numbering: "(1)")

// Numera solo equazioni con label
#show math.equation.where(block: true): it => {
  if it.has("label") {
    // Usa il counter manuale invece di richiamare math.equation
    let number = counter(math.equation).display("(1)")
    block[
      #it.body
      #h(1fr)
      #number
    ]
    counter(math.equation).step()
  } else {
    it
  }
}

// Frontespizio
#align(center)[
  #text(size: 24pt, weight: "bold")[Analisi Statistica dei Dati]
  
  #v(1em)
  #text(size: 14pt)[Matilde Battisti]
  
  #v(2em)
  #text(size: 12pt)[Anno accademico 2025/2026]
]

#pagebreak()

// Indice
#outline(
  title: "Index",
  depth: 3,
  indent: auto)

#pagebreak()

// Include i capitoli
#include "introduzione.typ"
#pagebreak()
#include "capitolo1.typ"
#pagebreak()
#include "capitolo2.typ"
#pagebreak()
#include "capitolo3.typ"
#pagebreak()
#include "esercitazioni.typ"
