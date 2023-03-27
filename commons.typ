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
