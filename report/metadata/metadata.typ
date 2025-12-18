/*
 * --------------------------------------------------------------------------------
 * File: /home/hezeltm/Projects/typst_template/report/metadata/metadata.typ
 * Project: /home/hezeltm/Projects/typst_template/report/metadata
 * Created Date: Monday, November 17th 2025, 6:53:51 pm
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

#import "enum.typ": lang, gender, title
#import "translation.typ": tr_other

// ---------- Metadata

#let metadata = (
  lang: lang.en,
  logo: "logo_hes-so.png",
  type: "Report",
  scope: "Scope",
  name: "Project's name",
  git_url: "https://gitlab-url.com",
  date_creation: datetime(year: 2025, month: 09, day: 19),
  date_due: datetime.today(),
  entity: "University of Applied Sciences and Arts of Western Switzerland",
  entity_acronym: "HES-SO",
  section : "Master of Science in Engineering",
  section_acronym: "MSE",
  profil: "Information and cyber security",
  profil_acronym: "ICS",
  locality: "Fribourg",
  year: "3rd year",
)

// ---------- Persons

#let authors = (
  (
    firstname: "Dimitri",
    lastname: "Julmy",
    gender: gender.m,
    locality: "Fribourg",
  ),
)

#let supervisors = (
  (
    firstname: "John",
    lastname: "Doe",
    gender: gender.m,
  ),
  (
    firstname: "Jane",
    lastname: "Doe",
    gender: gender.f,
  )
)

#let experts = (
  (
    firstname: "John",
    lastname: "Doe",
    gender: gender.m,
  ),
  (
    firstname: "Jane",
    lastname: "Doe",
    gender: gender.f,
  ),
)

// ---------- Document version

// ---------- Translation

// Get correct chapter traduction
#let t_chap = (:)
#for pair in tr_other.pairs() [
  #let k = pair.at(0)
  #let v = pair.at(1)
  #let value = if metadata.lang == "fr" { v.fr } else { v.en }
  #t_chap.insert(k, value)
]

// From the oldest to the newest
#let versions = (
  (
    version: "0.0",
    date: datetime(year: 2024, month: 09, day: 17),
    changes: [#t_chap.version_0_changes],
  ),
)

// ---------- Styling

// Color
#let colors = (
  c1: rgb(0, 31, 63),
  c2: rgb(58, 109, 140),
  c3: rgb(106, 154, 176),
  c4: rgb(234, 216, 177),
)
