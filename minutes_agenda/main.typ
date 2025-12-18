/*
 * --------------------------------------------------------------------------------
 * File: /home/hezeltm/Projects/typst_template/minutes_agenda/main.typ
 * Project: /home/hezeltm/Projects/typst_template/minutes_agenda
 * Created Date: Tuesday, November 18th 2025, 8:04:27 pm
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
#import "data/translation.typ": tr_agenda
#import "data/agenda_data.typ": actors, agenda, goals

// ---------- Document configuration 

// Region and langue
#set text(region: "ch", lang: agenda.lang)

// Document font
#set text(font: "Roboto")

// Page margin (x : for both left and right)
#set page(
  margin: (top: 3cm, bottom: 3cm, x: 1.5cm)
)

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

// Page header
#let logo_path = "/assets/" + str(agenda.logo)
#set page(
  header: align(center)[#image(logo_path, width: 30%)]
)

// Page numbering
#set page(numbering: "1/1")

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
#let t_a = (:)
#for pair in tr_agenda.pairs() [
  #let k = pair.at(0)
  #let v = pair.at(1)
  #let value = if agenda.lang == "fr" { v.fr } else { v.en }
  #t_a.insert(k, value)
]

// ---------- Content 

= #t_a.meeting_agenda_of #agenda.seance_date.display()

== #agenda.project_scope

#text(
  size: 15pt,
  weight: "medium",
  fill: colors.c1,
)[#agenda.project_name]

== #t_a.meeting_details

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
  [*#t_a.location*], [#agenda.location_name – #agenda.location_street – #agenda.location_npa #agenda.location_locality],
  [*#t_a.room*], [#agenda.location_room],
  [*#t_a.date*], [#agenda.seance_date.display()],
  [*#t_a.schedule*], [#agenda.schedule],
)

#let excused = ()
#table(
  columns: (22%, 78%),
  align: horizon,
  [*#t_a.meeting_chair*], [#chairman],
  [*#t_a.minute_taker*], [#scribe],
  [*#t_a.expected_participants*], [
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
  [*#t_a.excused*], [#for a in actors {if a.excused {a.lastname + " " + a.firstname; if a != actors.last() {", "}}}],
)

== #t_a.session_goals

// Table styling
#set table(
  fill: (x, y) =>
    if y == 0 {colors.c3},
  align: (left + horizon)
)

// Override precendent header
#show table.cell.where(x: 0):set text(size: 11pt, fill: black)

// Apply styling to the header
#show table.cell.where(y: 0):set text(size: 12pt, fill: white)

#table(
  columns: (20%, 80%),
  table.header[*#t_a.duration_min*][*#t_a.objectives*],
  ..for (duration, desc) in goals {
    (str(duration), desc)
  }
)
