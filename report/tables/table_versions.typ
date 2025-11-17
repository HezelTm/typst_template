// -------------------------------------------------------------------
// Copyright © 2025 Dimitri Julmy
// License MIT
// -------------------------------------------------------------------
// Author : Dimitri Julmy <dev@dimitri-julmy.com>
// Date   : 27.11.2025
// -------------------------------------------------------------------
// Report Template - table_versions.typ
// -------------------------------------------------------------------

// ---------- Imports

// Third-party

// Values

// ---------- Imports

// Values
#import "../datas/metadata.typ": versions, colors

// ---------- Table of Versions

// Apply styling to the header
#show table.cell.where(y: 0):set text(weight: "medium", size: 13pt, fill: white)

// Apply styling to the frame
#let frame(stroke) = (x, y) => (
  left: if x == 1 {1pt},
  right: if x == 1 {1pt},
  top: if y == 0 or y == 1 {2pt},
  bottom: if y == 0 {2pt} else if y == versions.len() {0pt} else {1pt},
)

// Display versions data
#table(
  columns: (15%, 15%, 70%),
  align: (x,y) => if x == 0 {center + horizon} else if x == 1 {horizon + center} else if x == 2 {horizon},
  inset: 8pt,
  fill: (_, y) => if y == 0 {colors.c3},
  stroke: frame(colors.c1),
  table.header[Version][Date][Modification],
  ..for (version, date, changes) in versions {
    (version, date.display(), changes)
  }
)
