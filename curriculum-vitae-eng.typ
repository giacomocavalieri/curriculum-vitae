#import "template.typ": *
#import "commons.typ": *
#import "data-eng.typ": *

#show: doc => cv(
  main-color: main-color,
  highlight-color: highlight-color,
  name: "Giacomo Cavalieri",
  headshot: "images/headshot.png",
  contacts: contacts,
  doc
)

// Work experience
#section-title(highlight-color: highlight-color)[Working Experience]
#for entry in work-experience-entries {
  work-experience-entry(entry)
}

// Education
#section-title(highlight-color: highlight-color)[Education]
#for entry in education-entries {
  education-entry(entry)
}

// Skills
#section-title(highlight-color: highlight-color)[Skills]
#for entry in skills-entries {
  box(skills-entry(entry))
}
