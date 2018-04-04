syntax match MixedWhitespace /[^\t]\zs\t\+\|\s\+$\|^\t\+\zs \+/
syntax match MixedWhitespace /\%>120v./
highlight LongLines ctermbg=yellow cterm=NONE
highlight MixedWhitespace ctermbg=red  cterm=NONE
