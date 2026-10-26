# Proyecto Capstone: Análisis Exploratorio de Datos (EDA) en PostgreSQL

Este proyecto consiste en el diseño, implementación y análisis exploratorio de datos de una base de datos relacional para un entorno transaccional (`clientes`, `productos` y `pedidos`), desarrollado como proyecto final utilizando **PostgreSQL** y **DBeaver**.

---

## 🛠️ Estructura del Proyecto

El repositorio contiene los siguientes archivos SQL:

1. **`estructura.sql`**:
   - Creación de las tablas principales (`clientes`, `productos` y `pedidos`).
   - Definición de claves primarias (`PRIMARY KEY`), claves foráneas (`FOREIGN KEY`) y restricciones (`NOT NULL`, `UNIQUE`).
   - Inserción de datos de prueba con valores nulos intencionales (`NULL`) para la validación y gestión de datos faltantes.

2. **`analisis.sql`**:
   - Auditoría de datos y detección de valores nulos.
   - Tratamiento y limpieza de datos mediante funciones condicionales (`COALESCE`).
   - Consultas con cruce de tablas (`JOIN` / `LEFT JOIN`).
   - Agregaciones y métricas de negocio (`SUM`, `COUNT`, `GROUP BY`, `ORDER BY`, `DATE_TRUNC`).
   - Análisis avanzado con Window Functions (`RANK() OVER (...)`).

3. **`README.md`**:
   - Documentación ejecutiva del problema de negocio, guía de ejecución y conclusiones interpretadas para la toma de decisiones.

---

## ⚙️ Instrucciones de Ejecución

Para replicar el entorno de base de datos de manera local, sigue los siguientes pasos:

1. Crear la base de datos en PostgreSQL:
   ```sql
   CREATE DATABASE capstone_project;
