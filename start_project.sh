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
  echo -e "\n${BLUE}[INFO]${NOCOLOR} $1"
}

log_success() {
  echo -e "${GREEN}[SUCCESS] $1${NOCOLOR}"
}

# Crear proyecto
echo "Ingresa un nombre para el proyecto (usa guión bajo en lugar de espacios):"
read project_name

mkdir "$project_name" && cd $_

log_success "Se creó el proyecto ${project_name}"

log_info "Inicializando repositorio de Git..."
git init

log_info "Creando directorio y archivos iniciales..."
touch .gitignore
echo "data/" >> .gitignore
touch requirements.txt
cat <<EOF >> requirements.txt
pandas==2.2.3
customtkinter==5.2.2
openpyxl==3.1.5
EOF

touch main.py
mkdir views
touch views/app.py

log_info "Confirmando cambios..."
git add .
git commit -m "First commit: project uploaded"

log_info "Creando entorno virtual..."
echo "Ingresa un nombre para el entorno virtual:"
read env_name

echo "Ingresa la versión de Python:"
read python_version

if pyenv versions --bare | grep -q "^$project_name$"; then
  echo "Ingresa un nombre para el entorno virtual:"
  read env_name
fi

pyenv virtualenv "$python_version" "$env_name"
pyenv local "$env_name"
log_success "El entorno ${env_name} ha sido activado"

log_info "Instalando librerías y dependencias..."
python -m pip install --upgrade pip
pip install -r requirements.txt
log_success "Librerías y dependencias instaladas"

log_info "Creando repositorio en GitHub..."
echo "Describe el propósito de tu proyecto:"
read description
gh repo create "$project_name" --public -d "$description" --source . --push

echo ""
log_success "*** Proyecto creado y subido exitosamente! 👌 ***"
