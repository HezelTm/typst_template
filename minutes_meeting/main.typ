/*
 * --------------------------------------------------------------------------------
 * File: /home/hezeltm/Projects/typst_template/minutes_meeting/main.typ
 * Project: /home/hezeltm/Projects/typst_template/minutes_meeting
 * Created Date: Tuesday, November 18th 2025, 7:51:03 pm
 * Author: Dimitri Julmy, dev@dimitri-julmy.com
 * --------------------------------------------------------------------------------
 * Last Modified: Thu Dec 18 2025
 * Modified By: Dimitri Julmy
 * --------------------------------------------------------------------------------
 * Copyright (c) 2025 Dimitri Julmy
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 * --------------------------------------------------------------------------------
 */


// ---------- Imports

#import "data/styling.typ": colors
#import "./data/translation.typ": tr_pv
#import "./data/minute_data.typ": actors, minute, talks, tasks

// ---------- Document configuration 

// Region and langue
#set text(region: "ch", lang: minute.lang)

// Document font
#set text(font: "Roboto")

// Page margin (x : for both left and right)
#set page(
  margin: (top: 3cm, bottom: 3cm, x: 1.5cm)
)

// Page header
#let logo_path = "/assets/" + str(minute.logo)
#set page(
  header: align(center)[#image(logo_path, width: 30%)]
)

// Highlight documents links
#show link: set text(fill: blue.darken(60%))

// Page numbering
#set page(numbering: "1/1")

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

// Headings formatting
#set heading()
#show heading: it => {
  if it.level == 1 [
    #set align(center)
    #set text(
    size: 27pt,
    weight: "extrabold",
    fill: white,
  )
  #block(
    fill: colors.c1,
    width: 100%,
    inset: 18pt,
    it.body
  )
  ] else if it.level == 2 [
    #set align(left)
    #set text(
    size: 20pt,
    weight: "bold",
    fill: white,
  )
  #block(
    fill: colors.c2,
    width: 100%,
    inset: 10pt,
    it.body
  )]
}

// Get the traductions
// Get correct chapter traduction
#let t_pv = (:)
#for pair in tr_pv.pairs() [
  #let k = pair.at(0)
  #let v = pair.at(1)
  #let value = if minute.lang == "fr" { v.fr } else { v.en }
  #t_pv.insert(k, value)
]

// ---------- Content 

= #t_pv.meeting_minutes_of #minute.seance_date.display()

== #minute.project_scope

#text(
  size: 15pt,
  weight: "medium",
  fill: colors.c1,
)[#minute.project_name]

== #t_pv.meeting_details

// Extract the scribe and chairman from the list of actors
#let scribe = ""
#let chairman = ""
#for a in actors {
  if a.isChairman {chairman = a.lastname + " " + a.firstname}
  if a.isScribe {scribe = a.lastname + " " + a.firstname}
  if chairman != "" and scribe != "" {break}
}

// Apply styling to the header
#show table.cell.where(x: 0):set text(size: 12pt, fill: white)

// Table styling
#set table(
  fill: (x, y) =>
    if x == 0 {colors.c3}
)

#table(
  columns: (22%, 78%),
  align: horizon,
  [*#t_pv.location*], [#minute.location_name – #minute.location_street – #minute.location_npa #minute.location_locality],
  [*#t_pv.room*], [#minute.location_room],
  [*#t_pv.date*], [#minute.seance_date.display("[day].[month].[year]")],
  [*#t_pv.schedule*], [#minute.schedule],
)

#let excused = ()
#table(
  columns: (22%, 78%),
  align: horizon,
  [*#t_pv.meeting_chair*], [#chairman],
  [*#t_pv.minute_taker*], [#scribe],
  [*#t_pv.expected_participants*], [
    #for a in actors {
      if not a.excused {
        if a == actors.first() {
          a.lastname + " " + a.firstname
        } else {
          ", " + a.lastname + " " + a.firstname
        }
      }
    }
  ],
  [*#t_pv.excused*], [
    #for a in actors {
      if a.excused {
        a.lastname + " " + a.firstname; if a != actors.last() {", "}
      }
    }
  ],
)

== #t_pv.agenda

// Table styling
#set table(
  fill: (x, y) =>
    if y == 0 {colors.c3}
)

// Override precendent header
#show table.cell.where(x: 0):set text(size: 11pt, fill: black)

// Apply styling to the header
#show table.cell.where(y: 0):set text(size: 12pt, fill: white)

#table(
  columns: (20%, 80%),
  table.header[*#t_pv.duration_min*][*#t_pv.objective_s*],
  ..for (duration, name) in talks {
    (str(duration), name)
  }
)

#pagebreak()
== #t_pv.discussions

#for t in talks {
  block(
    breakable: false,
    grid(
      rows: 3,
      columns: 100%,

      // Activity name
      grid.cell(
        y: 0,
        fill: colors.c3,
        inset: 7pt,
        text(
          size: 12pt,
          weight: "bold",
          fill: white,
          t.name,
        )
      ),

      // Activity description
      grid.cell(
        y: 1,
        inset: 7pt,
        t.desc,
      ),

      // Decisions
      grid.cell(
        y: 2,
        inset: 7pt,
        [*#t_pv.decision_taken* : #t.decision],
      ),
    )
  )
}

// ---------- Abastract

== #t_pv.key_points

#table(
  columns: (40%, 60%),
  align: horizon,
  table.header[*#t_pv.objective_s*][*#t_pv.decision_s*],
  ..for (name, decision) in talks {
    (name, decision)
  }
)

#table(
  columns: (26%, 50%, 12%, 12%),
  align: (x, _) =>
    if x == 0 or x == 1 {horizon} else {horizon + center},
  table.header[*#t_pv.tasks*][*#t_pv.description*][*#t_pv.assignee*][*#t_pv.due_date*],
  ..for (name, desc, exec, date_due) in tasks {
    (name, desc, exec, date_due.display("[day].[month].[year]"))
  }
)
