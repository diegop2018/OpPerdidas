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
