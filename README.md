# Proyecto Capstone: Análisis Exploratorio de Datos (EDA) en PostgreSQL

Este proyecto consiste en el diseño, implementación y análisis exploratorio de datos de una base de datos relacional para un entorno transaccional (clientes, productos y pedidos), desarrollado como proyecto final utilizando **PostgreSQL** y **DBeaver**.

---

## 🛠️ Estructura del Proyecto

El repositorio contiene los siguientes archivos SQL:

1. **`estructura.sql`**: 
   - Creación de las tablas principales (`clientes`, `productos` y `pedidos`).
   - Definición de claves primarias (`PRIMARY KEY`), claves foráneas (`FOREIGN KEY`) y restricciones (`NOT NULL`, `UNIQUE`).
   - Inserción de datos de prueba para simulación transaccional.

2. **`analisis.sql`**: 
   - Inspección general de tablas.
   - Auditoría de datos y detección de valores nulos (`IS NULL`).
   - Consultas con cruce de tablas (`JOIN` / `LEFT JOIN`).
   - Agregaciones y métricas de negocio (`SUM`, `COUNT`, `GROUP BY`, `ORDER BY`).

---

## 📊 Principales Hallazgos del Análisis (EDA)

- **Auditoría de Datos:** Se identificaron registros con datos incompletos en productos y pedidos (precios y montos nulos), permitiendo evaluar la integridad de la base de datos.
- **Rendimiento por Categoría:** La categoría **Tecnología** representa el mayor volumen de ventas totales dentro del sistema.
- **Comportamiento de Clientes:** Se generó un ranking de clientes por volumen de gasto acumulado, destacando a los clientes con mayor frecuencia de compra y mayor ticket promedio.

---

## 🚀 Tecnologías Utilizadas

- **Motor de Base de Datos:** PostgreSQL
- **Cliente / IDE:** DBeaver
- **Lenguaje:** SQL (DDL y DML)
