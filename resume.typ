// --- CONSTANTS ---------------------------------------------------------------

#let font-color = color.rgb("192427")
#let main-color = color.rgb("cceac3")
#let accent-color = color.rgb("e8f3e5")

// --- DEFAULT STYLING ---------------------------------------------------------

#set text(font: "Mona Sans", fill: font-color, size: 0.9em)

/// The main title should be big and bold.
///
#show heading.where(level: 1): set text(size: 2em, weight: 700)

/// Make leve 2 titles a bit bigger and add a small vertical space below.
///
#show heading.where(level: 2): the-heading => [
  #text(size: 1.2em, the-heading) #v(0.5em)
]

// --- DATE TIME UTILITIES -----------------------------------------------------

/// Make a date with a resolution of year and month.
///
#let year-month(year, month) = (
  "year-month",
  datetime(year: year, month: month, day: 1)
)

/// Make a date with a resolution of years.
///
#let year(year) = (
  "year",
  datetime(year: year, month: 1, day: 1)
)

/// Formats a date created with `year-mont` of `year` according to its
/// resolution.
///
#let format-date(data) = {
  let format = data.at(0)
  let date = data.at(1)
  date.display(
    if format == "year-month" { "[year].[month]" } else
    if format == "year" { "[year]" }
  )
}

/// Formats a time interval between start and end.
/// If the end is `none` it simply outputs `present`.
///
#let format-time-interval(start, end) = {
  if end == none { [#format-date(start) - present] }
  else { [#format-date(start) - #format-date(end)] }
}

// --- PRETTY PRINTING THE VARIOUS DATA ----------------------------------------

/// Underlines the text with an highlighter effect that only covers half of it.
///
#let underline(color: accent-color, content) = {
  set text(weight: "bold")
  highlight(
    fill: color,
    top-edge: 0.2em,
    bottom-edge: -0.2em,
    extent: 0.2em,
    content,
  )
}

/// Puts `aside` on a small column on the left and all the remaining contents
/// on the remaining column on the right of the page.
///
#let aside(aside, ..rest) = {
  grid(
    columns: (8em, auto), column-gutter: 2em, row-gutter: 1em,
    emph(align(right, aside)), ..rest.pos().intersperse([])
  )
}

/// A vertical stack with a big default spacing.
///
#let vstack(spacing: 1.5em, ..content) = stack(
  dir: ttb,
  spacing: spacing,
  ..content
)

/// Pretty print a work experience entry.
///
#let show-work-experience(work-experience) = {
  let pretty-role = text(weight: "bold")[#work-experience.employer -- #work-experience.short-role]
  let pretty-interval = format-time-interval(work-experience.start, work-experience.end)
  aside(pretty-interval, pretty-role, work-experience.role)
}

/// Pretty print an education entry.
///
#let show-education(education) = {
  let pretty-interval = format-time-interval(education.start, education.end)
  let pretty-place = if education.place == none [] else [-- #education.place]
  let pretty-school = text(weight: "bold")[#education.school #pretty-place]
  let pretty-mark = if education.mark == none [] else [-- #education.mark]
  aside(pretty-interval, pretty-school, [#education.degree #pretty-mark])
}

/// Pretty print a language entry.
///
#let show-language(language-data) = [
  #language-data.language -- #language-data.level
]

/// A section of the cv.
///
#let show-section(title, ..content) = vstack(
  underline(color: accent-color)[== #title],
  vstack(..content),
)

/// --- THE CV DATA --------------------------------------------------------------

#let skills = (
  technical: ("Gleam", "Rust", "Haskell", "Elm", "Scala", "Java", "JavaScript", "Python"),
  soft: ("Empathy", "Communication", "Documentation"),
  languages: (
    (language: "Italian", level: "native speaker"),
    (language: "English", level: "C1"),
  ),
)

#let work-experience-entries = (
  (
    employer: "Gleam",
    place: none,
    start: year-month(2024, 1),
    end: none,
    short-role: "Core team member",
    role: [
      Gleam is a statically typed, functional programming language that can be
      compiled to Erlang and JavaScript.
      I am a member of Gleam's core team and I have been regularly contributing
      the the language compiler.
    ],
  ),
  (
    employer: "TwinLogix",
    place: "Cesena",
    start: year-month(2023, 7),
    end: year-month(2023, 11),
    short-role: "TypeScript Developer",
    role: [
      TwinLogix is a company based in Cesena, member of the
      #emph("DIR (Distretto dell'Informatica Romagnolo)"). I worked on the
      #emph(link("https://github.com/mondrian-framework/mondrian-framework", "Mondrian Framework"))
      helping with a rewrite of its core internals and improving its
      documentation.
    ],
  ),
  (
    employer: "Università di Bologna",
    place: "Cesena",
    start: year-month(2022, 3),
    end: year-month(2023, 9),
    short-role: "Teaching assistant",
    role: [
      I have covered the role of teaching assistant for the Database course of
      the Computer Science and Engineering Course.
      I reviewed exams, graded the students' projects and carried out lab
      lectures.
    ],
  ),
  (
    employer: "Università Ca' Foscari Venezia",
    place: "Venezia",
    start: year-month(2021, 4),
    end: year-month(2021, 7),
    short-role: "JavaScript Developer",
    role: [
      With a team of three friends I have developed the online japanese
      dictionary #emph(link("https://jisho.unive.it", "Cafoscari Jisho Web")).
      This project was commissioned by professor Marcella Mariotti, from
      Ca' Foscari's Department of Asian and North African Studies.
    ],
  ),
)

#let education-entries = (
  (
    school: "Università di Bologna",
    place: "Cesena",
    start: year(2020),
    end: year(2023),
    degree: "Master's Degree in Computer Science and Engineering",
    mark: "110/110 cum laude",
  ),
  (
    school: "Università di Bologna",
    place: "Cesena",
    start: year(2017),
    end: year(2020),
    degree: "Bachelor's Degree in Computer Science and Engineering",
    mark: "110/110 cum laude",
  ),
  (
    school: "Liceo Scientifico A. Righi",
    place: "Cesena",
    start: year(2012),
    end: year(2017),
    degree: "High school diploma in scientific studies",
    mark: "100/100",
  )
)

#let contacts = (
  (
    kind: "Phone",
    value: link("tel:+393452446512", "+39 345 244 6512"),
  ),
  (
    kind: "Email",
    value: link("mailto:giacomo.cavalieri@icloud.com", "giacomo.cavalieri@icloud.com"),
  ),
  (
    kind: "GitHub",
    value: link("https://github.com/giacomocavalieri", "@giacomocavalieri"),
  ),
)

#let introduction = [
  Hello! I am an Italian software developer with a soft spot for functional
  programming languages.\
  Trying my best to write good and well documented code.\
  Always striving to treat people with kindness, respect and honesty.
]

/// --- LAY OUT THE CV ------------------------------------------------

#vstack(
  // Make the spacing bigger to give some room to each section.
  spacing: 3em,

  // A big bold title underlined with the main color.
  underline(color: main-color)[= Giacomo Cavalieri],

  // Add the introduction and contacts.
  introduction,
  vstack(..contacts.map(c => aside(c.kind, c.value))),

  // Skills section.
  show-section(
    "Skills",
    aside("Technical", skills.technical.join(", ")),
    aside("Soft skills", skills.soft.join(", ")),
    aside("Languages", skills.languages.map(show-language).join(", ")),
  ),

  // Work experience section.
  show-section(
    "Work Experience",
    ..work-experience-entries.map(show-work-experience),
  ),

  // Education section.
  show-section("Education", ..education-entries.map(show-education))
)
