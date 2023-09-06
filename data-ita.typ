#let contacts = (
  (name: [Email], content: link("mailto:giacomo.cavalieri@icloud.com")),
  (name: [Telefono], content: link("tel:+39 345 2446512")),
  (name: [GitHub], content: link("https://github.com/giacomocavalieri")[giacomocavalieri]),
)

#let work-experience-entries = (
  (
    employer: [Università di Bologna],
    place: [Cesena],
    date: [marzo 2022 - settembre 2023],
    position: [Tutor didattico per il corso di Basi di Dati del percorso di Laurea Triennale in Ingegneria e Scienze Informatiche],
  ),
  (
    employer: [Università Ca' Foscari Venezia],
    place: [Venezia],
    date: [aprile 2021 - luglio 2021],
    position: [Realizzazione della web app #link("https://jisho.unive.it")[_Ca' Foscari Jisho Web_]],
  ),
)

#let education-entries = (
  (
    institute: [Università di Bologna],
    place: [Cesena],
    date: [2020 - 2023],
    name: [Laurea Magistrale in Ingegneria e Scienze Informatiche],
    description: [Laureato con votazione 110L con tesi "Gestione degli effetti in linguaggi di programmazione funzionale: tecniche di modellazione e interpretazione"],
  ),
  (
    institute: [Università di Bologna],
    place: [Cesena],
    date: [2017 - 2020],
    name: [Laurea in Ingegneria e Scienze Informatiche],
    description: [Laureato con votazione 110L con tesi "Quantum Computing per la rappresentazione di immagini ed edge detection"],
  ),
  (
    institute: [Central School of English],
    place: [Londra],
    date: [luglio 2017 - agosto 2017],
    name: [Soggiorno studio],
  ),
  (
    institute: [Liceo Scientifico A. Righi],
    place: [Cesena],
    date: [2012 - 2017],
    name: [Diploma di maturità scientifica],
    description: [Diplomato con votazione 100L],
  ),
)

#let skills-entries = (
  (
    name: [Tecniche],
    skills: ("Haskell", "Gleam", "Scala 3", "Scala 2", "Clojure", "Elm", "Java 11", "C# 9.0", "Python 3", "JavaScript", "TypeScript", "SQL", "C"),
  ),
  (
    name: [Linguistiche],
    skills: ("Italiano - madrelingua", "Inglese - C1"),
  ),
)