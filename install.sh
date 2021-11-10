#!/bin/sh

BLUE=$(printf '\033[34m')
BOLD=$(printf '\033[1m')
RESET=$(printf '\033[0m')
    
printf "${BLUE}${BOLD}:: Linking configs...${RESET}\n"
./script/link_config_files.sh
printf "${BLUE}${BOLD}:: Finished configs linking${RESET}\n"

printf "\n"
printf "${BLUE}${BOLD}:: Installing zsh theme...${RESET}\n"
./script/upgrade_zsh_theme.sh
printf "${BLUE}${BOLD}:: Finished zsh theme installing${RESET}\n"

printf "\n"
printf "${BLUE}${BOLD}:: Installing asdf...${RESET}\n"
./script/upgrade_asdf.sh
printf "${BLUE}${BOLD}:: Finished asdf installing${RESET}\n"

printf "\n"
printf "${BLUE}${BOLD}:: Installing asdf plugins...${RESET}\n"
./script/upgrade_asdf_plugins.sh
printf "${BLUE}${BOLD}:: Finished asdf plugins installing${RESET}\n"

printf "\n"
printf "${BLUE}${BOLD}:: Installing oh-my-zsh plugins...${RESET}\n"
./script/upgrade_omz_plugins.sh
printf "${BLUE}${BOLD}:: Finished oh-my-zsh plugins installing${RESET}\n"

printf "\n"
printf "${BLUE}${BOLD}:: Installing LSP servers...${RESET}\n"
./script/upgrade_lsp_servers.sh
printf "${BLUE}${BOLD}:: Finished LSP servers installing${RESET}\n"

printf "\n"
printf "${BLUE}${BOLD}:: Installing nvim config...${RESET}\n"
./script/upgrade_nvim_config.sh
printf "${BLUE}${BOLD}:: Finished nvim config installing${RESET}\n"

