// -------------------------------------------------------------------
// Copyright © 2025 Dimitri Julmy
// License MIT
// -------------------------------------------------------------------
// Author : Dimitri Julmy <dev@dimitri-julmy.com>
// Date   : 27.11.2025
// -------------------------------------------------------------------
// Report Template - glossary.typ
// -------------------------------------------------------------------

// ---------- Imports

// Third-party
#import "@preview/glossarium:0.5.6": make-glossary, print-glossary, register-glossary

// Values

// ---------- Terms of the glossary

#let glossary = (
  (
    key: "a",
    short: [],
    long: [],
    description: [],
    plural: [],
    longplural: [],
    group: [],
  ),
)

// ---------- Glossary table

#show: make-glossary
#register-glossary(glossary)

#set figure(placement: none)
#show figure: set block(width: 100%)
#show figure.caption: c =>[
    #align(left, [#c.body])
]

#print-glossary(glossary)
