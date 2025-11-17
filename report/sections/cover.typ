// -------------------------------------------------------------------
// Copyright © 2025 Dimitri Julmy
// License MIT
// -------------------------------------------------------------------
// Author : Dimitri Julmy <dev@dimitri-julmy.com>
// Date   : 27.11.2025
// -------------------------------------------------------------------
// Report Template - cover.typ
// -------------------------------------------------------------------

// ---------- Imports

// Third-party

// Values
#import "../datas/metadata.typ" : colors, metadata, authors, experts, supervisors, versions, tr_cover

// ---------- Content

// Entity Logo
#let logo_path = "/assets/logos/" + str(metadata.logo)
#align(
  center,
  image(logo_path, width: 50%)
)
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
)[#metadata.name]\
#v(7pt)
#stack(line(stroke: 2pt + colors.c1))
#v(12pt)

// Title of the project
#set align(left)
#text(
  fill: colors.c2,
  size: 28pt,
  weight: "bold"
)[#metadata.scope - #metadata.type]

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
      size: 15pt,
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

// Get the correct headers
#let t = (:)
#for pair in tr_cover.pairs() [
  #let k = pair.at(0)
  #let v = pair.at(1)
  #let value = if metadata.lang == "fr" { v.fr } else { v.en }
  #t.insert(k, value)
]

#show link: underline
#table(
  columns: (25%, 75%),
  [#t.entite], [#metadata.entity],
  [#t.section], [#metadata.section],
  [#t.profil], [#metadata.profil],
  [#t.year], [#metadata.year],
  [#t.autor], [
    #for a in authors {
      a.firstname + " " + a.lastname
      if a != authors.last() {", "}
    }
  ],
  [#t.supervisor], [
    #for s in supervisors {
      s.firstname + " " + s.lastname
      if s != supervisors.last() {", "}
    }
  ],
  [#t.expert], [
    #for e in experts {
      e.firstname + " " + e.lastname
      if e != experts.last() {", "}
    }
  ],
  [#t.locality], [Fribourg],
  [#t.date_creation], [#metadata.date_creation.display()],
  [#t.date_rendu], [#datetime.today().display()],
  [#t.version], [#versions.last().version],
  [#t.gitlab], [#link(metadata.git_url)]
)


// Blank page

#pagebreak()
#pagebreak()