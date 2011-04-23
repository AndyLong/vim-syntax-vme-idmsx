" Vim syntax file
" Language:   idmsx Schema, Storage Schema and Subschema DDL
" Maintainer: Andrew Long <Andrew.Long@Yahoo.com>
" $Id: idmsx.vim,v 2.8 2007-10-12 16:26:28 0126792 Exp $

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
"
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

"
" MOST important - else most of the keywords wont work!
"
if version < 600
  set isk=@,48-57,-
else
  setlocal isk=@,48-57,-
endif

syntax	case	ignore
syntax	sync	fromstart
"
"	Anything not explicitly recognised is an error
"
syntax	match	idmsxBad	"[^ ]\+"
"
"	Punctuation
"
syntax	match	idmsxPunctuation	"\."
"
"	Strings
"
syntax	match	idmsxStringEsc1
	\	contained
	\	/""/
syntax	match	idmsxStringEsc2
	\	contained
	\	/''/

syntax	region	idmsxBad
	\	oneline keepend extend contains=idmsxStringEsc1
	\	start=/"/ end=/"/ end=/$/
syntax	region	idmsxBad
	\	oneline keepend extend contains=idmsxStringEsc2
	\	start=/'/ end=/'/ end=/$/
syntax	region	idmsxStringConst
	\	oneline keepend extend contains=idmsxStringEsc1
	\	start=/"/ skip=/""/ end=/"/
syntax	region	idmsxStringConst
	\	oneline keepend extend contains=idmsxStringEsc2
	\	start=/'/ skip=/''/ end=/'/
syntax	match	idmsxStringConst
	\	/""/
syntax	match	idmsxStringConst
	\	/''/
"
"	idmsx Names
"
syntax	match	idmsxExternalName	"\<[A-Z][A-Z0-9]\{,7}\>" contained
syntax	match	idmsxInternalName	"\<[A-Z]\k\{,14\}[A-Z0-9]\>" contained
syntax	match	idmsxDataName	"\<[A-Z]\k\{,28}[A-Z0-9]\>" contained
"
"	Numbers and PICTUREs
"
syntax	match	idmsxInteger	"\<\d\+\>" contained
syntax	match	idmsxRecordId	"\<0*[1-9][0-9]\{2,3}\>" contained
syntax	match	idmsxNumber	"\<-\=\d*\.\=\d\+\>" contained
syntax	match	idmsxPercentage contained /\<\([0-9]\|[0-9][0-9]\|100\)\>/
syntax	match	idmsxDbPageNo contained
	\	/\<\(0*[1-9][0-9]\{,6}\|0*1[1-5][0-9]\{6}\|0*16[0-6][0-9]\{5}\|0*167[0-6][0-9]\{4}\|0*1677[0-6][0-9]\{3}\|0*16777[0-1][0-9]\{2}\|0*1677720[0-9]\|0*1677721[0-4]\)\ze-/
syntax	match	idmsxDbLineNo contained /-\(0*[1-9]\|0*[1-9][0-9]\|0*1[0-9][0-9]\|0*2[0-4][0-9]\|0*25[0-5]\)\>/
syntax	match	idmsxDbKey contained /\<x[0-9a-f]\{8}\>/
syntax	match	idmsxPic	"\<S*9\+\>" contained
syntax	match	idmsxPic	"\<$*\.\=9\+\>" contained
syntax	match	idmsxPic	"\<Z*\.\=9\+\>" contained
syntax	match	idmsxPic	"\<V9\+\>" contained
syntax	match	idmsxPic	"\<9\+V\>" contained
syntax	match	idmsxPic	"\<S\=9\s*([0-9 ]\+)" contained
syntax	match	idmsxPic	"\<X\+\>" contained
syntax	match	idmsxPic	"\<X\s*([0-9 ]\+)" contained
syntax	match	idmsxPic	"\<-\+[Z9]\+\>" contained
syntax	match	idmsxTodo	"todo" contained containedin=idmsxComments
"
"	Sequence Numbers in the first 6 characters
"
syntax	match	idmsxMarker	"^.\{6}" contained contains=idmsxSequenceNo,idmsxBad
syntax	match	idmsxSequenceNo	"\<\d\+\>" contained
"
"	Words known to idmsx and COBOL
"
syntax	match	idmsxAccept	"\<ACCEPT\>" contained
syntax	match	idmsxAccess	"\<ACCESS\>" contained
syntax	match	idmsxActual	"\<ACTUAL\>" contained
syntax	match	idmsxAfter	"\<AFTER\>" contained
syntax	match	idmsxAlias	"\<ALIAS\>" contained
syntax	match	idmsxAll	"\<ALL\>" contained
syntax	match	idmsxAllowed	"\<ALLOWED\>" contained
syntax	match	idmsxAlter	"\<ALTER\>" contained
syntax	match	idmsxAlternative	"\<ALTERNATIVE\>" contained
syntax	match	idmsxAlways	"\<ALWAYS\>" contained
syntax	match	idmsxAnd	"\<AND\>" contained
syntax	match	idmsxAre	"\<ARE\>" contained
syntax	match	idmsxArea	"\<AREA\>" contained
syntax	match	idmsxAreas	"\<AREAS\>" contained
syntax	match	idmsxAreaCode	"\<AREA-CODE\>" contained
syntax	match	idmsxAreaId	"\<AREA-ID\>" contained
syntax	match	idmsxAscending	"\<ASC\(ENDING\)\=\>" contained
syntax	match	idmsxAssign	"\<ASSIGN\>" contained
syntax	match	idmsxAt	"\<AT\>" contained
syntax	match	idmsxAuthor	"\<AUTHOR\>" contained
syntax	match	idmsxAutomatic	"\<AUTO\(MATIC\)\=\>" contained
syntax	match	idmsxBefore	"\<BEFORE\>" contained
syntax	match	idmsxBeforeImages	"\<BEFORE-IMAGES\>" contained
syntax	match	idmsxBinary	"\<BIN\(ARY\)\=\>" contained
syntax	match	idmsxBit	"\<BIT\>" contained
syntax	match	idmsxBlock	"\<BLOCK\>" contained
syntax	match	idmsxBuffer	"\<BUFFER\>" contained
syntax	match	idmsxBy	"\<BY\>" contained
syntax	match	idmsxByDefinedKeys	"\(\<BY\>\_s*\)\=\<DEFINED\>\(\_s*\<KEYS\>\)\=" contained contains=idmsxBy,idmsxDefined,idmsxKeys
syntax	match	idmsxCalc	"\<CALC\>" contained
syntax	match	idmsxCalcKey	"\<CALC-KEY\>" contained
syntax	match	idmsxCall	"\<CALL\>" contained
syntax	match	idmsxChain	"\<CHAIN\>" contained
syntax	match	idmsxChange	"\<CHANGE\>" contained
syntax	match	idmsxChanged	"\<CHANGED\>" contained
syntax	match	idmsxCharacter	"\<CHAR\(ACTER\)\=\>" contained
syntax	match	idmsxCharacters	"\<CHAR\(ACTER\)\=S\>" contained
syntax	match	idmsxCheck	"\<CHECK\>" contained
syntax	match	idmsxClose	"\<CLOSE\>" contained
syntax	match	idmsxComment	"\<COMMENT\>" contained
syntax	match	idmsxCompile	"\<COMPILE\>" contained
syntax	match	idmsxComplex	"\<COMPLEX\>" contained
syntax	match	idmsxCompressed	"\<COMPRESSED\>" contained
syntax	match	idmsxComputational	"\<COMP\(UTATIONAL\)\=\>" contained
syntax	match	idmsxComputational	"\<COMP\(UTATIONAL\)\=-1\>" contained
syntax	match	idmsxComputational	"\<COMP\(UTATIONAL\)\=-2\>" contained
syntax	match	idmsxComputational	"\<COMP\(UTATIONAL\)\=-3\>" contained
syntax	match	idmsxComputational	"\<COMP\(UTATIONAL\)\=-4\>" contained
syntax	match	idmsxComputational	"\<COMP\(UTATIONAL\)\=-5\>" contained
syntax	match	idmsxComputational	"\<COMP\(UTATIONAL\)\=-6\>" contained
syntax	match	idmsxConcurrency	"\<CONCURRENCY\>" contained
syntax	match	idmsxConnect	"\<CONNECT\>" contained
syntax	match	idmsxContains	"\<CONTAINS\>" contained
syntax	match	idmsxControl	"\<CONTROL\>" contained
syntax	match	idmsxCopy	"\<COPY\>" contained
syntax	match	idmsxCurrent	"\<CURRENT\>" contained
syntax	match	idmsxData	"\<DATA\>" contained
syntax	match	idmsxDatabase	"\<DATABASE\>" contained
syntax	match	idmsxDatabaseKey	"\<\(DATABASE-KEY\|DBKEY\)\>" contained
syntax	match	idmsxDate	"\<DATE\>" contained
syntax	match	idmsxDdldml	"\<DDLDML\>" contained
syntax	match	idmsxDecimal	"\<\(DECIMAL\|DEC\)\>" contained
syntax	match	idmsxDecoding	"\<DECODING\>" contained
syntax	match	idmsxDefault	"\<DEFAULT\>" contained
syntax	match	idmsxDefined	"\<DEFINED\>" contained
syntax	match	idmsxDelayed	"\<DELAYED\>" contained
syntax	match	idmsxDelete	"\<DELETE\>" contained
syntax	match	idmsxDepending	"\<DEPENDING\>" contained skipwhite skipempty nextgroup=idmsxOn,idmsxDataName
syntax	match	idmsxDescending	"\<DESC\(ENDING\)\=\>" contained
syntax	match	idmsxDescription	"\<DESCRIPTION\>" contained
syntax	match	idmsxDevice	"\<DEVICE\>" contained
syntax	match	idmsxDeviceMedia	"\<DEVICE-MEDIA\>" contained
syntax	match	idmsxDiary	"\<DIARY\>" contained
syntax	match	idmsxDirect	"\<DIRECT\>" contained
syntax	match	idmsxDirectDbk	"\<DIRECT-DBK\>" contained
syntax	match	idmsxDisconnect	"\<DISCONNECT\>" contained
syntax	match	idmsxDisplacement	"\<DISPLACEMENT\>" contained
syntax	match	idmsxDisplay	"\<DISPLAY\>" contained
syntax	match	idmsxDistribution	"\<DISTRIBUTION\>" contained
syntax	match	idmsxDivision	"\<DIVISION\>" contained
syntax	match	idmsxDspMsg	"\<DSPMSG\>" contained
syntax	match	idmsxDspStat	"\<DSPSTAT\>" contained
syntax	match	idmsxDuplex	"\<DUPLEX\>" contained
syntax	match	idmsxDuplicate	"\<DUP\(LICATE\)\=\>" contained
syntax	match	idmsxDuplicates	"\<DUP\(LICATE\)\=S\>" contained
syntax	match	idmsxDuring	"\<DURING\>" contained
syntax	match	idmsxDynamic	"\<DYNAMIC\>" contained
syntax	match	idmsxEmpty	"\<EMPTY\>" contained
syntax	match	idmsxEnd	"\<END\>" contained
syntax	match	idmsxEncoding	"\<ENCODING\>" contained
syntax	match	idmsxEqual	"\<EQUAL\>" contained
syntax	match	idmsxErase	"\<ERASE\>" contained
syntax	match	idmsxError	"\<ERROR\>" contained
syntax	match	idmsxExclusive	"\<EXCL\(USIVE\)\=\>" contained
syntax	match	idmsxFile	"\<FILE\>" contained
syntax	match	idmsxFiller	"\<FILLER\>" contained
syntax	match	idmsxFind	"\<FIND\>" contained
syntax	match	idmsxFinish	"\<FINISH\>" contained
syntax	match	idmsxFirst	"\<FIRST\>" contained
syntax	match	idmsxFixed	"\<FIXED\>" contained
syntax	match	idmsxFloat	"\<FLOAT\>" contained
syntax	match	idmsxFor	"\<FOR\>" contained
syntax	match	idmsxFormat	"\<FORMAT\>" contained
syntax	match	idmsxFragment	"\<FRAGMENT\>" contained
syntax	match	idmsxFrom	"\<FROM\>" contained
syntax	match	idmsxGet	"\<GET\>" contained
syntax	match	idmsxHighValue	"\<HIGH-VALUE\>" contained
syntax	match	idmsxHighValues	"\<HIGH-VALUES\>" contained
syntax	match	idmsxIcl9id	"\<ICL9ID\k*\>" contained
syntax	match	idmsxIdentification	"\<IDENTIFICATION\>" contained
syntax	match	idmsxIdentified	"\<IDENTIFIED\>" contained
syntax	match	idmsxIdentifier	"\<ID\(ENTIFIER\)\=\>" contained
syntax	match	idmsxIdmsarea	"\<IDMSAREA\>" contained
syntax	match	idmsxIdmsddl	"\<IDMSDDL\>" contained
syntax	match	idmsxIdmsfile	"\<IDMSFILE\>" contained
syntax	match	idmsxImmaterial	"\<IMMATERIAL\>" contained
syntax	match	idmsxImplementor	"\<IMPLEMENTOR\>" contained
syntax	match	idmsxIn	"\<IN\>" contained
syntax	match	idmsxIndex	"\<INDEX\>" contained
syntax	match	idmsxIndexed	"\<INDEXED\>" contained skipwhite skipempty nextgroup=idmsxBy,idmsxDataName
syntax	match	idmsxIndexedBy	"\<INDEXED\>\(\_s*BY\>\)\=" contained skipwhite skipempty nextgroup=idmsxDataName
syntax	match	idmsxInQuote	"\<INQUOTE\>" contained
syntax	match	idmsxInsecure	"\<INSECURE\>" contained
syntax	match	idmsxInsert	"\<INSERT\>" contained
syntax	match	idmsxInsertion	"\<INSERTION\>"
syntax	match	idmsxInstallation	"\<INSTALLATION\>" contained
syntax	match	idmsxInvoke	"\<INVOKE\>" contained
syntax	match	idmsxIs	"\<IS\>" contained
syntax	match	idmsxJournal	"\<JOURNAL\>" contained
syntax	match	idmsxKey	"\<KEY\>" contained
syntax	match	idmsxKeys	"\<KEYS\>" contained
syntax	match	idmsxLast	"\<LAST\>" contained
syntax	match	idmsxLeading	"\<LEADING\>" contained
syntax	match	idmsxLeft	"\<LEFT\>" contained
syntax	match	idmsxLength	"\<LENGTH\>" contained
syntax	match	idmsxLevelNo	"\<\d\d\=\>" contained
syntax	match	idmsxLinked	"\<LINKED\>" contained
syntax	match	idmsxLocation	"\<LOC\(ATION\)\=\>" contained
syntax	match	idmsxLock	"\<LOCK\>" contained
syntax	match	idmsxLocks	"\<LOCKS\>" contained
syntax	match	idmsxLowValue	"\<LOW-VALUE\>" contained
syntax	match	idmsxLowValues	"\<LOW-VALUES\>" contained
syntax	match	idmsxManagement	"\<MANAGEMENT\>" contained
syntax	match	idmsxMandatory	"\<MAN\(DATORY\)\=\>" contained
syntax	match	idmsxManual	"\<MANUAL\>" contained
syntax	match	idmsxMaximum	"\<MAXIMUM\>" contained
syntax	match	idmsxMember	"\<MEMBER\>" contained
syntax	match	idmsxMembers	"\<MEMBERS\>" contained
syntax	match	idmsxMinimum	"\<MINIMUM\>" contained
syntax	match	idmsxMode	"\<MODE\>" contained
syntax	match	idmsxModify	"\<MODIFY\>" contained
syntax	match	idmsxMove	"\<MOVE\>" contained
syntax	match	idmsxName	"\<NAME\>" contained
syntax	match	idmsxNext	"\<NEXT\>" contained
syntax	match	idmsxNonExclusive	"\<\(NON-EXCLUSIVE\|NEXCL\)\>" contained
syntax	match	idmsxNoSeq	"\<NOSEQ\>"
syntax	match	idmsxNo	"\<NO\>" contained
syntax	match	idmsxNot	"\<NOT\>" contained
syntax	match	idmsxNotIfErrors	contained "\<NOTIFERRORS\>"
syntax	match	idmsxNotIfWarnings	contained "\<NOTIFWARNINGS\>"
syntax	match	idmsxNull	"\<NULL\>" contained
syntax	match	idmsxObtain	"\<OBTAIN\>" contained
syntax	match	idmsxOccurrence	"\<OCCURRENCE\>" contained
syntax	match	idmsxOccurs	"\<OCCURS\>" contained
syntax	match	idmsxOf	"\<OF\>" contained
syntax	match	idmsxOn	"\<ON\>" contained 
syntax	match	idmsxOnly	"\<ONLY\>" contained
syntax	match	idmsxOpen	"\<OPEN\>" contained
syntax	match	idmsxOptional	"\<OPT\(IONAL\)\=\>" contained
syntax	match	idmsxOutQUote	"\<OUTQUOTE\>" contained
syntax	match	idmsxOr	"\<OR\>" contained
syntax	match	idmsxOrder	"\<ORDER\>" contained
syntax	match	idmsxOverflow	"\<OVERFLOW\>" contained
syntax	match	idmsxOwner	"\<OWNER\>" contained
syntax	match	idmsxPage	"\<PAGE\>" contained
syntax	match	idmsxPageDirect	"\<PAGE-DIRECT\>" contained
syntax	match	idmsxPageReserve	"\<PAGE-RESERVE\>" contained
syntax	match	idmsxPages	"\<PAGES\>" contained
syntax	match	idmsxPermanent	"\<PERMANENT\>" contained
syntax	match	idmsxPicture	"\<PIC\(TURE\)\=\>" contained skipwhite skipempty nextgroup=idmsxPic
syntax	match	idmsxPlaced	"\<PLACED\>" contained
syntax	match	idmsxPlacement	"\<PLACEMENT\>" contained
syntax	match	idmsxPointer	"\<POINTER\>" contained
syntax	match	idmsxPointerArray	"\<\(POINTER-ARRAY\|PTR\)\>" contained
syntax	match	idmsxPooled	"\<POOLED\>" contained
syntax	match	idmsxPosition	"\<POSITION\>" contained
syntax	match	idmsxPrior	"\<PRIOR\>" contained
syntax	match	idmsxPrivacy	"\<PRIVACY\>" contained
syntax	match	idmsxProcedure	"\<PROC\(EDURE\)\=\>" contained
syntax	match	idmsxProcess	"\<PROCESS\>" contained
syntax	match	idmsxProcessable	"\<PROCESSABLE\>" contained
syntax	match	idmsxProtected	"\<\(PROTECTED\|PROT\)\>" contained
syntax	match	idmsxRandom	"\<RANDOM\>" contained
syntax	match	idmsxRange	"\<RANGE\>" contained
syntax	match	idmsxReady	"\<READY\>" contained
syntax	match	idmsxReal	"\<REAL\>" contained
syntax	match	idmsxRealm	"\<REALM\>" contained
syntax	match	idmsxRealms	"\<REALMS\>" contained
syntax	match	idmsxRecord	"\<RECORD\>" contained
syntax	match	idmsxRecords	"\<RECORDS\>" contained
syntax	match	idmsxRecordName	"\<RECORD-NAME\>" contained
syntax	match	idmsxRedefines	"\<REDEFINES\>" contained skipwhite skipempty nextgroup=idmsxBad,
	\		idmsxDataName
syntax	match	idmsxRemarks	"\<REMARKS\>" contained
syntax	match	idmsxRemove	"\<REMOVE\>" contained
syntax	match	idmsxReports	"\<REPORTS\>" contained
syntax	match	idmsxReserve	"\<RESERVE\>" contained
syntax	match	idmsxResult	"\<RESULT\>" contained
syntax	match	idmsxRetention	"\<RETENTION\>"
syntax	match	idmsxRetrieval	"\<RETR\(IEVAL\)\=\>" contained
syntax	match	idmsxRight	"\<RIGHT\>" contained
syntax	match	idmsxRoot	"\<ROOT\>" contained
syntax	match	idmsxRun	"\<RUN\>" contained
syntax	match	idmsxRunUnit	"\<RUN-UNIT\>" contained
syntax	match	idmsxSchema	"\<SCHEMA\>" contained
syntax	match	idmsxSearch	"\<SEARCH\>" contained
syntax	match	idmsxSearchable	"\<SEARCHABLE\>" contained
syntax	match	idmsxSeconds	"\<SECONDS\>" contained
syntax	match	idmsxSection	"\<SECTION\>" contained
syntax	match	idmsxSelection	"\<SELECTION\>" contained
syntax	match	idmsxSelective	"\<SELECTIVE\>" contained
syntax	match	idmsxSeparate	"\<SEPARATE\>" contained
syntax	match	idmsxSequence	"\<SEQUENCE\>" contained
syntax	match	idmsxSequential	"\<SEQUENTIAL\>" contained
syntax	match	idmsxService	"\<SERVICE\>" contained
syntax	match	idmsxSet	"\<SET\>" contained
syntax	match	idmsxSets	"\<SETS\>" contained
syntax	match	idmsxSign	"\<SIGN\>" contained
syntax	match	idmsxSize	"\<SIZE\>" contained
syntax	match	idmsxSorted	"\<SORTED\>" contained skipwhite skipempty nextgroup=idmsxByDefinedKeys,idmsxWithinRecordType
syntax	match	idmsxSource	"\<SOURCE\>" contained
syntax	match	idmsxSpace	"\<SPACE\>" contained
syntax	match	idmsxSpaces	"\<SPACES\>" contained
syntax	match	idmsxSr	"\<SR\>\d\+\>" contained
syntax	match	idmsxStandard	"\<STANDARD\>" contained
syntax	match	idmsxStart	"\<START\>" contained
syntax	match	idmsxStatus	"\<STATUS\>" contained
syntax	match	idmsxStorage	"\<STORAGE\>" contained
syntax	match	idmsxStore	"\<STORE\>" contained
syntax	match	idmsxSubschema	"\<SUBSCHEMA\>" contained
syntax	match	idmsxSynchronised	"\<SYNC\(HRONI[SZ]ED\)\=\>" contained skipwhite skipempty nextgroup=idmsxRight,idmsxLeft,idmsxBad
syntax	match	idmsxSysddl	"\<SYSDDL\>" contained
syntax	match	idmsxSystem	"\<SYSTEM\>" contained skipwhite skipempty nextgroup=idmsxDefault
syntax	match	idmsxSystemDefault	"\<SYSTEM-DEFAULT\>" contained
syntax	match	idmsxTable	"\<TABLE\>" contained 
syntax	match	idmsxTemporary	"\<TEMP\(ORARY\)\=\>" contained
syntax	match	idmsxTermination	"\<TERMINATION\>" contained 
syntax	match	idmsxThen	"\<THEN\>" contained 
syntax	match	idmsxThis	"\<THIS\>" contained 
syntax	match	idmsxThrough	"\<\(THROUGH\|THRU\)\>" contained 
syntax	match	idmsxTimes	"\<TIMES\>" contained 
syntax	match	idmsxTimeOut	"\<TIME-OUT\>" contained 
syntax	match	idmsxTo	"\<TO\>" contained 
syntax	match	idmsxTotal	"\<TOTAL\>" contained 
syntax	match	idmsxTrailing	"\<TRAILING\>" contained 
syntax	match	idmsxType	"\<TYPE\>" contained 
syntax	match	idmsxUpdate	"\<UPDATE\>" contained 
syntax	match	idmsxUsage	"\<USAGE\>" contained skipwhite skipempty nextgroup=idmsxBad,
	\		idmsxDisplay,idmsxComputational
syntax	match	idmsxUsageMode	"\<USAGE-MODE\>" contained
syntax	match	idmsxUsing	"\<USING\>" contained 
syntax	match	idmsxValue	"\<VALUE\>" contained 
syntax	match	idmsxValues	"\<VALUES\>" contained 
syntax	match	idmsxVia	"\<VIA\>" contained 
syntax	match	idmsxVirtual	"\<VIRTUAL\>" contained 
syntax	match	idmsxWhere	"\<WHERE\>" contained 
syntax	match	idmsxWithin	"\<WITHIN\>" contained 
syntax	match	idmsxWithinRecordType	"\<WITHIN\>\_s*\<RECORD\>\_s*\<TYPE\>" contained contains=idmsxWithin,idmsxRecord,idmsxType
syntax	match	idmsxYes	"\<YES\>" contained
syntax	match	idmsxZero	"\<ZERO\>" contained
syntax	match	idmsxZeroes	"\<ZEROE\=S\>" contained
"
"	Some stuff can be matched in any clause
"
syntax	cluster	idmsxAlwaysValid	contains=idmsxBad,idmsxComments,idmsxMarker,idmsxPunctuation
"
"	idmsx Compiler directives
"
syntax	match	idmsxCompiler	"\<\(DSPMSG\|DSPSTAT\|NOSEQ\|INQUOTE\|OUTQUOTE\)\>" 
"
"	Now for the sticky stuff
"
"	The following clauses are used in more than one place and are defined
"	here for convenience
"
syntax	match	idmsxRecordName	contained contains=@idmsxAlwaysValid,
	\		idmsxRecord,idmsxName,idmsxIs,idmsxInternalName,idmsxPunctuation
	\	"\<RECORD\>\_s*\(\<NAME\>\_s\+\)\=\_s*\(\<IS\>\_s\+\)\=\<\S\+\>\_s*\.\ze\_s\+"

syntax	match	idmsxSetName	contained contains=@idmsxAlwaysValid,
	\		idmsxSet,idmsxName,idmsxIs,idmsxInternalName,idmsxPunctuation
	\	"\<SET\>\_s*\(\<NAME\>\_s\+\)\=\_s*\(\<IS\>\_s\+\)\=\<\S\+\>\_s*\.\ze\_s\+"

syntax	match	idmsxAreaName	contained contains=@idmsxAlwaysValid,
	\		idmsxArea,idmsxName,idmsxIs,idmsxInternalName,idmsxPunctuation
	\	"\<AREA\>\_s*\(\<NAME\>\_s\+\)\=\_s*\(\<IS\>\_s\+\)\=\<\S\+\>\_s*\.\ze\_s\+"

syntax	match	idmsxFileName	contained contains=@idmsxAlwaysValid,
	\		idmsxFile,idmsxName,idmsxIs,idmsxInternalName,idmsxPunctuation
	\	"\<FILE\>\_s*\(\<NAME\>\_s\+\)\=\_s*\(\<IS\>\_s\+\)\=\<\S\+\>\_s*\.\ze\_s\+"

syntax	match	idmsxDisplacementClause	contained contains=@idmsxAlwaysValid,
	\		idmsxDisplacement,idmsxInteger,idmsxPages
	\	"\<DISPLACEMENT\>\_s*\<\S\+\>\(\_s*\<PAGES\>\)\="

syntax	match	idmsxViaSetPlacement	contained skipwhite skipempty nextgroup=idmsxDisplacementClause contains=@idmsxAlwaysValid,
	\		idmsxVia,idmsxInternalName,idmsxSet
	\	"\<VIA\>\_s*\S\+\_s*\(\<SET\>\)\="

syntax	match	idmsxViaOwnerPlacement	contained skipwhite skipempty nextgroup=idmsxDisplacementClause contains=@idmsxAlwaysValid,
	\		idmsxVia,idmsxOwner
	\	"\<VIA\>\_s*\<OWNER\>"

syntax	match	idmsxUsingKeyName	contained contains=@idmsxAlwaysValid,
	\		idmsxUsing,idmsxInternalName
	\	"\<USING\>\_s\+\S\+"

syntax	match	idmsxPageDirectUsingKeyName	contained skipwhite skipempty nextgroup=idmsxDuplicatesClause contains=@idmsxAlwaysValid,
	\		idmsxUsing,idmsxInternalName
	\	"\<USING\>\_s\+\S\+"

syntax	match	idmsxRandomPlacement	contained skipwhite skipempty nextgroup=idmsxUsingKeyname contains=@idmsxAlwaysValid,
	\		idmsxRandom
	\	"\<RANDOM\>"

syntax	match	idmsxKeyedPlacement	contained contains=@idmsxAlwaysValid,
	\		idmsxCalc,idmsxSequential,idmsxUsingKeyName
	\	"\<\(CALC\|SEQUENTIAL\)\>\_s*\<USING\>\_s*\<\S\+\>"

syntax	match	idmsxPageDirectPlacement	contained skipwhite skipempty nextgroup=idmsxPageDirectUsingKeyName,idmsxDuplicatesClause contains=@idmsxAlwaysValid,
	\		idmsxPage,idmsxDirect
	\	"\<PAGE\>\_s*\<DIRECT\>"

syntax	match	idmsxOrderClause	contained skipwhite skipempty nextgroup=idmsxOrderClause,idmsxDuplicatesClause contains=@idmsxAlwaysValid,
	\		idmsxAscending,idmsxDescending,idmsxDataName
	\	"\(\<\(ASC\(ENDING\)\=\|DESC\(ENDING\)\=\)\>\_s*\)\=\<\S\+\>"

syntax	match	idmsxDuplicatesClause	contained skipwhite skipempty nextgroup=idmsxFirst,idmsxLast,idmsxNotAllowedClause,idmsxSystemDefaultClause contains=@idmsxAlwaysValid,
	\		idmsxDuplicates,idmsxAre,
	\	"\<DUPLICATES\>\_s*\(\<ARE\>\)\="

syntax	match	idmsxWithinArea	containedin=idmsxStorageSchemaRecordEntry skipwhite skipempty nextgroup=idmsxWithinNamedArea,idmsxViaNamedSet contains=@idmsxAlwaysValid,
	\		idmsxWithin
	\	"\<WITHIN\>"

syntax	match	idmsxWithinArea	containedin=idmsxIndexEntry skipwhite skipempty nextgroup=idmsxWithinNamedArea,idmsxViaUnnamedSet contains=@idmsxAlwaysValid,
	\		idmsxWithin
	\	"\<WITHIN\>"

syntax	match	idmsxNamedSet	contained contains=@idmsxAlwaysValid,
	\		idmsxInternalName,idmsxOf,idmsxSet
	\	"\(\<OF\>\_s*\)\=\<\S\+\>\_s*\(SET\)\="

syntax	match	idmsxWithinNamedArea	contained skipwhite skipempty nextgroup=idmsxRestrictedPageRange contains=@idmsxAlwaysValid,
	\		idmsxInternalName,idmsxArea
	\	"\S\+\_s*\(AREA\)\=\_s*"

syntax	match	idmsxViaNamedSet	contained skipwhite skipempty nextgroup=idmsxNamedSet contains=@idmsxAlwaysValid,
	\		idmsxArea,idmsxOf,idmsxOwner
	\	"\<AREA\>\_s*\(\<OF\>\_s*\)\=\<OWNER\>"

syntax	match	idmsxViaUnnamedSet	contained contains=@idmsxAlwaysValid,
	\		idmsxArea,idmsxOf,idmsxOwner
	\	"\<AREA\>\_s*\(\<OF\>\_s*\)\=\<OWNER\>"

syntax	match	idmsxRestrictedPageRange	contained skipwhite skipempty nextgroup=idmsxPageRange contains=@idmsxAlwaysValid,
	\		idmsxFrom
	\	"\<FROM\>"

syntax	match	idmsxPageRange	contained contains=@idmsxAlwaysValid,
	\		idmsxInteger,idmsxThrough
	\	"\<\d\+\>\_s*\(\S\+\)\=\_s*\<\d\+\>"

syntax	match	idmsxNumericLength	contained contains=@idmsxalwaysValid,
	\		idmsxInteger,idmsxCharacters
	\	"\<\d\+\>\_s*\(\<CHARACTERS\>\)\="

syntax	match	idmsxBlockSize	contained contains=@idmsxAlwaysValid,
	\		idmsxBlock,idmsxSize
	\	"\<BLOCK\>\(\_s*\<SIZE\>\)\="

syntax	match	idmsxSystemDefaultClause	contained contains=@idmsxAlwaysValid,
	\		idmsxSystem,idmsxDefault
	\	"\<SYSTEM\>\_s*\<DEFAULT\>"

syntax	match	idmsxNotAllowedClause	contained contains=@idmsxAlwaysValid,
	\		idmsxNot,idmsxAllowed
	\	"\<NOT\>\(\_s*\<ALLOWED\>\)\="
"
"	Clauses relating to an idmsx Schema
"
"	The Schema definition clause
"
syntax	region	idmsxSchemaDefinition	fold keepend contains=@idmsxAlwaysValid,
	\		idmsxSchemaName
	\	start="^.\{6} \{1,4}SCHEMA\>"
	\	end="\%$"

syntax	match	idmsxSchemaName	fold contains=@idmsxAlwaysValid,
	\		idmsxSchema,idmsxName,idmsxIs,idmsxExternalName,idmsxPunctuation
	\	"\<schema\>\_s\+\(\<name\>\_s\+\)\=\(\<is\>\_s\+\)\=\<\S\+\>\_s*\.\ze\_s\+"
"
"	The Schema Record Definition
"
syntax	region	idmsxSchemaRecordEntry	fold keepend containedin=idmsxSchemaDefinition contains=@idmsxAlwaysValid,
	\		idmsxSchemaRecordSubEntry,idmsxDataSubentry
	\	start="^.\{6} \{1,4}\zeRECORD\>"
	\	end="\ze\_s*\n.\{6} \{1,}\(RECORD\_s\+\NAME\|SET\_s\+NAME\)\>"

syntax	region	idmsxSchemaRecordSubentry	keepend extend contained contains=@idmsxAlwaysValid,
	\		idmsxRecordName,idmsxRecordKeyClause,idmsxCallClause
	\	start="\ze\<RECORD\>"
	\	end="\ze\_s*\n.\{6} \{5,}0\=\d\>"

syntax	match	idmsxRecordKeyClause	contained skipwhite skipempty nextgroup=idmsxOrderClause contains=@idmsxAlwaysValid,
	\		idmsxKey,idmsxInternalName,idmsxIs
	\	"\<KEY\>\_s*\<\S\+\>\(\_s*\<IS\>\)\="

syntax	match	idmsxSignClause	contained skipwhite skipempty nextgroup=idmsxSeparateCharacter contains=@idmsxAlwaysValid,
	\		idmsxSign,idmsxIs,idmsxLeading\|idmsxTrailing
	\	"\<SIGN\>\_s*\(\<IS\>\_s*\)\=\<\(LEADING\|TRAILING\)\>"

syntax	match	idmsxSeparateCharacter	contained contains=@idmsxAlwaysValid,
	\		idmsxSeparate,idmsxCharacter
	\	"\<SEPARATE\>\_s*\(\<\S\+\>\)\="

syntax	match	idmsxCallClause	contained skipwhite skipempty nextgroup=idmsxWhenCalledClause contains=@idmsxAlwaysValid,
	\		idmsxCall,idmsxExternalName,idmsxBefore,idmsxAfter,idmsxOn,idmsxError,idmsxDuring 
	\	"\<CALL\>\_s*\<\S\+\>\_s*\(\<BEFORE\>\|\<AFTER\>\|\(\<ON\>\_s*\)\=\_s\+\<ERROR\>\(\_s*\<DURING\>\)\)\="

syntax	match	idmsxWhenCalledClause	contained skipwhite skipempty nextgroup=idmsxWhenCalledClause contains=@idmsxAlwaysValid,
	\		idmsxAccept,idmsxConnect,idmsxDisconnect,idmsxErase,idmsxFind,idmsxGet,idmsxModify,idmsxStore
	\	"\<\S\+\>"

syntax	region	idmsxDataSubentry	contained contains=@idmsxAlwaysValid,
	\		idmsxDataName,idmsxUsage,idmsxPicture,idmsxOccursClause,idmsxRedefines,idmsxValueClause,
	\		idmsxSynchronised,idmsxSignClause,idmsxCommentClause
	\	start="^.\{6} \{5,}\d\d\=\>"
	\	matchgroup=idmsxPunctuation
	\	end="\. *$"

syntax	match	idmsxValueClause	contained skipwhite skipempty nextgroup=idmsxStringConst,idmsxNumber contains=@idmsxAlwaysValid,
	\		idmsxValue,idmsxIs
	\	"\<VALUE\>\_s*\(\<IS\>\)\="
"
syntax	match	idmsxDataName	"\<\d\d\>\_s*\<\a\k*\>" contained contains=@idmsxAlwaysValid,
	\		idmsxLevelNo,idmsxFiller,idmsxDataName

syntax	match	idmsxOccursClause	skipwhite skipempty nextgroup=idmsxDepending,idmsxIndexed contained contains=@idmsxAlwaysValid,
	\		idmsxOccurs,idmsxInteger,idmsxTo,idmsxTimes
	\	"\<OCCURS\>\_s*\<\d\+\>\_s*\(\<TO\>\_s*\<\d\+\>\_s*\)\=\(\<TIMES\>\)\="
"
"	The Schema Set Definition
"
syntax	region	idmsxSchemaSetEntry	fold keepend containedin=idmsxSchemaDefinition contains=@idmsxAlwaysValid,
	\		idmsxSetName,idmsxSetOwnerClause,idmsxSetOrderClause,idmsxSetMemberSubentry
	\	start="^.\{6} \{1,}\zeSET\>\_s*\(\<NAME\>\)\=\_s*\(\<IS\>\_s*\)\=\<\S\+\>"
	\	end="\.\ze\_s*\_^.\{6} \{1,}\(\<RECORD\>\_s\+\(\<NAME\>\_s\+\)\=\(\<IS\>\_s\+\)\=\|\<SET\>\_s\+\(\<NAME\>\_s\+\)\=\(\<IS\>\_s\+\)\=\)\<\S\+\>\_s*\.\_s\+"

syntax	match	idmsxSetOwnerClause	contained contains=@idmsxAlwaysValid,
	\		idmsxOwner,idmsxIs,idmsxInternalName
	\	"\<OWNER\>\_s*\(\<IS\>\_s*\)\=\<\S\+\>\>"
syntax	match	idmsxSetOrderClause	contained skipwhite skipempty nextgroup=idmsxFirst,idmsxLast,idmsxNext,idmsxPrior,idmsxSorted,idmsxSystemDefaultClause contains=@idmsxAlwaysValid,
	\		idmsxOrder,idmsxIs
	\	"\<ORDER\>\_s*\(\<IS\>\_s*\)\="
syntax	region	idmsxSetMemberSubEntry	fold contained contains=@idmsxAlwaysValid,
	\		idmsxSetMemberClause,idmsxInsertionClause,idmsxRetentionClause,idmsxSetKeyClause,idmsxSetSelectionClause
	\	start="^.\{6} \{1,}MEMBER\>"
	\	end="\ze\_s*\_^.\{6} \{1,}\(\<MEMBER\>\|\(\<RECORD\>\_s\+\(\<NAME\>\_s\+\)\=\(\<IS\>\_s\+\)\=\|\<SET\>\_s\+\(\<NAME\>\_s\+\)\=\(\<IS\>\_s\+\)\=\<\S\+\>\_s*\.\_s\+\)\)"
syntax	match	idmsxSetMemberClause	contained contains=@idmsxAlwaysValid,
	\		idmsxMember,idmsxIs,idmsxInternalName
	\	"\<MEMBER\>\_s*\(\<IS\>\_s*\)\=\<\S\+\>\>"
syntax	match	idmsxInsertionClause	contained contains=@idmsxAlwaysValid,
	\		idmsxInsertion,idmsxIs,idmsxAutomatic,idmsxManual
	\	"\<INSERTION\>\_s*\(\<IS\>\_s*\)\=\<\S\+\>\>"
syntax	match	idmsxRetentionClause	contained contains=@idmsxAlwaysValid,
	\		idmsxRetention,idmsxIs,idmsxAutomatic,idmsxMandatory,idmsxOptional
	\	"\<RETENTION\>\_s*\(\<IS\>\_s*\)\=\<\S\+\>\>"
syntax	match	idmsxSetKeyClause	contained skipwhite skipempty nextgroup=idmsxOrderClause contains=@idmsxAlwaysValid,
	\		idmsxKey,idmsxIs
	\	"\<KEY\>\_s*\(\<IS\>\)\="
syntax	match	idmsxSetSelectionClause contained contains=@idmsxAlwaysValid,
	\		idmsxSet,idmsxSelection,idmsxIs,idmsxBy,idmsxCurrent,idmsxOf,idmsxOwner
	\	"\<SET\>\_s*\<SELECTION\>\_s*\(\<IS\>\_s*\)\=\(\<BY\>\_s*\)\=\<CURRENT\>\_s*\(\<OF\>\_s*\)\=\<\S\+\>"
"
"	Clauses relating to an idmsx Storage Schema
"
"	The Storage Schemqa Definition
"
syntax	region	idmsxStorageSchemaDefinition	fold keepend contains=@idmsxAlwaysValid,
	\		idmsxStorage,idmsxSchema,idmsxName,idmsxExternalName,idmsxIs,idmsxFor,idmsxPunctuation
	\	start="^.\{6} \{1,4}\zeSTORAGE\>\_s*\<SCHEMA\>"
	\	end="\%$"
"
"	The Storage Schema Area Definition
"
syntax	region	idmsxAreaEntry	fold keepend containedin=idmsxStorageSchemaDefinition contains=@idmsxAlwaysValid,
	\		idmsxAreaName,idmsxPageRangeClause,idmsxWithinFileClause,idmsxOverflowClause,idmsxSpaceManagementClause,
	\		idmsxPageReserveClause,idmsxAlternativeClause,idmsxPageFormatClause
	\	start="^.\{6} \{1,4}\zeAREA\>"
	\	end="\ze\_s*\n.\{6} \{1,}\(FILE\|AREA\|RECORD\_s\+NAME\|SET\|INDEX\>\_s*FOR\)\>"

syntax	match	idmsxPageRangeClause	contained skipwhite skipempty nextgroup=idmsxPageRange contains=@idmsxAlwaysValid,
	\		idmsxRange,idmsxIs
	\	"\<RANGE\>\_s*\_s*\(\<IS\>\)\="

syntax	match	idmsxWithinFileClause	contained skipwhite skipempty nextgroup=idmsxRestrictedPageRange contains=@idmsxAlwaysValid,
	\		idmsxWithin,idmsxFile,idmsxInternalName
	\	"\<WITHIN\>\_s*\(\<FILE\>\_s*\)\=\<\S\+\>"

syntax	match	idmsxAlternativeClause	contained contains=@idmsxAlwaysValid,
	\		idmsxAlternative,idmsxTo,idmsxInternalName
	\	"\<ALTERNATIVE\>\_s*\(\<TO\>\_s*\)\=\<\S\+\>"

syntax	match	idmsxOverflowClause	contained skipwhite skipempty nextgroup=idmsxRestrictedPageRange,idmsxSystemDefaultClause contains=@idmsxAlwaysValid,
	\		idmsxOverflow,idmsxRange,idmsxIs
	\	"\<OVERFLOW\>\_s*\(\<RANGE\>\)\=\_s*\(\<IS\>\)\=\>"

syntax	match	idmsxSpaceManagementClause	contained skipwhite skipempty nextgroup=idmsxNumericLength contains=@idmsxAlwaysValid,
	\		idmsxSpace,idmsxManagement,idmsxRecord,idmsxSize,idmsxIs
	\	"\<SPACE\>\_s*\<MANAGEMENT\>\_s*\(\<RECORD\>\)\=\_s*\(\<SIZE\>\)\=\_s*\(\<IS\>\)\="

syntax	match	idmsxPageReserveClause	contained skipwhite skipempty nextgroup=idmsxNumericLength contains=@idmsxAlwaysValid,
	\		idmsxPage,idmsxReserve,idmsxContains
	\	"\<PAGE\>\_s*\<RESERVE\>\_s*\(\<CONTAINS\>\)\="

syntax	match	idmsxPageFormatClause	contained skipwhite skipempty nextgroup=idmsxSearchable,idmsxSystemDefaultClause contains=@idmsxAlwaysValid,
	\		idmsxPage,idmsxFormat,idmsxIs
	\	"\<PAGE\>\_s*\<FORMAT\>\_s*\(\<IS\>\)\="
"
"	The Storage Schema File Definition
"
syntax	region	idmsxFileEntry	fold keepend containedin=idmsxStorageSchemaDefinition contains=@idmsxAlwaysValid,
	\		idmsxFileName,idmsxPageSizeClause,idmsxDuplexClause
	\	start="^.\{6} \{1,4}\zeFILE\>"
	\	end="\ze\_s*\n.\{6} \{1,}\(FILE\|AREA\|RECORD\_s\+NAME\|SET\|INDEX\>\_s*FOR\)\>"

syntax	match	idmsxPageSizeClause	contained skipwhite skipempty nextgroup=idmsxNumericLength,idmsxBlockSize contains=@idmsxAlwaysValid,
	\		idmsxPage,idmsxSize,idmsxIs
	\	"\<PAGE\>\_s*\(\<SIZE\>\)\=\_s*\(\<IS\>\)\="

syntax	match	idmsxDuplexClause	contained contains=@idmsxAlwaysValid,
	\		idmsxDuplex,idmsxIs,idmsxAllowed
	\	"\<DUPLEX\>\_s*\(\<IS\>\_s*\)\=\<\S\+\>"
"
"	The Storage Schema Record Definition
"
syntax	region	idmsxStorageSchemaRecordEntry	fold keepend containedin=idmsxStorageSchemaDefinition contains=@idmsxAlwaysValid,
	\		idmsxRecordName,idmsxRecordIdClause,idmsxRecordPlacementClause,idmsxMinimumRootClause,idmsxMinimumFragmentClause,idmsxFormatClause
	\	start="^.\{6} \{1,4}\zeRECORD\_s\+NAME\>"
	\	end="\ze\_s*\n.\{6} \{1,}\(FILE\|AREA\|RECORD\_s\+NAME\|SET\|INDEX\>\_s*FOR\)\>"

syntax	match	idmsxRecordIdClause	contained contains=@idmsxAlwaysValid,
	\		idmsxRecord,idmsxIdentifier,idmsxIs,idmsxInteger
	\	"\<RECORD\>\_s*\<ID\(ENTIFIER\)\=\>\_s*\(\<IS\>\_s*\)\=\<\S\+\>"

syntax	match	idmsxRecordPlacementClause	contained skipwhite skipempty nextgroup=idmsxSystemDefaultClause,idmsxRandomPlacement,idmsxKeyedPlacement,idmsxDirect,idmsxPageDirectPlacement,idmsxViaSetPlacement,idmsxSequentialPlacement contains=@idmsxAlwaysValid,
	\		idmsxPlacement,idmsxIs
	\	"\<PLACEMENT\>\_s*\(\<IS\>\)\="

syntax	match	idmsxMinimumRootClause	contained skipwhite skipempty nextgroup=idmsxrecordLength,idmsxControlLength,idmsxNumericLength contains=@idmsxAlwaysValid,
	\		idmsxMinimum,idmsxRoot,idmsxLength,idmsxIs
	\	"\<MINIMUM\>\_s\+\<ROOT\>\_s*\(\<LENGTH\>\_s*\)\=\(\<IS\>\)\="

syntax	match	idmsxMinimumFragmentClause	contained skipwhite skipempty nextgroup=idmsxRecordLength,idmsxNumericLength contains=@idmsxAlwaysValid,
	\		idmsxMinimum,idmsxFragment,idmsxLength,idmsxIs
	\	"\<MINIMUM\>\_s\+\<FRAGMENT\>\_s*\(\<LENGTH\>\_s*\)\=\(\<IS\>\)"

syntax	match	idmsxControlLength	contained contains=@idmsxalwaysValid,
	\		idmsxControl,idmsxLength
	\	"\<CONTROL\>\_s*\(\<LENGTH\>\)\="

syntax	match	idmsxRecordLength	contained contains=@idmsxalwaysValid,
	\		idmsxRecord,idmsxLength
	\	"\<RECORD\>\_s*\(\<LENGTH\>\)\="

syntax	match	idmsxFormatClause	contained contains=@idmsxAlwaysValid,
	\		idmsxFormat,idmsxIs,idmsxCompressed
	\	"\<FORMAT\>\_s*\(\<IS\>\_s*\)\=\<\S\+\>"
"
"	The Storage Schema Set Definition
"
syntax	region	idmsxStorageSchemaSetEntry	fold keepend containedin=idmsxStorageSchemaDefinition contains=@idmsxAlwaysValid,
	\		idmsxSetName,idmsxSetModeClause,idmsxSetPointerClause
	\	start="^.\{6} \{1,4}\zeSET\>"
	\	end="\ze\_s*\n.\{6} \{1,}\(FILE\|AREA\|RECORD\_s\+\NAME\|SET\_s\+NAME\|INDEX\>\_s*FOR\)\>"

syntax	match	idmsxSetModeClause contained contains=@idmsxAlwaysValid,
	\		idmsxMode,idmsxIs,idmsxChain,idmsxIndex
	\	"\<MODE\>\_s*\(\<IS\>\_s*\)\=\<\S\+\>"

syntax	match	idmsxSetMemberPointerClause contained skipwhite skipempty nextgroup=idmsxPointerPositionClause contains=@idmsxAlwaysValid,
	\		idmsxFrom,idmsxMember,idmsxInternalName,idmsxTo,idmsxNext,idmsxPrior,idmsxOwner
	\	"\(\<MEMBER\>\_s*\)\=\(\<\S\+\>\_s*\)\=\(\<TO\>\_s*\)\=\<\(\(NEXT\|PRIOR\)\>\_s*\(\<\S\+\>\)\=\|OWNER\)\>\ze\_s*\<POSITION\>"

syntax	match	idmsxSetOwnerPointerClause contained skipwhite skipempty nextgroup=idmsxPointerPositionClause contains=@idmsxAlwaysValid,
	\		idmsxFrom,idmsxOwner,idmsxTo,idmsxFirst,idmsxLast,idmsxMember,idmsxIndex
	\	"\(\<OWNER\>\_s*\)\=\(\<TO\>\_s*\)\=\<\(FIRST\|LAST\)\>\_s*\(\<\S\+\>\)\=\ze\_s*\<POSITION\>"

syntax	match	idmsxSetPointerClause contained skipwhite skipempty nextgroup=idmsxSetOwnerPointerClause,idmsxSetMemberPointerClause contains=@idmsxAlwaysValid,
	\		idmsxPointer,idmsxFrom
	\	"\<POINTER\>\_s*\(\<FROM\>\)\="

syntax	match	idmsxPointerPositionClause contained contains=@idmsxAlwaysValid,
	\		idmsxPosition,idmsxIs,idmsxInteger
	\	"\<POSITION\>\_s*\(\<IS\>\_s*\)\=\<\d\+\>"
"
"	The Storage Schema Index Definition
"
syntax	region	idmsxIndexEntry	fold keepend containedin=idmsxStorageSchemaDefinition contains=@idmsxAlwaysValid,
	\		idmsxIndexName,idmsxIndexIdClause,idmsxIndexPlacementClause,idmsxWithinArea,idmsxMaximumLengthClause
	\	start="^.\{6} \{1,4}\zeINDEX\>\_s*\<FOR\>"
	\	end="\ze\_s*\n.\{6} \{1,}\(FILE\|AREA\|RECORD\_s\+NAME\|SET\|INDEX\>\_s*FOR\)\>"

syntax	match	idmsxIndexName	contained contains=@idmsxAlwaysValid,
	\		idmsxIndex,idmsxFor,idmsxSet,idmsxKey,idmsxInternalName
	\	"\<INDEX\>\_s*\<FOR\>\_s*\<\(KEY\|SET\)\_s*\<\S\+\>"

syntax	match	idmsxIndexIdClause	contained contains=@idmsxAlwaysValid,
	\		idmsxIndex,idmsxIdentifier,idmsxIs,idmsxInteger
	\	"\<INDEX\>\_s*\<ID\(ENTIFIER\)\=\>\_s*\(\<IS\>\_s*\)\=\<\S\+\>"

syntax	match	idmsxIndexPlacementClause	contained skipwhite skipempty nextgroup=idmsxCalc,idmsxSystemDefaultClause,idmsxViaOwnerPlacement contains=@idmsxAlwaysValid,
	\		idmsxPlacement,idmsxIs
	\	"\<PLACEMENT\>\_s*\(\<IS\>\)\="

syntax	match	idmsxMaximumLengthClause	contained contains=@idmsxAlwaysValid,
	\		idmsxMaximum,idmsxLength,idmsxIs,idmsxInteger,idmsxCharacters
	\	"\<MAXIMUM\>\_s\+\<LENGTH\>\_s*\(\<IS\>\_s*\)\=\<\S\+\>\(\_s*\<CHARACTERS\>\)\="
"
"	Comments follow COBOL guidelines
"
syntax	match	idmsxComments	"^.\{6}[/*C].*$"
"
"	Stuff after column 72 is in error - must be after all other 'match' entries
"
syntax	match	idmsxBad	"\%73c.*" containedin=ALLBUT,idmsxComments
syntax	match	idmsxBad	"^.\{6}\s\+[/*].*$"
"
" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
"
if version >= 508 || !exists("did_idmsx_syntax_inits")
  if version < 508
    let did_idmsx_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink	idmsxBAD	Error

  HiLink	idmsxMarker	Comment
  HiLink	idmsxSequenceNo	Comment
  HiLink	idmsxComments	Comment
  HiLink	idmsxTodo	Todo

  HiLink	idmsxInteger	Number
  HiLink	idmsxRecordId	Number
  HiLink	idmsxNumber		Number
  HiLink	idmsxPercentage	Number
  HiLink	idmsxDbKey		Constant
  HiLink	idmsxDbPageNo		Constant
  HiLink	idmsxDbLineNo		Constant
  HiLink	idmsxAll		Constant
  HiLink	idmsxNo		Constant
  HiLink	idmsxNotIfErrors	Constant
  HiLink	idmsxNotIfWarnings	Constant
  HiLink	idmsxOnly		Constant
  HiLink	idmsxTotal		Constant
  HiLink	idmsxYes		Constant

  HiLink	idmsxAccept	Statement
  HiLink	idmsxAccess	Statement
  HiLink	idmsxActual	Statement
  HiLink	idmsxAfter	Statement
  HiLink	idmsxAlias	Statement
  HiLink	idmsxAll	Statement
  HiLink	idmsxAllowed	Statement
  HiLink	idmsxAlter	Statement
  HiLink	idmsxAlternative	Statement
  HiLink	idmsxAlways	Statement
  HiLink	idmsxAnd	Statement
  HiLink	idmsxAre	Statement
  HiLink	idmsxArea	Statement
  HiLink	idmsxAreas	Statement
  HiLink	idmsxAreaCode	Statement
  HiLink	idmsxAreaId	Statement
  HiLink	idmsxAscending	Statement
  HiLink	idmsxAssign	Statement
  HiLink	idmsxAt	Statement
  HiLink	idmsxAuthor	Statement
  HiLink	idmsxAutomatic	Statement
  HiLink	idmsxBefore	Statement
  HiLink	idmsxBeforeImages	Statement
  HiLink	idmsxBinary	Statement
  HiLink	idmsxBit	Statement
  HiLink	idmsxBlock	Statement
  HiLink	idmsxBuffer	Statement
  HiLink	idmsxBy	Statement
  HiLink	idmsxCalc	Statement
  HiLink	idmsxCalcKey	Statement
  HiLink	idmsxCall	Statement
  HiLink	idmsxChain	Statement
  HiLink	idmsxChange	Statement
  HiLink	idmsxChanged	Statement
  HiLink	idmsxCharacter	Statement
  HiLink	idmsxCharacters	Statement
  HiLink	idmsxCheck	Statement
  HiLink	idmsxClose	Statement
  HiLink	idmsxComment	Statement
  HiLink	idmsxCompile	Statement
  HiLink	idmsxComplex	Statement
  HiLink	idmsxCompressed	Statement
  HiLink	idmsxComputational	Statement
  HiLink	idmsxComputational1	Statement
  HiLink	idmsxComputational2	Statement
  HiLink	idmsxComputational3	Statement
  HiLink	idmsxComputational4	Statement
  HiLink	idmsxComputational5	Statement
  HiLink	idmsxComputational6	Statement
  HiLink	idmsxConcurrency	Statement
  HiLink	idmsxConnect	Statement
  HiLink	idmsxContains	Statement
  HiLink	idmsxControl	Statement
  HiLink	idmsxCopy	Statement
  HiLink	idmsxCurrent	Statement
  HiLink	idmsxData	Statement
  HiLink	idmsxDatabase	Statement
  HiLink	idmsxDatabaseKey	Statement
  HiLink	idmsxDate	Statement
  HiLink	idmsxDdldml	Statement
  HiLink	idmsxDecimal	Statement
  HiLink	idmsxDecoding	Statement
  HiLink	idmsxDefault	Statement
  HiLink	idmsxDefined	Statement
  HiLink	idmsxDelayed	Statement
  HiLink	idmsxDelete	Statement
  HiLink	idmsxDepending	Statement
  HiLink	idmsxDescending	Statement
  HiLink	idmsxDescription	Statement
  HiLink	idmsxDevice	Statement
  HiLink	idmsxDeviceMedia	Statement
  HiLink	idmsxDiary	Statement
  HiLink	idmsxDirect	Statement
  HiLink	idmsxDirectDbk	Statement
  HiLink	idmsxDisconnect	Statement
  HiLink	idmsxDisplacement	Statement
  HiLink	idmsxDisplay	Statement
  HiLink	idmsxDistribution	Statement
  HiLink	idmsxDivision	Statement
  HiLink	idmsxDuplex	Statement
  HiLink	idmsxDuplicate	Statement
  HiLink	idmsxDuplicates	Statement
  HiLink	idmsxDuring	Statement
  HiLink	idmsxDynamic	Statement
  HiLink	idmsxEmpty	Statement
  HiLink	idmsxEncoding	Statement
  HiLink	idmsxEnd	Statement
  HiLink	idmsxEqual	Statement
  HiLink	idmsxErase	Statement
  HiLink	idmsxError	Statement
  HiLink	idmsxExclusive	Statement
  HiLink	idmsxFile	Statement
  HiLink	idmsxFiller	Statement
  HiLink	idmsxFind	Statement
  HiLink	idmsxFinish	Statement
  HiLink	idmsxFirst	Statement
  HiLink	idmsxFixed	Statement
  HiLink	idmsxFloat	Statement
  HiLink	idmsxFor	Statement
  HiLink	idmsxFormat	Statement
  HiLink	idmsxFragment	Statement
  HiLink	idmsxFrom	Statement
  HiLink	idmsxGet	Statement
  HiLink	idmsxHighValue	Statement
  HiLink	idmsxHighValues	Statement
  HiLink	idmsxIcl9id	Statement
  HiLink	idmsxIdentification	Statement
  HiLink	idmsxIdentified	Statement
  HiLink	idmsxIdentifier	Statement
  HiLink	idmsxIdmsarea	Statement
  HiLink	idmsxIdmsddl	Statement
  HiLink	idmsxIdmsfile	Statement
  HiLink	idmsxImmaterial	Statement
  HiLink	idmsxImplementor	Statement
  HiLink	idmsxIn	Statement
  HiLink	idmsxIndex	Statement
  HiLink	idmsxIndexed	Statement
  HiLink	idmsxInsecure	Statement
  HiLink	idmsxInsert	Statement
  HiLink	idmsxInsertion	Statement
  HiLink	idmsxInstallation	Statement
  HiLink	idmsxInvoke	Statement
  HiLink	idmsxIs	Statement
  HiLink	idmsxJournal	Statement
  HiLink	idmsxKey	Statement
  HiLink	idmsxKeys	Statement
  HiLink	idmsxLast	Statement
  HiLink	idmsxLeading	Statement
  HiLink	idmsxLeft	Statement
  HiLink	idmsxLength	Statement
  HiLink	idmsxLevelNo	Statement
  HiLink	idmsxLinked	Statement
  HiLink	idmsxLocation	Statement
  HiLink	idmsxLock	Statement
  HiLink	idmsxLocks	Statement
  HiLink	idmsxLowValue	Statement
  HiLink	idmsxLowValues	Statement
  HiLink	idmsxManagement	Statement
  HiLink	idmsxMandatory	Statement
  HiLink	idmsxManual	Statement
  HiLink	idmsxMaximum	Statement
  HiLink	idmsxMember	Statement
  HiLink	idmsxMembers	Statement
  HiLink	idmsxMinimum	Statement
  HiLink	idmsxMode	Statement
  HiLink	idmsxModify	Statement
  HiLink	idmsxMove	Statement
  HiLink	idmsxName	Statement
  HiLink	idmsxNext	Statement
  HiLink	idmsxNonExclusive	Statement
  HiLink	idmsxNot	Statement
  HiLink	idmsxNull	Statement
  HiLink	idmsxObtain	Statement
  HiLink	idmsxOccurrence	Statement
  HiLink	idmsxOccurs	Statement
  HiLink	idmsxOf	Statement
  HiLink	idmsxOn	Statement
  HiLink	idmsxOnly	Statement
  HiLink	idmsxOpen	Statement
  HiLink	idmsxOptional	Statement
  HiLink	idmsxOr	Statement
  HiLink	idmsxOrder	Statement
  HiLink	idmsxOverflow	Statement
  HiLink	idmsxOwner	Statement
  HiLink	idmsxPage	Statement
  HiLink	idmsxPageDirect	Statement
  HiLink	idmsxPageReserve	Statement
  HiLink	idmsxPages	Statement
  HiLink	idmsxPermanent	Statement
  HiLink	idmsxPicture	Statement
  HiLink	idmsxPlaced	Statement
  HiLink	idmsxPlacement	Statement
  HiLink	idmsxPointer	Statement
  HiLink	idmsxPointerArray	Statement
  HiLink	idmsxPooled	Statement
  HiLink	idmsxPosition	Statement
  HiLink	idmsxPrior	Statement
  HiLink	idmsxPrivacy	Statement
  HiLink	idmsxProcess		Statement
  HiLink	idmsxProcedure	Statement
  HiLink	idmsxProcessable	Statement
  HiLink	idmsxProtected	Statement
  HiLink	idmsxRandom	Statement
  HiLink	idmsxRange	Statement
  HiLink	idmsxReady	Statement
  HiLink	idmsxReal	Statement
  HiLink	idmsxRealm	Statement
  HiLink	idmsxRealms	Statement
  HiLink	idmsxRecord	Statement
  HiLink	idmsxRecords	Statement
  HiLink	idmsxRecordName	Statement
  HiLink	idmsxRedefines	Statement
  HiLink	idmsxRemarks	Statement
  HiLink	idmsxRemove	Statement
  HiLink	idmsxReports		Statement
  HiLink	idmsxReserve	Statement
  HiLink	idmsxResult	Statement
  HiLink	idmsxRetention	Statement
  HiLink	idmsxRetrieval	Statement
  HiLink	idmsxRight	Statement
  HiLink	idmsxRoot	Statement
  HiLink	idmsxRunUnit	Statement
  HiLink	idmsxRun	Statement
  HiLink	idmsxSchema	Statement
  HiLink	idmsxSearch	Statement
  HiLink	idmsxSearchable	Statement
  HiLink	idmsxSeconds	Statement
  HiLink	idmsxSection	Statement
  HiLink	idmsxSelection	Statement
  HiLink	idmsxSelective	Statement
  HiLink	idmsxSeparate	Statement
  HiLink	idmsxSequence	Statement
  HiLink	idmsxSequential	Statement
  HiLink	idmsxService	Statement
  HiLink	idmsxSet	Statement
  HiLink	idmsxSets	Statement
  HiLink	idmsxSign	Statement
  HiLink	idmsxSize	Statement
  HiLink	idmsxSorted	Statement
  HiLink	idmsxSource	Statement
  HiLink	idmsxSpace	Statement
  HiLink	idmsxSpaces	Statement
  HiLink	idmsxSr	Statement
  HiLink	idmsxStandard	Statement
  HiLink	idmsxStart	Statement
  HiLink	idmsxStatus	Statement
  HiLink	idmsxStorage	Statement
  HiLink	idmsxStore	Statement
  HiLink	idmsxSubschema	Statement
  HiLink	idmsxSynchronised	Statement
  HiLink	idmsxSynchronized	Statement
  HiLink	idmsxSysddl	Statement
  HiLink	idmsxSystem	Statement
  HiLink	idmsxSystemDefault	Statement
  HiLink	idmsxTable	Statement
  HiLink	idmsxTemporary	Statement
  HiLink	idmsxTermination	Statement
  HiLink	idmsxThen	Statement
  HiLink	idmsxThis	Statement
  HiLink	idmsxThrough	Statement
  HiLink	idmsxTimes	Statement
  HiLink	idmsxTimeOut	Statement
  HiLink	idmsxTo	Statement
  HiLink	idmsxTrailing	Statement
  HiLink	idmsxType	Statement
  HiLink	idmsxUpdate	Statement
  HiLink	idmsxUsage	Statement
  HiLink	idmsxUsageMode	Statement
  HiLink	idmsxUsing	Statement
  HiLink	idmsxValue	Statement
  HiLink	idmsxValues	Statement
  HiLink	idmsxVia	Statement
  HiLink	idmsxVirtual	Statement
  HiLink	idmsxWhere	Statement
  HiLink	idmsxWithin	Statement
  HiLink	idmsxZero	Statement
  HiLink	idmsxZeroes	Statement

  HiLink	idmsxExternalName	Identifier
  HiLink	idmsxInternalName	Identifier
  HiLink	idmsxDataName	Identifier

  HiLink	idmsxCompiler	PreProc

  HiLink	idmsxDeclA	Type
  HiLink	idmsxDecl	Type

  HiLink	idmsxPunctuation	Delimiter

  HiLink	idmsxExtras	Special
  HiLink	idmsxAreaB	Special
  HiLink	idmsxIndicator	Special
  HiLink	idmsxStringEscape	Special

  HiLink	idmsxConstant	Constant
  HiLink	idmsxNumber	Constant
  HiLink	idmsxPic	Constant
  HiLink	idmsxStringConst	Constant

  delcommand HiLink
endif

let b:current_syntax = "idmsx"

" vim: ts=6 nowrap
