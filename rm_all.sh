#!/bin/bash

BOLDGREEN="\e[1;32m"
BOLDRED="\e[1;31m"
YELLOW="\e[1;33m"
BLUE="\e[0;34m"
BOLDPURPLE="\e[1;35m"
RESET="\e[0m"

log_info() {
  echo -e "${BLUE}[INFO] ${RESET}$1"
}

log_success() {
  echo -e "${BOLDGREEN}[SUCCESS] $1${RESET}"
}

log_error() {
  echo -e "${BOLDRED} [ERROR] $1${RESET}"
}

log_warning() {
  echo -e "${YELLOW} [WARNING] ${RESET}$1"
}

all_folders=(*)
log_info "*** Preparando carpetas para borrar recursivamente ***"
echo ""

for folder in ${all_folders[@]}; do
  log_info "Borrando ${BOLDPURPLE}${folder}${RESET}"
  rm -rf "$folder"
done

echo ""
log_success "Borrado todo con éxito!"
