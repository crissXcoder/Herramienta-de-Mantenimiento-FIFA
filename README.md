# ⚽ Proyecto 3 - Herramienta de Mantenimiento FIFA

Este proyecto consiste en el diseño, implementación y explotación de una **base de datos relacional** orientada al mantenimiento de jugadores de fútbol profesional, con enfoque en rendimiento, historial, habilidades y evaluaciones. Forma parte de una herramienta de análisis y soporte para decisiones deportivas semiautomáticas.

## 📐 Estructura General

La base de datos está compuesta por las siguientes **tablas**:

- `Jugador`: Información personal, club actual, nacionalidad, pierna dominante y si está retirado.
- `Nacionalidad`: Catálogo de países.
- `Club`: Información del club, país y liga.
- `Posicion`: Lista de posiciones como Portero, Defensa, Mediocampista, Delantero.
- `Jugador_Posicion`: Relación muchos a muchos entre jugadores y posiciones.
- `Habilidad`: Catálogo de habilidades (velocidad, fuerza, regate, etc).
- `Jugador_Habilidad`: Relación entre jugadores y habilidades con un valor de 0 a 100.
- `Evaluacion`: Registro de evaluaciones semanales con puntaje de SofaScore, nivel equilibrador y rating.
- `Historial_Clubes`: Historial de clubes por los que ha pasado un jugador.

## 🧾 Scripts Generados

### 1. 🏗️ Estructura de Tablas
- Scripts para crear todas las tablas con claves primarias y foráneas.
- Validaciones con `CHECK`, `NOT NULL`, e integridad referencial.

### 2. 📝 Inserción de Datos
- Datos insertados para más de 65 jugadores, 70 países, 70 clubes, y relaciones asociadas.
- Datos provenientes de Transfermarkt, EA Sports FC y catálogos personalizados.

### 3. 📊 Vistas (Views)
- `vw_info_completa_jugador`: Muestra información del jugador, club y nacionalidad.
- `vw_habilidades_jugador`: Muestra todas las habilidades de un jugador.
- `vw_evaluaciones_jugador`: Incluye evaluación, posición y fecha.
- `vw_historial_clubes_jugador`: Historial detallado de cada jugador con fechas.
- Otras vistas simples y complejas para búsquedas y top rankings.

### 4. ⚙️ Procedimientos Almacenados (Stored Procedures)
- `sp_top_n_por_posicion`
- `sp_top_n_por_habilidad`
- `sp_actualizar_rating`
- `sp_actualizar_club`
- `sp_detalle_jugador`

Permiten generar reportes, actualizar el club, buscar jugadores favoritos y calcular rating automáticamente.

### 5. 🧩 Triggers
- Trigger para registrar en historial cuando un jugador cambia de club (`tr_insertar_historial_club`).
- Trigger para validar que el puntaje equilibrador no sea nulo (`tr_validar_puntaje_equilibrador`).

## 🔍 Consultas de Prueba de Concepto

- Top N por posición, pierna dominante, sin club.
- Jugadores retirados.
- Jugadores con múltiples posiciones.
- Detalle individual.
- Actualización de rating dinámico.

## 🔮 Objetivo y Aplicación

Este proyecto busca representar un **MVP** (Producto Mínimo Viable) funcional para:

- Equipos técnicos que deseen armar equipos según rendimiento.
- Seguimiento semanal de desempeño en ligas profesionales.
- Análisis de datos por ligas, nacionalidades, historial y evaluaciones.
- Escalabilidad futura para integrar frontend y analítica predictiva.

## 📁 Organización del Proyecto

## 💡 Autor

Desarrollado por estudiante de Ingeniería en Sistemas, Universidad Nacional de Costa Rica – 2025.

¡Gracias por revisar este proyecto! Cualquier sugerencia o mejora será bienvenida 💬