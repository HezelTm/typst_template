/*
 * --------------------------------------------------------------------------------
 * File: /home/hezeltm/Projects/typst_template/report/tables/table_contents.typ
 * Project: /home/hezeltm/Projects/typst_template/report/tables
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

#import "../metadata/metadata.typ": metadata
#import "../metadata/translation.typ": tr_chapters

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
