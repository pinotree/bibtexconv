/* $Id$
 *
 * BibTex Convertor
 * Copyright (C) 2010 by Thomas Dreibholz
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.

 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * Contact: dreibh@iem.uni-due.de
 */

%{
#include "y.tab.h"
#include <stdlib.h>
#include <stdio.h>
%}

%token T_AT
%token T_OpeningBrace
%token T_ClosingBrace
%token T_Comma
%token T_Quote
%token T_Article
%token T_Proceedings
%token T_Book
%token T_TechReport
%token T_String
%token T_Keyword
%token T_Info

%%

bibTeXFile
    : publicationCollection { puts("A0"); }
    |  { puts("A1"); }
    ;

publicationCollection
    : publicationCollection publication
    | publication
    ;

publication
    : T_AT publicationType T_OpeningBrace citationKey T_Comma publicationInfo T_ClosingBrace
    ;

publicationType
    : T_Article { puts("Art"); }
    | T_Proceedings
    | T_Book
    | T_TechReport
    ;

citationKey
    : T_Keyword { puts("KEY"); }
    ;

publicationInfo
    : publicationInfo ',' publicationInfoItem
    | publicationInfoItem
    ;

publicationInfoItem
    : T_Keyword '=' T_OpeningBrace T_Info T_ClosingBrace { printf("AAA %d\n", $2); }
    | T_Keyword '=' T_OpeningBrace T_Quote T_Info T_Quote T_ClosingBrace { printf("BBB %d\n", $2); }
    ;
