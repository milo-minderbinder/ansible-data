if exists("did_load_filetypes_userafter")
	finish
endif
let did_load_filetypes_userafter = 1
augroup filetypedetect
	" au! commands to set the filetype go here
	au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn,*.md
				\ setfiletype markdown |
				\ setlocal expandtab tabstop=2 shiftwidth=0 softtabstop=-1
	au BufNewFile,BufRead *.ftl,*.vm
				\ setlocal syntax=jsp
	au BufNewFile,BufRead *.java
				\ setlocal expandtab tabstop=4 shiftwidth=0 softtabstop=-1
	au BufNewFile,BufRead *.groovy,*.gradle,Jenkinsfile,Jenkinsfile*
				\ setlocal expandtab tabstop=4 shiftwidth=0 softtabstop=-1 syntax=groovy
	" au BufNewFile,BufRead *.py
	" 			\ setlocal expandtab tabstop=4 shiftwidth=0 softtabstop=-1
	au BufNewFile,BufRead pip.conf
				\ setlocal commentstring=#\ %s
	au FileType toml
				\ setlocal commentstring=#\ %s
	au BufNewFile,BufRead *.yml,*.yaml
				\ setlocal expandtab tabstop=2 shiftwidth=0 softtabstop=-1
	au BufNewFile,BufRead ~/code/ansible-data/*.yml,~/code/ansible-data/*.yaml
				\ setlocal filetype=yaml.ansible
augroup END
