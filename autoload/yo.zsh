case $1 in
  -*|*/*|completion|doctor) npx yo $@;;

  *) setopt extendedglob
    mktemp -d | read tmp
    pushd $tmp
    npm install generator-${1/generator-}
    npx yo $@
    popd
    mv $tmp/^node_modules $PWD
    rm *.json
esac
