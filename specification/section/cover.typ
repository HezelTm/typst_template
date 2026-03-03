// -------------------------------------------------------------------
// Copyright © 2024 Dimitri Julmy
// License MIT
// -------------------------------------------------------------------
// Author : Dimitri Julmy <dim.julmy@gmail.com>
// Date   : 18 May 2025
// -------------------------------------------------------------------
// Cover of the specifications
// -------------------------------------------------------------------

// ---------- Imports

// Third-party

// Values
#import "../values/metadata.typ": authors, entity, project, report, supervisors, versions
#import "../values/styling_data.typ" : colors

// ---------- Content

// HEIA Logo
#image("/assets/logo_heia.svg", width: 100%)
#v(17pt)

// Title of the report
#set line(length: 100%)
#stack(line(stroke: 2pt + colors.c1))
#v(7pt)
#set align(center)
#text(
  fill: colors.c1,
  size: 45pt,
  weight: "extrabold",
)[#project.name]\
#v(7pt)
#stack(line(stroke: 2pt + colors.c1))
#v(12pt)

// Title of the project
#set align(left)
#text(
  fill: colors.c2,
  size: 28pt,
  weight: "bold"
)[#project.scope - #project.name]

#v(15pt)

// Metadata of the report/project
#set table(
  stroke: none,
  gutter: 0.2em,
  fill: (x, y) =>
    if x == 0 { colors.c2 }
    else if x == 1 { colors.c3 },
  inset: 8pt,
  
)

#show table.cell: it => {
  set align(horizon)
  set align(left)
  if it.x == 0 {
    set text(
      fill: white,
      size: 17pt,
      weight: "bold",
    )
    
    (it)
  } else {
    set text(
      fill: white,
      size: 15pt,
      weight: "semibold",
    )
    (it)
  }
}

#show link: underline
#table(
  columns: (25%, 75%),
  [École], [#entity.name],
  [Filière], [#entity.sector],
  [Orientation], [#entity.orientation],
  [Année], [#entity.year],
  [Auteur], [
    #for a in authors {
      if a == authors.first() {
        a.lastname + " " + a.firstname
      } else {
        ", " + a.lastname + " " + a.firstname
      }
    }],
  [Superviseurs], [
    #for s in supervisors {
      if s == supervisors.first() {
        s.lastname + " " + s.firstname
      } else {
        ", " + s.lastname + " " + s.firstname
      }
    }],
  [Lieu], [Fribourg],
  [Date de création], [#report.date_creation.display()],
  [Date de rendu], [#datetime.today().display()],
  [Version], [#versions.last().version],
  [GitLab], [#link(project.git_url)[URL GITLAB]]
)

// Blank page

#pagebreak()
#pagebreak()
