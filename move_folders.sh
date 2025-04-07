# !/bin/bash

# colores en bold
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'

BLUE='\033[1;34m'
RESET='\033[0m'

log_info() {
  echo -e "${BLUE}[INFO]${RESET} $1"
}

log_success() {
  echo -e "${GREEN}[SUCCESS] $1${RESET}"
}

log_error() {
  echo -e "${RED}[ERROR] $1${RESET}"
}

log_warning() {
  echo -e "${YELLOW}[ERROR]${RESET} $1"
}

ghuser=$(gh api user | jq -r '.login')

log_info "¡Bienvenid@ ${ghuser}!"

log_info "Ingresando a la carpeta ~/code/${ghuser}"
cd ~/code/"${ghuser}"

log_info "Vamos a crear una carpeta a donde moveremos el contenido"
sleep 5
# crea carpeta con número del batch
read -p "Ingresa el número de tu batch: " batchnumber

mkdir "ds-bootcamp-${batchnumber}"

folders=(*)
counter=0

for folder in "${folders[@]}"; do
  if [ -d "$folder" ]; then
    if grep -E "^[0-9]" <<< "$folder"; then
      counter=$(( counter+1 ))
      mv "$folder" "ds-bootcamp-${batchnumber}/${folder}" || continue
    else
      log_warning "${folder} no se moverá"
    fi
  else
    log_warning "${folder} no es un directorio"
  fi
done
log_success "${counter} carpetas se movieron a 'ds-bootcamp-${batchnumber}'"
