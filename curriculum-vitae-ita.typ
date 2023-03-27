#import "template.typ": *
#import "commons.typ": *
#import "data-ita.typ": *

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
