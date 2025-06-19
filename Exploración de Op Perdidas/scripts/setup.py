#!/usr/bin/env python3
"""
Script de configuración inicial del proyecto
"""

import os
import sys
from pathlib import Path

def setup_environment():
    """Configura el entorno inicial del proyecto"""
    
    # Crear directorios adicionales si no existen
    dirs_to_create = [
        'logs',
        'models/trained',
        'models/evaluation',
        'reports/figures',
        'data/raw',
        'data/processed'
    ]
    
    for dir_path in dirs_to_create:
        Path(dir_path).mkdir(parents=True, exist_ok=True)
        print(f"✓ Directorio creado/verificado: {dir_path}")
    
    print("\n✅ Configuración inicial completada!")
    print("📋 Próximos pasos:")
    print("1. Instalar dependencias: pip install -r requirements.txt")
    print("2. Agregar tus datos en data/raw/")
    print("3. Comenzar con notebooks/exploratory/")

if __name__ == "__main__":
    setup_environment()
