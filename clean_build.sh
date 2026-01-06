#!/bin/bash

echo "🧹 Limpiando archivos anteriores..."
rm -rf build/ dist/ __pycache__/
find . -name "*.pyc" -delete

echo "Compilando aplicación nuevamente y desde cero..."
python -m PyInstaller --clean --onedir --windowed \
  --icon=inecon_app/views/icons/tarifa.ico \
  --add-data=inecon_app/views/icons:views/icons \
  --hidden-import=PIL._tkinter_finder \
  --hidden-import=PIL.ImageTk \
  --hidden-import=PIL.Image \
  --hidden-import=PIL._imagingtk \
  --hidden-import=tkinter \
  inecon_app/inecon_app.py

echo "✅ Build completado!"
