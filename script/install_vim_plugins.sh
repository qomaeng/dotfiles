#!/bin/sh

printf ":: Upgrading vim plugins...\n"

vim -c :PlugUpdate

printf ":: Upgraded vim plugins\n"

