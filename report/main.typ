// -------------------------------------------------------------------
// Copyright © 2025 Dimitri Julmy
// License MIT
// -------------------------------------------------------------------
// Author : Dimitri Julmy <dev@dimitri-julmy.com>
// Date   : 28.11.2025
// -------------------------------------------------------------------
// Report Template - main.typ
// -------------------------------------------------------------------

// ---------- Imports

// Third-party

// Values
#import "./datas/metadata.typ": colors, tr_chapters, metadata, tr_other

// ---------- General configuration of the report

// Page configuration
#set page(
  flipped: false,
  margin: (bottom: 2cm, top: 2cm, x: 1.5cm,),
  paper: "a4",
)

// Text configuration
#set text(
  font: "Roboto",
  lang: metadata.lang,
  region: "ch",
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

#include "sections/cover.typ"

// ---------- Page numbering & Heading formatting

#set page(
  numbering: "1/1"
)

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
      fill: colors.c1
    )
    #(it)
  ]
}

// Get correct chapter traduction
#let t_chap = (:)
#for pair in tr_chapters.pairs() [
  #let k = pair.at(0)
  #let v = pair.at(1)
  #let value = if metadata.lang == "fr" { v.fr } else { v.en }
  #t_chap.insert(k, value)
]


// ---------- Table of Versions

#set align(center)
#block(
  fill: colors.c1,
  width: 100%,
  inset: 10pt,
    text(
      size: 30pt,
      weight: "extrabold",
      fill: white)[#t_chap.table_version<table_versions>]
)
#v(10pt)
#set align(left)
#include "tables/table_versions.typ"

// ---------- Executive Summary

#pagebreak()
#set align(center)
#block(
  fill: colors.c1,
  width: 100%,
  inset: 10pt,
    text(
      size: 30pt,
      weight: "extrabold",
      fill: white)[#t_chap.summary<executive_summary>]
)
#v(10pt)
#set align(left)
#include "sections/summary.typ"

// ---------- Table of Contents

#pagebreak()
#include "tables/table_contents.typ"

// ---------- Introduction

#pagebreak()
= #t_chap.introduction <introduction>
#include "sections/introduction.typ"

// ---------- Context

#pagebreak()
= #t_chap.contexte <context>
#include "sections/context.typ"

// ---------- Analysis

#pagebreak()
= #t_chap.analysis <analysis>
#include "sections/analysis.typ"

// ---------- Conception

#pagebreak()
= #t_chap.conception <conception>
#include "sections/conception.typ"

// ---------- Implementation

#pagebreak()
= #t_chap.implementation <implementation>
#include "sections/implementation.typ"

// ---------- Testing and validation 

#pagebreak()
= #t_chap.testing <testing>
#include "sections/testing.typ"

// ---------- Potential developments

#pagebreak()
= #t_chap.potential_dev <potentiel_dev>
#include "sections/potentiel_dev.typ"

// ---------- Conclusion

#pagebreak()
= #t_chap.conclusion <conclusion>
#include "sections/conclusion.typ"

// ---------- Declaration of honor

#pagebreak()
= #t_chap.honor <honor>
#include "sections/honor.typ"

// ---------- Acknowledgements

#pagebreak()
= #t_chap.acknowledgements <acknowledgements>
#include "sections/acknowledgements.typ"

// ---------- Glossary

#pagebreak()
#set align(center)
#block(
  fill: colors.c1,
  width: 100%,
  inset: 10pt,
    text(
      size: 30pt,
      weight: "extrabold",
      fill: white)[#t_chap.glossary<glossary>]
)
#v(10pt)
#set align(left)
#include "bibliography/glossary.typ"

// ---------- Table of References

#pagebreak()
= #t_chap.table_references <table_references>
#include "tables/table_references.typ"

// ---------- Table of Illustrations

#pagebreak()
= #t_chap.table_illustrations <table_illustrations>
#include "tables/table_illustrations.typ"

// ---------- Annexes

#pagebreak()
= #t_chap.annexes <annexes>

// Get correct heading traduction
#let heading_annexe = {
  if metadata.lang == "fr" {
    tr_other.appendice.fr
  } else {
    tr_other.appendice.en
  }
}

// Change heading
#let appendix(body) = {
  set heading(supplement: [#heading_annexe])
  counter(heading).update(13)
  body
}
#show: appendix

#include "bibliography/annexes.typ"

