# !/bin/bash

GREEN="\e[1;32m"
RED="\e[1;31m"
BLUE="\e[0;34m"

RESET="\e[0m"

log_info() {
  echo -e "${BLUE}[INFO]${RESET} $1"
}


log_success() {
  echo -e "${GREEN}[SUCCESS] $1${RESET}"
}

log_error() {
  echo -e "${RED}[ERROR] $1${RESET}"
}

find . -type d -print0 | while IFS= read -r -d $'\0' dir; do
  {
    log_info "Modificando ${dir}"
    new_dir=$(echo "$dir" | sed 's/\s/_/g')
    mv "$dir" "$new_dir"
    result=$?
    log_success "Carpeta renombrada como ${new_dir}"
  } || {
    log_error "Ocurrió un error al modificar el nombre. Exit status. ${result}"
  }
done
