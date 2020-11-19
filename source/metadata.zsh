size() { du -sh $@ | cut -f1 }

alias created='getfileinfo -d'
alias v{ersion,}='mdls -name kMDItemVersion -raw'

# https://developer.mozilla.org/docs/Web/HTTP/Basics_of_HTTP/MIME_types
alias mime='file --mime-type -b'

# https://developer.apple.com/documentation/uniformtypeidentifiers
alias  uti='mdls -name kMDItemContentType     -raw'
alias utis='mdls -name kMDItemContentTypeTree -raw'

# https://developer.mozilla.org/docs/Web/API/FontData/postscriptName
alias {postscript,ps,font}name='fc-scan --format %{postscriptname}'
