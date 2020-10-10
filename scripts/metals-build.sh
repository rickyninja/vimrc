#!/usr/bin/env bash

coursier bootstrap \
  --java-opt -Xss4m \
  --java-opt -Xms100m \
  --java-opt -Dmetals.client=vim-lsp \
  org.scalameta:metals_2.12:0.9.4 \
  -r bintray:scalacenter/releases \
  -r sonatype:snapshots \
  -o $HOME/bin/metals-vim -f
