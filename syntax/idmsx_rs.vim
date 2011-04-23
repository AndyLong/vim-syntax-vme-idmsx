" VIM Syntax File
" Language:	ICL/Fujitsu VME IDMSX Restructure parameter files
" Maintainer:	Andy Long (Andrew.Long@Yahoo.com)
" LastChange:	$Date$
" LastChange:	$Revision$
" Remarks:	TBD
"
" $Log: idmsx_rs.vim,v $
"
if version<600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

" MOST important - else most of the keywords wont work!
if version < 600
  set isk=@,48-57,-
else
  setlocal isk=@,48-57,-
endif

syntax	case	ignore

syntax	sync	fromstart

syntax	match	idmsxRsError "\S"
syntax	match	idmsxRsError "\<\S\+\>"

syntax	match	idmsxRsIdentifier contained /\<[a-z0-9]\k\{,14}[a-z0-9]\>/

syntax	match	idmsxRsNumber contained /\%(-\)\=\s*\<\d\+\>/

syntax	match	idmsxRsStringConst contained /\<X"[a-f0-9]\+"\>/

syntax	match	idmsxRsStringEsc1 contained
	\	/""/
syntax	match	idmsxRsStringEsc2 contained
	\	/''/

syntax	region	idmsxRsStringError oneline keepend extend contains=idmsxRsStringEsc1
	\	start=/"/ end=/"/ end=/$/
syntax	region	idmsxRsStringError oneline keepend extend contains=idmsxRsStringEsc2
	\	start=/'/ end=/'/ end=/$/
syntax	region	idmsxRsStringConst oneline keepend extend contained contains=idmsxRsStringEsc1
	\	start=/"/ skip=/""/ end=/"/
syntax	region	idmsxRsStringConst oneline keepend extend contained contains=idmsxRsStringEsc2
	\	start=/'/ skip=/''/ end=/'/
syntax	match	idmsxRsStringConst contained
	\	/""/
syntax	match	idmsxRsStringConst contained
	\	/''/

syntax	keyword	idmsxRsTodo containedin=idmsxRsComment
	\	TODO	FIXME	FIXTHIS

syntax	region	idmsxRsComment oneline keepend extend start=/^\*/ end=/$/ 
"
"	RS Command Keywords
"
syntax	match	idmsxRsAll contained "\<all\>"

syntax	match	idmsxRsBefProc contained skipwhite nextgroup=idmsxRsEquals "\<bef\%(proc\)\=\>"

syntax	match	idmsxRsDelete contained "\<del\%(ete\)\=\>"

syntax	match	idmsxRsEnd "\<end\>"

syntax	match	idmsxRsField contained skipwhite nextgroup=idmsxRsFieldCommands "\<field\>"

syntax	match	idmsxRsFromIndex contained skipwhite nextgroup=idmsxRsDensity "\<from-index\>" 

syntax	match	idmsxRsIndex contained skipwhite nextgroup=idmsxRsEquals "\<ind\%(ex\)\=\>"

syntax	match	idmsxRsNuProc contained skipwhite nextgroup=idmsxRsEquals "\<nu\%(proc\)\=\>"

syntax	match	idmsxRsRecName contained skipwhite nextgroup=idmsxRsEquals "\<rec\%(name\)\=\>"

syntax	match	idmsxRsNew contained "\<new\>"
"
"	RS Commands
"
syntax	region	idmsxRsIndexEntry oneline contains=idmsxRsError,idmsxRsEquals,idmsxRsIdentifier,idmsxRsDensity,idmsxRsFromIndexEntry,idmsxRsDeleteEntry
	\	matchgroup=idmsxRsIndex start="^\s*\<ind\%(ex\)\=\>"
	\	end="$"

syntax	region	idmsxRsRecordEntry fold contains=idmsxRsError,idmsxRsComment,idmsxRsRecNameEntry,idmsxRsFieldEntry,idmsxRsBefProcEntry,idmsxRsNuProcEntry
	\	start="^\s*\ze\<rec\%(name\)\=\>"
	\	end="\ze\_s*\(rec\%(name\)\=\|end\)\>"
"
"	RS INDEX clauses
"
syntax	match	idmsxRsDensity contained contains=idmsxRsComma,idmsxRsNumber ",\s*\d*"

syntax	match	idmsxRsDeleteEntry contained contains=idmsxRsComma,idmsxRsDelete ",\s*\S*\>"

syntax	match	idmsxRsFromIndexEntry contained contains=idmsxRsComma,idmsxRsFromIndex ",\s*\S*\>"
"
"	RS RECNAME clauses
"
syntax	region	idmsxRsRecNameEntry oneline contained contains=idmsxRsError,idmsxRsEquals,idmsxRsIdentifier
	\	matchgroup=idmsxRsRecName start="\<rec\%(name\)\=\>"
	\	end="$"

syntax	region	idmsxRsBefProcEntry oneline contained contains=idmsxRsError,idmsxRsComment,idmsxRsEquals,idmsxRsComma,idmsxRsIdentifier
	\	matchgroup=idmsxRsBefProc start="\<bef\%(proc\)\=\>"
	\	end="$"

syntax	region	idmsxRsNuProcEntry oneline contained contains=idmsxRsError,idmsxRsComment,idmsxRsEquals,idmsxRsComma,idmsxRsIdentifier
	\	matchgroup=idmsxRsNuProc start="\<nu\%(proc\)\=\>"
	\	end="$"

syntax	region	idmsxRsFieldEntry oneline contained contains=idmsxRsError,idmsxRsComment,idmsxRsEquals,idmsxRsFieldMoves
	\	matchgroup=idmsxRsField start="\<field\>"
	\	end="$"

syntax	match	idmsxRsFieldMoves contained contains=idmsxrsAll "\<all\>"

syntax	match	idmsxRsFieldMoves contained contains=idmsxRsError,idmsxRsComma,idmsxRsNumber
	\	'\S\+\s*,\s*\d*\s*,\s*\d*'

syntax	match	idmsxRsFieldMoves contained contains=idmsxRsError,idmsxRsComma,idmsxRsNumber,idmsxRsNew
	\	'\S\+\s*,\s*\d*\s*,\s*\d*\s*,\s*\S\+'

syntax	match	idmsxRsFieldMoves contained contains=idmsxRsError,idmsxRsComma,idmsxRsStringConst,idmsxRsNumber,idmsxRsNew
	\	'"[^"]*"\s*,\s*\d*\s*,\s*\d*\s*,\s*\S\+'
"
"	RS Command File regions
"
syntax	region	idmsxRsIndexArea contains=idmsxRsError,idmsxRsComment,idmsxRsIndexEntry
	\	start="^\s*\ze\<ind\%(ex\)\=\>"
	\	end="\ze\_s*\<\(rec\%(name\)\|end\)\>"

syntax	region	idmsxRsRecordArea contains=idmsxRsError,idmsxRsComment,idmsxRsRecordEntry
	\	start="^\s*\ze\<rec\%(name\)\=\>"
	\	end="\ze\_s*\<\(rec\%(name\)\|end\)\>"

syntax	match	idmsxRsComma contained ","

syntax	match	idmsxRsEquals contained "="
"
"	Now apply highlighting styles
"
if version >= 508 || !exists("did_c_syn_inits")
	if version < 508
		let did_c_syn_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif

	HiLink	idmsxRsError		Error

	HiLink	idmsxRsEquals		Delimiter
	HiLink	idmsxRsComma		Delimiter

	HiLink	idmsxRsIdentifier	Identifier

	HiLink	idmsxRsNumber		Number

	HiLink	idmsxRsComment		Comment
	HiLink	idmsxRsTodo		Todo

	HiLink	idmsxRsConstant		Constant

	HiLink	idmsxRsLabel		Label

	HiLink	idmsxRsStringConst	String

	HiLink	idmsxRsStatement	Statement

	HiLink	idmsxRsAll		Statement
	HiLink	idmsxRsBefProc		Statement
	HiLink	idmsxRsDelete		Statement
	HiLink	idmsxRsEnd		Statement
	HiLink	idmsxRsField		Statement
	HiLink	idmsxRsFromIndex	Statement
	HiLink	idmsxRsNuProc		Statement
	HiLink	idmsxRsIndex		Statement
	HiLink	idmsxRsRecName		Statement
	HiLink	idmsxRsNew		Statement

	HiLink	idmsxRsSpecial		Special
	HiLink	idmsxRsSpecialChar	SpecialChar
	HiLink	idmsxRsStringEsc1	Special
	HiLink	idmsxRsStringEsc2	Special
	HiLink	idmsxRsTag		Tag
	HiLink	idmsxRsDelimiter	Delimiter
	HiLink	idmsxRsSpecialComment	SpecialComment
	HiLink	idmsxRsDebug		Debug

	HiLink	idmsxRsUnderlined	Underlined

	HiLink	idmsxRsIgnore		Ignore

	delcommand HiLink
endif

let b:current_syntax = "idmsxRs"
