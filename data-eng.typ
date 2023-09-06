#let contacts = (
  (name: [Email], content: link("mailto:giacomo.cavalieri@icloud.com")),
  (name: [Phone], content: link("tel:+39 345 2446512")),
  (name: [GitHub], content: link("https://github.com/giacomocavalieri")[giacomocavalieri]),
)

#let work-experience-entries = (
  (
    employer: [Università di Bologna],
    place: [Cesena],
    date: [march 2022 - september 2023],
    position: [Teaching assistant for the Databases course of the Bachelor's Degree on Computer Science and Engineering],
  ),
  (
    employer: [Università Ca' Foscari Venezia],
    place: [Venezia],
    date: [april 2021 - july 2021],
    position: [Development of the #link("https://jisho.unive.it")[_Ca' Foscari Jisho Web_] website],
  ),
)

#let education-entries = (
  (
    institute: [Università di Bologna],
    place: [Cesena],
    date: [2020 - 2023],
    name: [Master's Degree in Computer Science and Engineering],
    description: [Final mark: 110/110 cum laude],
  ),
  (
    institute: [Università di Bologna],
    place: [Cesena],
    date: [2017 - 2020],
    name: [Bachelor's Degree in Computer Science and Engineering],
    description: [Final mark: 110/110 cum laude],
  ),
  (
    institute: [Central School of English],
    place: [London],
    date: [july 2017 - august 2017],
    name: [Study abroad period],
  ),
  (
    institute: [Liceo Scientifico A. Righi],
    place: [Cesena],
    date: [2012 - 2017],
    name: [High school diploma in scientific studies],
    description: [Final mark: 100/100 cum laude],
  ),
)

#let skills-entries = (
  (
    name: [Technical],
    skills: ("Haskell", "Gleam", "Scala 3", "Scala 2", "Clojure", "Elm", "Java 11", "C# 9.0", "Python 3", "JavaScript", "TypeScript", "SQL", "C"),
  ),
  (
    name: [Languages],
    skills: ("Italian - native speaker", "English - C1"),
  ),
)