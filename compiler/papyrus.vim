"Vim compiler file
" Compiler: Papyrus
" Maintainer: Sirtaj Singh Kang <sirtaj@sirtaj.net>

"if exists("current_compiler")
"    finish
"endif
let current_compiler="papyrus"

if exists(":CompilerSet") != 2
    command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo-=C

if exists("skyrim_install_path")
    let s:papyrus_compiler=skyrim_install_path.'\"Papyrus Compiler"\PapyrusCompiler.exe'
    let s:skyrim_scripts=skyrim_install_path.'\Data\Scripts'

    let &g:makeprg=s:papyrus_compiler.
                \' %'.
                \' -i='.s:skyrim_scripts.'\Source'.
                \' -o='.s:skyrim_scripts.
                \' -f='.s:skyrim_scripts.'\Source\TESV_Papyrus_flags.flg'

    unlet s:skyrim_scripts s:papyrus_compiler
endif

setlocal errorformat=%f(%l\\,%c):\ %m
setlocal errorformat+=<unknown>(%l\\,%c):\ %m


let &cpo = s:cpo_save
unlet s:cpo_save

" vim:set sw=4 sts=4 et:
