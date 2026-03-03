// -------------------------------------------------------------------
// Copyright © 2025 Dimitri Julmy
// License MIT
// -------------------------------------------------------------------
// Author : Dimitri Julmy <dim.julmy@gmail.com>
// Date   : 20 May 2025
// -------------------------------------------------------------------
// Main of the specification
// -------------------------------------------------------------------

// ---------- Imports

// Third-party

// Values
#import "./values/styling_data.typ": colors
#import "./values/metadata.typ": project
#import "./values/tasks_data.typ": tasks

// ---------- General configuration of the report

// Page styling and configuration
#set page(
  flipped: false,
  margin: (bottom: 2cm, top: 2cm, x: 1.5cm,),
  paper: "a4",
)

// Text styling and configuration
#set text(
  region: "ch",
  lang: "fr",
  font: "Roboto",
  size: 11pt,
  weight: "regular",
)

// Highlight documents links
#show link: set text(fill: blue.darken(60%))

// Bullet list configuration
#set list(
  indent: 5pt,
  spacing: 0.8em,
  body-indent:0.4em,
  marker: (
    [•],
    [◦],
    [⁃],
  ),
)

// Numbered list configuration
#set enum(
  indent: 5pt,
  spacing: 0.8em,
  body-indent:0.4em,
)

// ---------- Cover

#include "section/cover.typ"

// ---------- Styling

// Page numbering
#set page(numbering: "1/1")

// Lists formatting
#set list(
  indent: 2em,
  tight: true,
)

// Paragraph formatting

#set par(
  first-line-indent: 2.5em,
  justify: true,
  leading: 1em,
)

// Heading formatting
#set heading(
  level: auto,
  depth: 3,
  numbering: "1.1.",
  outlined: true,
)
#show heading: it => {

  // Primary Heading
  if it.level == 1 [
    #set align(center)
    #set text(
    size: 30pt,
    weight: "extrabold",
    fill: white
  )
  #block(
    fill: colors.c1,
    width: 100%,
    inset: 10pt,
    it
  )
  #v(10pt)

  // Secondary Heading
  ] else if it.level == 2 [
    #set align(left)
    #set text(
      size: 25pt,
      weight: "bold",
      fill: colors.c1,
    )
    #(it)
    #v(-17pt)
    #line(
      stroke: 2pt + colors.c1,
      length: 100%
    )
    #v(5pt)

  // Tertiary Heading
  ] else if it.level == 3 [
    #set align(left)
    #set text(
      size: 17pt,
      weight: "medium",
      fill: white
    )
    #block(
      fill: colors.c3,
      width: 100%,
      inset: 7pt,
      it
    )
  ]
}

// ---------- Table of Versions

= Table des versions <table_versions>
#include "section/table_versions.typ"

// ---------- Table of Contents

#pagebreak()
#include "section/table_contents.typ"

// ---------- Glossary

#pagebreak()
= Glossaire <glossary>
#include "bibliography/glossary.typ"

// ---------- Context

#pagebreak()
= Contexte <context>
#include "section/context.typ"

// ---------- Goals

#pagebreak()
= Objectifs <goals>
#include "section/goals.typ"

// ---------- Activities

#pagebreak()
= Activités <activities>
#include "section/activities.typ"

// ---------- Planning

#pagebreak()
#include "section/planning.typ"

// ---------- Table of References

#pagebreak()
= Table des références <table_references>
#include "section/table_references.typ"

// ---------- Table of Illustrations

#pagebreak()
= Table des illustrations <table_illustations>
#include "section/table_illustrations.typ"
