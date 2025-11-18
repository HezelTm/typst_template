// -------------------------------------------------------------------
// Copyright © 2025 Dimitri Julmy
// License MIT
// -------------------------------------------------------------------
// Author : Dimitri Julmy <dev@dimitri-julmy.com>
// Date   : 28.11.2025
// -------------------------------------------------------------------
// Minutes Meetings Template - minute_data.typ
// -------------------------------------------------------------------

// ---------- Agenda data

#let minute = (
  lang: "en",
  project_scope: [Travail de bachelor],
  project_name: [Mise en place d'un système de personnalisation de vues de CID ERP avec un _LLM_],
  seance_date: datetime(year: 2025, month: 11, day: 18),
  location_name: "Haute école d’ingénierie et d’architecture",
  location_street: "Bd de Pérolles 80",
  location_locality: "Fribourg",
  location_npa: "1700",
  location_room: "D2007",
  schedule: "09:30 - 10:20",
)

// ---------- Actors

#let actors = (
  (
    firstname: "Dimitri",
    lastname: "Julmy",
    gender: "m",
    isChairman: true,
    isScribe: true,
    excused: false,
  ),
  (
    firstname: "John",
    lastname: "Doe",
    gender: "m",
    isChairman: false,
    isScribe: false,
    excused: false,
  ),
)

#let talks = (
  (
    name: [Approuver le PV de la séance précédente],
    desc: ([-]),
    decision: ([-]),
    duration: 5,
  ),
  (
    name: [TODO],
    desc: ([-]),
    decision: ([-]),
    duration: 30,
  ),
  (
    name: [Regard sur le planning],
    desc: ([-]),
    decision: ([-]),
    duration: 5,
  ),
)

#let tasks = (
  (
    name: [-],
    desc: [-],
    date_due: datetime(year: 2025, month: 05, day: 07),
    exec: [Dimitri Julmy],
  ),
)
