# Proyecto 3 – Herramienta de Mantenimiento FIFA

## Resumen 

El proyecto “Herramienta de Mantenimiento FIFA” es una solución relacional desarrollada en SQL Server que permite gestionar datos deportivos de jugadores de fútbol profesional de manera estructurada, escalable y consultable. Su diseño responde a la necesidad de actualizar, analizar y visualizar el rendimiento y trayectoria de jugadores como parte del ecosistema del videojuego EA Sports FC. El sistema simula un entorno de soporte técnico para decisiones dinámicas, facilitando el equilibrio del juego y permitiendo el análisis por atributos como posición, habilidad, historial o nacionalidad.

---

## Objetivos del Proyecto

- Modelar un sistema relacional normalizado para representar con precisión los datos deportivos de jugadores.
- Construir un entorno de consultas avanzadas, automatización parcial y soporte para decisiones.
- Implementar procedimientos, vistas y triggers que permitan mantener integridad, trazabilidad y eficiencia.
- Simular un sistema de actualización de ratings dinámico en función de rendimiento real y calificaciones de equilibrio.
- Sentar las bases para una futura integración con herramientas visuales o aplicaciones front-end.

---

## Requisitos Técnicos

- **Motor de base de datos**: Microsoft SQL Server 2019
- **Entorno de ejecución**: Consola T-SQL (modo script)
- **Lenguaje**: T-SQL (Transact-SQL)
- **Codificación de archivos**: UTF-8 sin BOM
- **Estructura modular**: scripts secuenciales divididos por función (tablas, vistas, triggers, SPs, datos)

---

## Metodología Aplicada

- Análisis de requerimientos funcionales y no funcionales a partir del caso de estudio.
- Diseño de modelo entidad-relación (MER) y derivación a modelo relacional en 3FN.
- Implementación de scripts secuenciales para objetos, inserciones y lógica de negocio.
- Validación funcional mediante casos de prueba y consultas estructuradas.
- Redacción técnica documentada en estilo profesional y reproducible.

---

## Modelo de Datos

### Tablas Principales

| Tabla               | Descripción                                                                 |
|---------------------|-----------------------------------------------------------------------------|
| **Jugador**         | Datos personales, atributos físicos, URL de imagen, nacionalidad y club.    |
| **Nacionalidad**    | Catálogo de países.                                                         |
| **Club**            | Nombre del club, país asociado y liga de competencia.                       |
| **Posicion**        | Posiciones estándar del fútbol (ST, CB, CM, GK, etc.).                      |
| **Habilidad**       | Atributos técnicos (PAC, SHO, PAS, DRI, DEF, PHY).                          |

### Tablas Relacionales y Transaccionales

| Tabla                  | Propósito                                                                |
|------------------------|--------------------------------------------------------------------------|
| **Jugador_Posicion**   | Relación N:M entre jugadores y sus posiciones.                           |
| **Jugador_Habilidad**  | Relación N:M entre jugadores y habilidades, con valor entre 0 y 100.     |
| **Evaluacion**         | Registra puntuaciones semanales (SofaScore, equilibrador, rating).       |
| **Historial_Clubes**   | Historial cronológico de traspasos de club por jugador.                  |

---

## Scripts y Componentes

### 1. Estructura de Tablas (`/src/tables/`)

- Scripts para creación de todas las entidades del modelo.
- Declaración de claves primarias y foráneas.
- Integridad garantizada mediante restricciones `NOT NULL`, `CHECK` y dominios de tipo.

### 2. Inserción de Datos (`/src/scripts/Inserts/`)

- Datos de más de 65 jugadores, 70 clubes y 70 nacionalidades.
- Atributos extraídos desde fuentes públicas confiables como:
  - [Kaggle – FIFA 22 Complete Player Dataset](https://www.kaggle.com/datasets/stefanoleone992/fifa-22-complete-player-dataset)
  - [Kaggle – EA Sports FC 25 Ratings & Stats](https://www.kaggle.com/datasets/nyagami/ea-sports-fc-25-database-ratings-and-stats)
  - [SofaScore](https://www.sofascore.com/)
  - [Transfermarkt](https://www.transfermarkt.com/)

---

## Vistas Definidas (`/src/views/views.sql`)

| Vista                          | Descripción                                                                              |
|--------------------------------|------------------------------------------------------------------------------------------|
| `Vista_Jugadores_Club`         | Muestra información del jugador, su club y datos relacionados.                           |
| `Vista_Jugadores_Nacionalidad` | Agrupa jugadores por país de origen.                                                     |
| `Vista_Evaluaciones`           | Evalúa desempeño, fecha, posición y puntaje compuesto.                                   |
| `Vista_Habilidades_Jugador`    | Detalla cada habilidad con su valor por jugador.                                         |
| `Vista_Historial_Clubes`       | Muestra el trayecto cronológico de clubes por jugador.                                   |

---

## Procedimientos Almacenados (`/src/sps/sps.sql`)

| Procedimiento                      | Funcionalidad                                                                   |
|------------------------------------|---------------------------------------------------------------------------------|
| `sp_top_n_por_posicion`            | Ranking por posición, con parámetro de cantidad.                                |
| `sp_top_n_por_habilidad`           | Ranking por habilidad técnica.                                                  |
| `sp_top_n_por_pierna`              | Filtrado de jugadores por pierna dominante.                                     |
| `sp_jugadores_sin_equipo`          | Consulta de jugadores libres (sin club asignado).                               |
| `sp_detalle_jugador`               | Consolidado completo del jugador (datos, habilidades, evaluaciones, historial). |
| `sp_actualizar_rating`             | Cálculo automático del nuevo rating en base a rendimiento.                      |
| `sp_actualizar_club`               | Actualiza club y registra automáticamente en historial.                         |

---

## Triggers Definidos (`/src/triggers/triggers.sql`)

| Trigger                           | Función                                                                           |
|-----------------------------------|-----------------------------------------------------------------------------------|
| `tr_insertar_historial_club`      | Inserta automáticamente una fila en `Historial_Clubes` al cambiar el club actual. |
| `tr_validar_puntaje_equilibrador` | Valida consistencia de la nota equilibradora al evaluar.                          |

---

## Consultas Clave (`/src/scripts/Requisitos_Solicitados.sql`)

- Top N jugadores por posición.
- Top N jugadores por habilidad técnica.
- Filtro por pierna dominante.
- Consulta de agentes libres.
- Listado de jugadores retirados (`retirado = 1`).
- Identificación de jugadores con múltiples posiciones.
- Historial completo de traspasos por jugador.
- Evaluaciones individuales o masivas según parámetros.

---

## Extras y Scripts Complementarios

- **`estructura.sql`**: Script unificado para crear toda la base de datos desde cero.
- **`FIFA_DB.sql`**: Carga completa y ordenada del sistema.
- **`backup.sql`**: Script de respaldo.
- **`extra/`**: Scripts con pruebas, ajustes o consultas adicionales no solicitadas pero útiles para la expansión.

---

## Casos de Uso

- Soporte interno a desarrolladores de videojuegos para ajustar balance del gameplay.
- Herramienta de consulta estadística para armar equipos por rendimiento real.
- Soporte para análisis táctico por clubes, nacionalidades, o progresión de atributos.
- Escenario base para integración con sistemas front-end, APIs deportivas o plataformas de análisis predictivo.


---

## Créditos

Este proyecto fue desarrollado por:

- Ariana Hernández Peña  
- Cristhian Altamirano Montes  
- Danny Orlando Abarca Alvarado  

**Carrera:** Ingeniería en Sistemas  
**Universidad Nacional de Costa Rica – Campus Nicoya**  
**Curso:** Diseño e Implementación de Bases de Datos  
**Período:** I Ciclo 2025

---
