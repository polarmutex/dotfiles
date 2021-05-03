
# ls, the common ones I use a lot shortened for rapid fire usage
alias l='ls -lFh --color'     #size,show type,human readable
alias la='ls -lAFh --color'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh --color'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh --color'   #long list,sorted by date,show type,human readable
alias ll='ls -l --color'      #long list
alias ldot='ls -ld .* --color'
alias lS='ls -1FSsh --color'
alias lart='ls -1Fcart --color'
alias lrt='ls -1Fcrt --color'

alias zshrc='${=EDITOR} ${ZDOTDIR:-$HOME}/.zshrc' # Quick access to the .zshrc file

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias t='tail -f'

