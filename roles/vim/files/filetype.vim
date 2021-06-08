if exists("did_load_filetypes_userafter")
	finish
endif
let did_load_filetypes_userafter = 1
augroup filetypedetect
	" au! commands to set the filetype go here
	au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn,*.md setlocal filetype=markdown |
		\ setlocal expandtab |
		\ setlocal shiftwidth=2 |
		\ setlocal tabstop=2 |
		\ setlocal softtabstop=2
	au BufNewFile,BufRead *.ftl,*.vm setlocal syntax=jsp
	au BufNewFile,BufRead *.java
		\ setlocal expandtab |
		\ setlocal shiftwidth=4 |
		\ setlocal tabstop=4 |
		\ setlocal softtabstop=0
	au BufNewFile,BufRead *.groovy,*.gradle,Jenkinsfile,Jenkinsfile* setlocal syntax=groovy |
		\ setlocal expandtab |
		\ setlocal shiftwidth=4 |
		\ setlocal tabstop=4 |
		\ setlocal softtabstop=0
	"au BufNewFile,BufRead *.py
		"\ setlocal expandtab |
		"\ setlocal shiftwidth=4 |
		"\ setlocal tabstop=4 |
		"\ setlocal softtabstop=4
	au BufNewFile,BufRead *.yml,*.yaml
		\ setlocal expandtab |
		\ setlocal shiftwidth=2 |
		\ setlocal tabstop=2 |
		\ setlocal softtabstop=2
	au BufNewFile,BufRead ~/code/ansible-data/*.yml,~/code/ansible-data/*.yaml setlocal filetype=yaml.ansible
augroup END
