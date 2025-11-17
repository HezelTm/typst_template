// -------------------------------------------------------------------
// Copyright © 2025 Dimitri Julmy
// License MIT
// -------------------------------------------------------------------
// Author : Dimitri Julmy <dev@dimitri-julmy.com>
// Date   : 27.11.2025
// -------------------------------------------------------------------
// Report Template - table_contents.typ
// -------------------------------------------------------------------

// ---------- Imports

// Third-party

// Values
#import "../datas/metadata.typ": tr_chapters, metadata

// ---------- Table of Contents

// Primary Heading format in the table
#show outline.entry.where(level: 1): it => {
  v(16pt, weak: true)
  strong(it)
}

// Get the correct title
// Get correct chapter traduction
#let t_chap = (:)
#for pair in tr_chapters.pairs() [
  #let k = pair.at(0)
  #let v = pair.at(1)
  #let value = if metadata.lang == "fr" { v.fr } else { v.en }
  #t_chap.insert(k, value)
]

// Format the Table of Contents

#outline(
  title: t_chap.table_content,
  depth: 2,
  indent: 2em,
)
