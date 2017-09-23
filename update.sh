#!/bin/bash

for dockerfile in $(find . -type f -name Dockerfile); do
  dockerfile=${dockerfile#./}
  suite=${dockerfile%/Dockerfile}
  test -n "$(grep '^# GENERATED' ${dockerfile})" || continue;
  cat Dockerfile.template | sed -e "s!@SUITE@!${suite}!g" > ${dockerfile}
done
