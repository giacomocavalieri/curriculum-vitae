#import "template.typ": *

#let main-color = rgb("#375710")
#let highlight-color = rgb("#e8efda")

// Shorthands to print entries with nicer field names
#let work-experience-entry(work) = entry(
  color: main-color,
  (
    title: work.employer,
    subtitle: work.place,
    aside: work.date,
    main-content: work.position,
    more: if "description" in work.keys() { work.description },
  ),
)
  
#let education-entry(education) = entry(
  color: main-color,
  (
    title: education.institute,
    subtitle: education.place,
    aside: education.date,
    main-content: education.name,
    more: if "description" in education.keys() { education.description },
  ),
)

#let skills-entry(skill) = [
  #skill.name: #for skill in skill.skills [
    #pill(
      background-color: highlight-color,
      text(
        fill: main-color,
        strong(skill),
      ),
    )
  ]
]

// All CV data

#let contacts = (
  (name: [Email], content: link("mailto:giacomo.cavalieri@icloud.com")),
  (name: [Telefono], content: link("tel:+39 345 2446512")),
  (name: [GitHub], content: link("https://github.com/giacomocavalieri")[giacomocavalieri]),
)

#let work-experience-entries = (
  (
    employer: [Università di Bologna],
    place: [Cesena],
    date: [Marzo 2022 - Settembre 2023],
    position: [Tutor didattico per il corso di Basi di Dati del percorso di Laurea Triennale in Ingegneria e Scienze Informatiche],
  ),
  (
    employer: [Università Ca' Foscari Venezia],
    place: [Venezia],
    date: [Aprile 2021 - Luglio 2021],
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
    date: [Luglio 2017 - Agosto 2017],
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
    skills: ("Haskell", "Scala 3", "Scala 2", "Clojure", "Java 11", "C# 9.0", "Python 3", "JavaScript", "TypeScript", "SQL", "C"),
  ),
  (
    name: [Linguistiche],
    skills: ("Italiano - madrelingua", "Inglese - C1"),
  ),
)

#show: doc => cv(
  main-color: main-color,
  highlight-color: highlight-color,
  name: "Giacomo Cavalieri",
  headshot: "images/headshot.png",
  contacts: contacts,
  doc
)

// Work experience
#section-title(highlight-color: highlight-color)[Esperienze Professionali]
#for entry in work-experience-entries {
  work-experience-entry(entry)
}

// Education
#section-title(highlight-color: highlight-color)[Istruzione]
#for entry in education-entries {
  education-entry(entry)
}

// Skills
#section-title(highlight-color: highlight-color)[Competenze]
#for entry in skills-entries {
  box(skills-entry(entry))
}
