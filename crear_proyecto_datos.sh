#!/bin/bash

# Script para crear estructura de carpetas para proyecto de análisis de datos
# Autor: Script generado para análisis de datos
# Fecha: $(date +%Y-%m-%d)

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== Creando estructura de proyecto de análisis de datos ===${NC}"

# Obtener nombre del proyecto
read -p "Ingresa el nombre del proyecto (por defecto: mi_proyecto_datos): " PROJECT_NAME
PROJECT_NAME=${PROJECT_NAME:-mi_proyecto_datos}

# Crear directorio principal del proyecto
if [ -d "$PROJECT_NAME" ]; then
    echo -e "${YELLOW}¡Advertencia! El directorio '$PROJECT_NAME' ya existe.${NC}"
    read -p "¿Deseas continuar? Los archivos existentes no se sobrescribirán (y/n): " CONTINUE
    if [ "$CONTINUE" != "y" ] && [ "$CONTINUE" != "Y" ]; then
        echo -e "${RED}Operación cancelada.${NC}"
        exit 1
    fi
fi

mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

echo -e "${GREEN}✓${NC} Creando estructura en: $(pwd)"

# Crear estructura de carpetas
echo -e "${BLUE}Creando directorios...${NC}"

# Carpetas principales
mkdir -p data/{raw,processed,external,interim}
mkdir -p notebooks/{exploratory,final}
mkdir -p src/{data,features,models,visualization}
mkdir -p models/{trained,evaluation}
mkdir -p reports/{figures,presentations,documents}
mkdir -p config
mkdir -p tests
mkdir -p docs
mkdir -p scripts
mkdir -p logs

echo -e "${GREEN}✓${NC} Estructura de carpetas creada"

# Crear archivos README para cada carpeta principal
echo -e "${BLUE}Creando archivos README...${NC}"

# README principal
cat > README.md << 'EOF'
# Proyecto de Análisis de Datos

## Descripción del Proyecto
Breve descripción de tu proyecto de análisis de datos.

## Estructura del Proyecto
```
├── data/
│   ├── raw/           # Datos originales, inmutables
│   ├── processed/     # Datos limpios y procesados
│   ├── external/      # Datos de fuentes externas
│   └── interim/       # Datos intermedios durante procesamiento
├── notebooks/
│   ├── exploratory/   # Análisis exploratorio
│   └── final/         # Notebooks finales
├── src/
│   ├── data/          # Scripts para descargar/generar datos
│   ├── features/      # Scripts para feature engineering
│   ├── models/        # Scripts para entrenar modelos
│   └── visualization/ # Scripts para crear visualizaciones
├── models/
│   ├── trained/       # Modelos entrenados
│   └── evaluation/    # Métricas y evaluaciones
├── reports/
│   ├── figures/       # Gráficos y figuras
│   ├── presentations/ # Presentaciones
│   └── documents/     # Reportes en PDF, Word, etc.
├── config/            # Archivos de configuración
├── tests/             # Tests unitarios
├── docs/              # Documentación
├── scripts/           # Scripts de automatización
└── logs/              # Archivos de log
```

## Instalación y Uso
1. Clona este repositorio
2. Instala las dependencias: `pip install -r requirements.txt`
3. Ejecuta los notebooks en orden numérico

## Contribución
Describe cómo otros pueden contribuir al proyecto.
EOF

# README para data
cat > data/README.md << 'EOF'
# Directorio de Datos

## Estructura:
- **raw/**: Datos originales, nunca modificar estos archivos
- **processed/**: Datos limpios listos para análisis
- **external/**: Datos de fuentes externas (APIs, bases de datos)
- **interim/**: Datos intermedios durante el procesamiento

## Convenciones:
- Usar nombres descriptivos para los archivos
- Incluir fecha en el nombre si es relevante
- Mantener un registro de la fuente de los datos
EOF

# README para notebooks
cat > notebooks/README.md << 'EOF'
# Notebooks

## Estructura:
- **exploratory/**: Análisis exploratorio de datos (EDA)
- **final/**: Notebooks finales y limpios para presentación

## Convenciones de nomenclatura:
- Usar números para orden: 01_exploration.ipynb, 02_modeling.ipynb
- Nombres descriptivos y en inglés o español consistentemente
- Mantener notebooks limpios y bien documentados
EOF

# README para src
cat > src/README.md << 'EOF'
# Código Fuente

## Estructura:
- **data/**: Scripts para adquisición y procesamiento de datos
- **features/**: Scripts para feature engineering
- **models/**: Scripts para entrenamiento y predicción
- **visualization/**: Scripts para generar visualizaciones

## Convenciones:
- Funciones bien documentadas
- Código modular y reutilizable
- Tests para funciones críticas
EOF

# README para reports
cat > reports/README.md << 'EOF'
# Reportes y Resultados

## Estructura:
- **figures/**: Gráficos, plots y visualizaciones
- **presentations/**: Presentaciones PowerPoint, PDF
- **documents/**: Reportes técnicos, papers

## Convenciones:
- Usar nombres descriptivos
- Incluir fecha de generación
- Mantener versiones de figuras importantes
EOF

echo -e "${GREEN}✓${NC} Archivos README creados"

# Crear archivos de configuración básicos
echo -e "${BLUE}Creando archivos de configuración...${NC}"

# requirements.txt
cat > requirements.txt << 'EOF'
# Análisis de datos
pandas>=1.5.0
numpy>=1.24.0
scipy>=1.10.0

# Visualización
matplotlib>=3.6.0
seaborn>=0.12.0
plotly>=5.17.0

# Machine Learning
scikit-learn>=1.3.0
xgboost>=1.7.0

# Jupyter
jupyter>=1.0.0
ipykernel>=6.25.0

# Utilidades
python-dotenv>=1.0.0
pyyaml>=6.0
tqdm>=4.66.0

# Testing
pytest>=7.4.0
EOF

# .gitignore
cat > .gitignore << 'EOF'
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class

# C extensions
*.so

# Distribution / packaging
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
*.egg-info/
.installed.cfg
*.egg
MANIFEST

# PyInstaller
*.manifest
*.spec

# Installer logs
pip-log.txt
pip-delete-this-directory.txt

# Unit test / coverage reports
htmlcov/
.tox/
.coverage
.coverage.*
.cache
nosetests.xml
coverage.xml
*.cover
.hypothesis/
.pytest_cache/

# Jupyter Notebook
.ipynb_checkpoints

# pyenv
.python-version

# Environment variables
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/

# IDEs
.vscode/
.idea/
*.swp
*.swo
*~

# OS
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Data files (uncomment if you don't want to track large data files)
# *.csv
# *.xlsx
# *.json
# *.pkl
# *.h5

# Model files
*.joblib
*.pkl
*.h5
*.hdf5

# Log files
*.log
logs/*.log
EOF

# Archivo de configuración básico
cat > config/config.yaml << 'EOF'
# Configuración del proyecto
project:
  name: "Mi Proyecto de Datos"
  version: "1.0.0"
  description: "Análisis de datos con Python"

# Rutas de datos
data:
  raw: "data/raw/"
  processed: "data/processed/"
  external: "data/external/"
  interim: "data/interim/"

# Configuración de modelos
models:
  output_dir: "models/trained/"
  evaluation_dir: "models/evaluation/"

# Configuración de reportes
reports:
  figures_dir: "reports/figures/"
  output_dir: "reports/documents/"

# Logging
logging:
  level: "INFO"
  file: "logs/project.log"
EOF

# Script básico de setup
cat > scripts/setup.py << 'EOF'
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
EOF

chmod +x scripts/setup.py

echo -e "${GREEN}✓${NC} Archivos de configuración creados"

# Crear algunos archivos ejemplo
echo -e "${BLUE}Creando archivos ejemplo...${NC}"

# Notebook ejemplo
cat > notebooks/exploratory/00_template_exploration.ipynb << 'EOF'
{
 "cells": [
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "# Análisis Exploratorio de Datos - Template\n",
    "\n",
    "## Objetivo\n",
    "Describir el objetivo de este análisis\n",
    "\n",
    "## Dataset\n",
    "Describir el dataset utilizado"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Importar librerías\n",
    "import pandas as pd\n",
    "import numpy as np\n",
    "import matplotlib.pyplot as plt\n",
    "import seaborn as sns\n",
    "\n",
    "# Configuración\n",
    "plt.style.use('seaborn-v0_8')\n",
    "sns.set_palette('husl')\n",
    "%matplotlib inline"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Cargar datos\n",
    "# df = pd.read_csv('../data/raw/tu_archivo.csv')\n",
    "# df.head()"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.8.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 4
}
EOF

# Script ejemplo para procesamiento de datos
cat > src/data/data_processing.py << 'EOF'
"""
Módulo para procesamiento de datos
"""

import pandas as pd
import numpy as np
from pathlib import Path

def load_raw_data(filename):
    """
    Carga datos desde la carpeta raw
    
    Args:
        filename (str): Nombre del archivo
        
    Returns:
        pandas.DataFrame: Datos cargados
    """
    filepath = Path("data/raw") / filename
    
    if filename.endswith('.csv'):
        return pd.read_csv(filepath)
    elif filename.endswith('.xlsx'):
        return pd.read_excel(filepath)
    else:
        raise ValueError("Formato de archivo no soportado")

def clean_data(df):
    """
    Función básica de limpieza de datos
    
    Args:
        df (pandas.DataFrame): DataFrame a limpiar
        
    Returns:
        pandas.DataFrame: DataFrame limpio
    """
    # Eliminar duplicados
    df_clean = df.drop_duplicates()
    
    # Aquí agregar más pasos de limpieza según necesidad
    
    return df_clean

def save_processed_data(df, filename):
    """
    Guarda datos procesados
    
    Args:
        df (pandas.DataFrame): DataFrame a guardar
        filename (str): Nombre del archivo
    """
    filepath = Path("data/processed") / filename
    df.to_csv(filepath, index=False)
    print(f"Datos guardados en: {filepath}")

if __name__ == "__main__":
    # Ejemplo de uso
    print("Módulo de procesamiento de datos listo para usar")
EOF

echo -e "${GREEN}✓${NC} Archivos ejemplo creados"

# Crear un archivo de log inicial
touch logs/project.log
echo "$(date): Proyecto '$PROJECT_NAME' creado exitosamente" > logs/project.log

# Mostrar resumen
echo -e "\n${GREEN}🎉 ¡Estructura del proyecto creada exitosamente! 🎉${NC}"
echo -e "\n${BLUE}📁 Estructura creada:${NC}"
tree -L 3 2>/dev/null || find . -type d | sort

echo -e "\n${YELLOW}📋 Próximos pasos recomendados:${NC}"
echo "1. cd $PROJECT_NAME"
echo "2. python scripts/setup.py"
echo "3. pip install -r requirements.txt"
echo "4. Agrega tus datos en data/raw/"
echo "5. Comienza tu análisis en notebooks/exploratory/"

echo -e "\n${GREEN}✨ ¡Listo para comenzar tu proyecto de análisis de datos! ✨${NC}"