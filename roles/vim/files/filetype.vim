" echom "running additional filetype autocommands in" expand("<sfile>")
" if exists("did_load_filetypes")
" 	echom "did_load_filetypes already set in" expand("<sfile>")
" 	" finish
" endif

if exists("did_load_filetypes_userafter")
	echom "did_load_filetypes_userafter already set in" expand("<sfile>")
	finish
endif
let did_load_filetypes_userafter = 1

augroup filetypedetect
	" au! commands to set the filetype go here
	au BufNewFile,BufRead *.ftl,*.vm
				\ setlocal syntax=jsp
				" \ echom 'changing settings for' expand("<amatch>") 'in' expand("<sfile>") |
	au BufNewFile,BufRead Jenkinsfile*
				\ setfiletype groovy
				" \ echom 'current filetype for' expand("%:t") 'is' &ft 'but would be set to groovy in' expand("<sfile>:t")
	au BufNewFile,BufRead *.jinja,*.jinja2
				\ setfiletype jinja2
	au BufNewFile,BufRead pip.conf
				\ setlocal commentstring=#\ %s
				" \ echom 'changing settings for' expand("<amatch>") 'in' expand("<sfile>") |
	au FileType lark
				\ setlocal commentstring=//\ %s
				" \ echom 'changing settings for' expand("<amatch>") 'in' expand("<sfile>") |
	au FileType toml
				\ setlocal commentstring=#\ %s
				" \ echom 'changing settings for' expand("<amatch>") 'in' expand("<sfile>") |
augroup END
