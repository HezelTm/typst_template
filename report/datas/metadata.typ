// -------------------------------------------------------------------
// Copyright © 2025 Dimitri Julmy
// License MIT
// -------------------------------------------------------------------
// Author : Dimitri Julmy <dev@dimitri-julmy.com>
// Date   : 27.11.2025
// -------------------------------------------------------------------
// Report Template - metadata.typ
// -------------------------------------------------------------------

// ---------- Imports

// Third-party

// Values

// ---------- Metadata

#let metadata = (
  lang: "en",
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
    gender: "m",
    locality: "Fribourg",
  ),
)

#let supervisors = (
  (
    firstname: "Frédéric",
    lastname: "Bapst",
    gender: "m",
  ),
  (
    firstname: "Jacques",
    lastname: "Supcik",
    gender: "m",
  )
)

#let experts = (
  (
    firstname: "Jonh",
    lastname: "Doe",
    gender: "m",
  ),
  (
    firstname: "Jane",
    lastname: "Doe",
    gender: "m",
  ),
)

// ---------- Document version

// From the oldest to the newest
#let versions = (
  (
    version: "0.0",
    date: datetime(year: 2024, month: 09, day: 17),
    changes: [Création du document],
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

// ---------- Translation

#let tr_cover = (
  entite: ( fr: "Entité", en: "Entity" ),
  section: ( fr: "Filière", en: "Program" ),
  profil: ( fr: "Orientation", en: "Specialization" ),
  year: ( fr: "Année", en: "Year" ),
  autor: ( fr: "Auteur·s", en: "Author(s)" ),
  supervisor: ( fr: "Superviseur·s", en: "Supervisor(s)" ),
  expert: ( fr: "Expert·s", en: "Expert(s)" ),
  locality: ( fr: "Lieu", en: "Location" ),
  date_creation: ( fr: "Date de création", en: "Creation date" ),
  date_rendu: ( fr: "Date de rendu", en: "Submission date" ),
  version: ( fr: "Version", en: "Version" ),
  gitlab: ( fr: "GitLab", en: "GitLab" ),
)

#let tr_chapters = (
  table_version: (fr: "Table des versions", en: "Revision History"),
  summary: (fr: "Résumé", en: "Abstract"),
  table_content: (fr: "Table des matières", en: "Table of Contents"),
  introduction: (fr: "Introduction", en: "Introduction"),
  contexte: (fr: "Contexte", en: "Context"),
  analysis: (fr: "Analyse", en: "Analysis"),
  conception: (fr: "Conception", en: "Design"),
  implementation: (fr: "Implémentation", en: "Implementation"),
  testing: (fr: "Tests et validations", en: "Testing & Validation"),
  potential_dev: (fr: "Évolutions possibles", en: "Possible Improvements"),
  conclusion: (fr: "Conclusion", en: "Conclusion"),
  honor: (fr: "Déclaration sur l'honneur", en: "Declaration of Honor"),
  acknowledgements: (fr: "Remerciements", en: "Acknowledgements"),
  glossary: (fr: "Glossaire", en: "Glossary"),
  table_references: (fr: "Table des références", en: "References"),
  table_illustrations: (fr: "Table des illustrations", en: "List of Figures"),
  annexes: (fr: "Annexes", en: "Appendices"),
)

#let tr_other = (
  appendice: (fr: "Annexe", en: "Appendice"),
)