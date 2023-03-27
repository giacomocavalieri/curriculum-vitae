#let serif-font = "DM Serif Display"
#let sans-serif-font = "Source Sans Pro"
#let line-spacing = 0.65em

#let with-small-right-col(left, right) = grid(
  columns: (1fr, auto),
  column-gutter: 1em,
  left,
  right,
)

#let section-title(
  highlight-color: rgb(0,0,0,0),
  title,
) = rect(
  stroke: (bottom: highlight-color + 0.8em),
  move(
    dy: 0.3em,
    text(
      size: 1.3em, 
      font: serif-font,
      heading(level: 2, title),
    ),
  ),
)

#let entry-title(
  color: rgb(0,0,0),
  title,
) = text(
  size: 1.1em,
  text(fill: color, heading(level: 3, title)),
)

#let entry(
  color: rgb(0,0,0),
  entry,
) = {
  let content = (
    with-small-right-col(
      entry-title(color: color)[#entry.title - #entry.subtitle],
      emph(entry.aside),
    ),
    emph(entry.main-content),
  )

  if "more" in entry.keys() and entry.more != none {
    content.push(entry.more)
  }

  stack(
    dir: ttb,
    spacing: line-spacing,
    ..content,
  )
}

#let pill(background-color: rgb(0,0,0,0), content) = box(
  content,
  fill: background-color,
  inset: 0.3em,
  baseline: 0.3em,
  radius: 50%,
)

#let pretty-link(
  color,
  highlight-color,
  link,
) = box(
  rect(
    inset: 0.1em,
    stroke: (bottom: highlight-color + 0.3em),
    text(fill: color, size: 0.9em, strong(link)),
  )
)

#let cv(
  name: none,
  headshot: none,
  contacts: (),
  main-color: rgb(0,0,0),
  highlight-color: rgb(0,0,0,0),
  doc,
) = {
  let title(name) = text(
    size: 2.2em,
    font: serif-font,
    heading(level: 1, name),
  )

  // Default settings
  set text(font: sans-serif-font)
  set par(leading: line-spacing)

  // Main content
  [
    // Pretty print all links
    #show link: link => pretty-link(main-color, highlight-color, link)

    // Name, contact info and headshot
    #grid(
      columns: (1fr, auto),
      [
        #title(name)
        #for contact in contacts [
          #contact.name: #contact.content\
        ]
      ],
      if headshot != none { image(width: 10em, headshot) },
    )

    #doc
  ]
}
