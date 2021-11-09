#!/bin/sh

yarn global add \
  pyright \
  typescript-language-server \

rustup component add rust-src
rustup +nightly component add rust-analyzer-preview

