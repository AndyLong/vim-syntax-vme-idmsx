" VIM Syntax File
" Language:	ICL/Fujitsu VME IDMSX Index Tidy parameter files
" Maintainer:	Andy Long (Andrew.Long@Yahoo.com)
" LastChange:	$Date$
" Version:	$Revision$
" Remarks:	TBD
"
" $Log: idmsx_it.vim,v $
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

syntax	match	idmsxItError "\S"
syntax	match	idmsxItError "\<\S\+\>"

syntax	match	idmsxItIdentifier contained /\<[a-z0-9]\k\{,14}[a-z0-9]\>/

syntax	match	idmsxItNumber contained /\%(-\)\=\s*\<\d\+\>/

syntax	match	idmsxItPercentage contained /\<\([0-9]\|[0-9][0-9]\|100\)\>/

syntax	match	idmsxItDbPageNo contained
	\	/\<\(0*[1-9]\|0*[1-9][0-9]\{,6}\|0*1[1-5][0-9]\{6}\|0*16[0-6][0-9]\{5}\|0*167[0-6][0-9]\{4}\|0*1677[0-6][0-9]\{3}\|0*16777[0-1][0-9]\{2}\|0*1677720[0-9]\|0*1677721[0-4]\)\ze-/

syntax	match	idmsxItDbLineNo contained /-\(0*[1-9]\|0*[1-9][0-9]\|0*1[0-9][0-9]\|0*2[0-4][0-9]\|0*25[0-5]\)\>/

syntax	match	idmsxItDbKey contained /\<x[0-9a-f]\{8}\>/

"
"	IT COmmands
"
syntax	match	idmsxItError	contained "^\s*\<process\>\s*=.*"
syntax	region	idmsxItProcessEntry contains=idmsxItError,idmsxItProcess,idmsxItEquals,idmsxItTotal,idmsxItArea,@idmsxItReportsEntry,idmsxItRunEntry
	\	start="^\s*\<process\>"
	\	end="\_s*\n\s*\ze\<end\>"
syntax	region	idmsxItProcessEntry contains=idmsxItError,idmsxItProcess,idmsxItEquals,idmsxItArea,idmsxItAreaReportsEntry,idmsxItAreaEntry,idmsxItRunEntry
	\	start="^\s*\<process\>\s*=\s*\<area\>"
	\	end="\_s*\n\s*\ze\<end\>"
syntax	region	idmsxItProcessEntry contains=idmsxItError,idmsxItProcess,idmsxItEquals,idmsxItTotal,idmsxItTotalReportsEntry,idmsxItKeyEntry,idmsxItSetEntry,idmsxItRunEntry
	\	start="^\s*\<process\>\s*=\s*\<total\>"
	\	end="\_s*\n\s*\ze\<end\>"

syntax	match	idmsxItError	contained "^\s*\<reports\>\s*=.*"
syntax	region	idmsxItTotalReportsEntry contains=idmsxItError,idmsxItReports,idmsxItEquals,idmsxItYes,idmsxItNo,idmsxItOnly,idmsxItAllClause,idmsxItKeyEntry,idmsxItSetEntry,idmsxItRunEntry
	\	start="^\s*\<reports\>"
	\	end="\_s*\n\s*\ze\<end\>"
syntax	region	idmsxItAreaReportsEntry contains=idmsxItError,idmsxItReports,idmsxItEquals,idmsxItYes,idmsxItNo,idmsxItOnly,idmsxItAllClause,idmsxItAreaEntry,idmsxItRunEntry
	\	matchgroup=idmsxItReports start="^\s*\<reports\>"
	\	end="\_s*\n\s*\ze\<end\>"

syntax	match	idmsxItError	contained "^\s*\<area\>\s*=.*"
syntax	region	idmsxItAreaEntry fold keepend contains=idmsxItError,idmsxItArea,idmsxItEquals,idmsxItIdentifier,idmsxItKeyEntry,idmsxItSetEntry
	\	start="^\s*\<area\>"
	\	end="\_s*\n\s*\ze\<\(area\|run\|end\)\>"

syntax	match	idmsxItError	contained "^\s*\<key\>\s*=.*"
syntax	region	idmsxItKeyEntry contains=idmsxItError,idmsxItKey,idmsxItEquals,idmsxItIdentifier,idmsxItAll,idmsxItAllClause,idmsxItDensityClause,idmsxItKeyEntry,idmsxItSetEntry,idmsxItRunEntry
	\	start="^\s*\<key\>"
	\	end="\_s*\n\s*\ze\<end\>"

syntax	match	idmsxItError	contained "^\s*\<set\>\s*=.*"
syntax	region	idmsxItSetEntry contains=idmsxItError,idmsxItSet,idmsxItEquals,idmsxItIdentifier,idmsxItAll,idmsxItAllClause,idmsxItDbKeyClause,idmsxItDensityClause,idmsxItKeyEntry,idmsxItSetEntry,idmsxItRunEntry
	\	start="^\s*\<set\>"
	\	end="\_s*\n\s*\ze\<end\>"

syntax	match	idmsxItError	contained "^\s*\<run\>\s*=.*"
syntax	region	idmsxItRunEntry contains=idmsxItError,idmsxItRun,,idmsxItEquals,idmsxItNotIfWarnings,idmsxItNotIfErrors
	\	start="^\s*\<run\>"
	\	end="\_s*\n\s*\ze\<end\>"
"
"	IT COmmand Keywords
"
syntax	match	idmsxItEnd	contained "\<end\>"
syntax	match	idmsxItKey	contained "\<key\>"
syntax	match	idmsxItSet	contained "\<set\>"
syntax	match	idmsxItProcess	contained "\<process\>"
syntax	match	idmsxItArea	contained "\<area\>"
syntax	match	idmsxItTotal	contained "\<total\>"
syntax	match	idmsxItReports	contained "\<reports\>"
syntax	match	idmsxItAll	contained "\<all\>"
syntax	match	idmsxItNo	contained "\<no\>"
syntax	match	idmsxItOnly	contained "\<only\>"
syntax	match	idmsxItYes	contained "\<yes\>"
syntax	match	idmsxItRun	contained "\<run\>"
syntax	match	idmsxItNotIfErrors	contained "\<notiferrors\>"
syntax	match	idmsxItNotIfWarnings	contained "\<notifwarnings\>"
syntax	match	idmsxItError	",\s*\<\S\+\>"

syntax	match	idmsxItAllClause contained contains=idmsxItComma,idmsxItAll ",\s*\<all\>"

syntax	match	idmsxItDbKeyClause contained contains=idmsxItError,idmsxItComma,idmsxItDbKey ",\s*\<x\S\+\>"

syntax	match	idmsxItDbKeyClause contained contains=idmsxItComma,idmsxItAll ",\s*\<all\>"

syntax	match	idmsxItDbKeyClause contained contains=idmsxItError,idmsxItComma,idmsxItDbPageNo,idmsxItDbLineNo ",\s*\<\d\+-\d\+\>"

syntax	match	idmsxItDensityClause contained contains=idmsxItError,idmsxItComma,idmsxItPercentage ",\s*\<\d\+\>"
"
"	IT Command File regions
"
syntax	region	idmsxItCommandsArea fold keepend contains=idmsxItError,idmsxItProcessEntry,idmsxItTotalReportsEntry,idmsxItKeyEntry,idmsxItSetEntry,idmsxItRunEntry
	\	start="\%^"
	\	matchgroup=idmsxItEnd end="^\s*\<end\>"

syntax	cluster	idmsxItReportsEntry contains=idmsxItAreaReportsEntry,idmsxItTotalReportsEntry

syntax	match	idmsxItComma contained ","

syntax	match	idmsxItEquals contained "="
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

	HiLink	idmsxItError		Error

	HiLink	idmsxItEquals		Delimiter
	HiLink	idmsxItComma		Delimiter

	HiLink	idmsxItIdentifier	Identifier

	HiLink	idmsxItNumber		Number
	HiLink	idmsxItPercentage	Number
	HiLink	idmsxItDbKey		Constant
	HiLink	idmsxItDbPageNo		Constant
	HiLink	idmsxItDbLineNo		Constant

	HiLink	idmsxItComment		Comment
	HiLink	idmsxItTodo		Todo

	HiLink	idmsxItConstant		Constant
	HiLink	idmsxItAll		Constant
	HiLink	idmsxItNo		Constant
	HiLink	idmsxItNotIfErrors	Constant
	HiLink	idmsxItNotIfWarnings	Constant
	HiLink	idmsxItOnly		Constant
	HiLink	idmsxItTotal		Constant
	HiLink	idmsxItYes		Constant

	HiLink	idmsxItLabel		Label

	HiLink	idmsxItStringConst	String

	HiLink	idmsxItStatement	Statement

	HiLink	idmsxItArea		Statement
	HiLink	idmsxItEnd		Statement
	HiLink	idmsxItKey		Statement
	HiLink	idmsxItProcess		Statement
	HiLink	idmsxItReports		Statement
	HiLink	idmsxItRun		Statement
	HiLink	idmsxItSet		Statement

	HiLink	idmsxItSpecial		Special
	HiLink	idmsxItSpecialChar	SpecialChar
	HiLink	idmsxItStringEsc1	Special
	HiLink	idmsxItStringEsc2	Special
	HiLink	idmsxItTag		Tag
	HiLink	idmsxItDelimiter	Delimiter
	HiLink	idmsxItSpecialComment	SpecialComment
	HiLink	idmsxItDebug		Debug

	HiLink	idmsxItUnderlined	Underlined

	HiLink	idmsxItIgnore		Ignore

	delcommand HiLink
endif

let b:current_syntax = "idmsxIt"
