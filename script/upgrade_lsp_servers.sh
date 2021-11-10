#!/bin/sh

rustup component add rust-src
rustup +nightly component add rust-analyzer-preview

go install golang.org/x/tools/gopls@latest

yarn global add \
  pyright \
  typescript-language-server

