" if exists("did_load_filetypes")
	" echom "did_load_filetypes in" expand("<sfile>")
	" finish
" endif

if exists("did_load_filetypes_userafter")
	" echom "did_load_filetypes_userafter in" expand("<sfile>")
	finish
endif
let did_load_filetypes_userafter = 1

augroup filetypedetect
	" au! commands to set the filetype go here
	au BufNewFile,BufRead *.ftl,*.vm
				\ setlocal syntax=jsp
				" \ echom 'changing settings for' expand("<amatch>") 'in' expand("<sfile>") |
	au BufNewFile,BufRead Jenkinsfile,Jenkinsfile*
				\ setfiletype groovy
				" \ echom 'changing settings for' expand("<amatch>") 'in' expand("<sfile>") |
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
