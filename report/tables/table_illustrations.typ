// -------------------------------------------------------------------
// Copyright © 2025 Dimitri Julmy
// License MIT
// -------------------------------------------------------------------
// Author : Dimitri Julmy <dev@dimitri-julmy.com>
// Date   : 27.11.2025
// -------------------------------------------------------------------
// Report Template - table_illustrations.typ
// -------------------------------------------------------------------

// ---------- Imports

// Third-party

// Values
#import "../datas/metadata.typ": colors

// ---------- Table of Illustrations

// Primary Heading format in the table
#show outline.entry.where(level: 1): it => {
  v(10pt, weak: true)
  text(
    size: 13pt,
    weight: "semibold",
    it
  )
}

#outline(
  title: none,
  target: figure.where(kind: image),
)
