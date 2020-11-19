echo -onlyin\ {,/System,~}/Applications | read
alias app-path="mdfind kind:application $REPLY -interpret"

app-domain() {
  mdfind kind:application $=REPLY -interpret $@ -attr kMDItemCFBundleIdentifier |
  tail -n1 | awk '{ print $NF }'
}
