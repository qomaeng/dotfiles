#!/bin/sh

printf ":: Upgrading nvim plugins...\n"

nvim -c :PackerSync

printf ":: Upgraded nvim plugins\n"

