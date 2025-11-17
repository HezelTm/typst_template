// -------------------------------------------------------------------
// Copyright © 2025 Dimitri Julmy
// License MIT
// -------------------------------------------------------------------
// Author : Dimitri Julmy <dev@dimitri-julmy.com>
// Date   : 27.11.2025
// -------------------------------------------------------------------
// Report Template - honor.typ
// -------------------------------------------------------------------

// ---------- Imports

// Third-party

// Values
#import "../datas/metadata.typ" : authors


// ---------- Declaration of honor

Je, soussigné, #authors.first().firstname #authors.first().lastname, déclare sur l’honneur que le travail rendu est le fruit d’un travail personnel. Je certifie ne pas avoir eu recours au plagiat ou à toutes autre forme de fraude. Toutes les sources d’information utilisées et les citations d’auteur ont été clairement mentionnées.

#authors.first().locality, le #datetime.today().display("[day].[month].[year]").

TODO ajouter la signature