" Vim syntax file for SPARC Assembler
"
" Revamped by Steven Kneiser and Josh Miles:
" https://github.com/theshteves
"
" Forked from Nicolas Herry:
" https://github.com/vim-scripts/sparc.vim

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif
syntax case ignore
syntax match sparcComment /!.*/
syntax match sparcLabel /[A-Z0-9_\-]\+:/
syntax match sparcRegister /[%][oilrg][0-9]*/
syntax match sparcRegister /[%][sf]p/

syntax region sparcString start=/"/ skip=/\\"/ end=/"/
syntax match sparcNumber /\s\d\+/
syntax match sparcNumber /\s-\d\+/
syntax match sparcNumber /\s[0][x]\x\+/
syntax match sparcAsmDirective /[.]\w\+/


syntax keyword sparcMnemonic flush ldsb ldsh ldstub ldub lduh ld ldd ldsba ldsha lduba lduha lda ldda ldstuba  nop rd sethi sll srl sra stb sth st std stba stha sta stda  swap swapa unimp wr btst bset bclr btog clr clrb clrh cmp dec deccc inc inccc mov set skipz skipnz tst ldn ldna stn stna setn setnhi casn slln srln sran clrn

syntax keyword sparcMnemonicLogical  and andcc andn andcc or orcc orn orncc xnor xnorcc xor xorcc negnot 

syntax keyword sparcMnemonicArithmetic add addcc addx addxcc mulscc sdiv sdivcc smul smulcc udiv udivcc umul umulcc taddcc tsubcc taddcctv tsubcctv sub subcc subx subxcc

syntax keyword sparcMnemonicBranch bn bne be beq bgt bg ble bge bl blt bgu bleu bcc bcs bpos bneg bvc bvs ba call jmpl save ret restore rett jmp fbn fbu fbg fbug fbl fblg fbne fbe fbue fbge fbuge fble fbule fbo fba cbn cb3 cb2 cb23 cb1 cb13 cb12 cb123 cb0 cb03 cb02 cb023 cb01 cb013 cb012 cba

syntax keyword sparcMnemonicFPI fitos fitod fitoq fstoi fdtoi fstod fstoq fdtos fdtoq fqtod fqtos fmovs fnegs fabss fsqrts fsqrtd fsqrtq fadds faddd faddq fsubs fsubd fsubq fmuls fmuld fmulq fsmulq fdivs fdivd fdivq fcmps fcmpd fcmpq fcmpes fcmped fcmpeq

syntax keyword sparcMnemonicTrap tn tne te tg tle tge tl tgu tleu tlu tgeu tpos tneg tvc tvs ta

syntax keyword sparcMnemonicCopro cpop1 cpop2

syntax keyword sparcAsmDirective alias align ascii asciz byte common double empty file global half ident local noalias nonvolatile nword optim popsection proc pushsection quad reserve section seg single size skip stabn stabs type uahalf uaword version volatile weak word xword xstabs

if !exists("did_sparc_syntax_inits")
   	let did_sparc_syntax_inits=1
	highlight link sparcComment Comment
	highlight link sparcLabel Identifier
	highlight link sparcString String
	highlight link sparcNumber Number

	highlight link sparcAsmDirective Preproc

	highlight link sparcMnemonic Keyword
	highlight link sparcMnemonicLogical Statement
	highlight link sparcMnemonicArithmetic Statement
	highlight link sparcMnemonicBranch Keyword
	highlight link sparcMnemonicTrap Keyword
	highlight link sparcMnemonicFPI Keyword
	highlight link sparcMnemonicCopro Keyword
	highlight link sparcMnemonicSyn Conditional

	highlight link sparcRegister Type
endif

let b:current_syntax="sparc"
