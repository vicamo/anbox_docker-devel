#!/bin/bash

travisEnv=
for dockerfile in $(find . -type f -name Dockerfile | sort); do
  dockerfile=${dockerfile#./}
  suite=${dockerfile%/Dockerfile}
  test -n "$(grep '^# GENERATED' ${dockerfile})" || continue;
  cat Dockerfile.template | sed -e "s!@SUITE@!${suite}!g" > ${dockerfile}

  travisEnv+='  - SUITE='"${suite}"'\n'
done
travisEnv=${travisEnv%'\n'}

travis="$(awk -v 'RS=\n\n' '($1 == "env:") { $0 = substr($0, 0, index($0, "matrix:") + length("matrix:"))"'"$travisEnv"'" } { printf "%s%s", $0, RS }' .travis.yml)"
echo "$travis" > .travis.yml
