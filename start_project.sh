#!/bin/bash

# Estilos
BOLD='\e[1m'
UNDERLINE='\e[4m'

# Colores
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NOCOLOR='\033[0m' # para resetear color

# Función para imprimir con colorcito ;)
log_info() {
  echo -e "${BLUE}[INFO]${NOCOLOR} $1"
}

log_success() {
  echo -e "${GREEN}[SUCCESS] $1${NOCOLOR}"
}

# Crear proyecto
echo "Nombre del proyecto (usa guión bajo en lugar de espacios):"
read project_name

mkdir "$project_name" && cd $_

log_info "Se creó el proyecto ${project_name}"

log_info "Inicializando repositorio de Git"
git init

log_info "Creando directorio y archivos iniciales"
touch .gitignore
touch requirements.txt
echo "data/" >> .gitignore
touch main.py

mkdir views
touch views/app.py

log_info "Confirmando cambios..."
git add .
git commit -m "First commit: project uploaded"

log_info "Creando repositorio en GitHub"
echo "Describe el propósito de tu proyecto"
read description

gh repo create "$project_name" --public -d "$description" --source . --push

log_success "Proyecto creado y subido exitosamente! 👌"
