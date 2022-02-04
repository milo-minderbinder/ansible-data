" echom "changing settings in" expand("<sfile>")
" echo "old:"
" verbose setlocal expandtab tabstop shiftwidth softtabstop formatprg
" setlocal expandtab tabstop=4 shiftwidth=0 softtabstop=-1 formatprg=black\ -q\ -
setlocal formatprg=black\ -q\ -
" echo "new:"
" verbose setlocal expandtab tabstop shiftwidth softtabstop formatprg
