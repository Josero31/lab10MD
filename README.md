# Laboratorio 10 — Aprendizaje Semi-Supervisado

**Curso:** Minería de Datos — Primer Semestre 2026
**Autores:** Jose Sanchez, Roberto Najera
**Fecha:** 2026-05-15

---

## Descripción

Este laboratorio aplica técnicas de **aprendizaje semi-supervisado** sobre el dataset *Adult Income* (UCI Machine Learning Repository). Se comparan modelos supervisados puros contra algoritmos semi-supervisados en un escenario donde solo una fracción pequeña de los datos de entrenamiento posee etiqueta, simulando un caso realista en el que etiquetar manualmente es costoso.

La variable objetivo es binaria: indica si el ingreso anual de una persona supera o no los USD 50,000.

---

## Dataset

- **Fuente:** UCI Machine Learning Repository — *Adult Income Dataset*
- **URL:** https://archive.ics.uci.edu/dataset/2/adult
- **Dimensiones:** 48,842 filas × 15 columnas
- **Variable objetivo:** `income` (`<=50K` / `>50K`)
- **Archivo local:** [adult_incomeDATA.csv](adult_incomeDATA.csv)

---

## Estructura del laboratorio

El informe se desarrolla en [markdown-lab10.Rmd](markdown-lab10.Rmd) y se organiza en cuatro actividades:

### Actividad 1 — Selección y Análisis del Dataset
- 1.1 Selección y descripción del dataset
- 1.2 Análisis exploratorio (tipos de variables, resumen, valores faltantes, distribuciones, correlaciones, balance de clases)
- 1.3 Preprocesamiento (limpieza, codificación, escalado, partición)

### Actividad 2 — Diseño Experimental Semi-Supervisado
- 2.1 Diseño del escenario semi-supervisado (20% test, 10% etiquetado de entrenamiento)
- 2.2 Función auxiliar de evaluación
- 2.3 Baseline supervisado: **Random Forest**
- 2.4 Algoritmo semi-supervisado 1: **Self-Training**
- 2.5 Algoritmo semi-supervisado 2: **Co-Training**
- 2.6–2.8 Comparación global, análisis de sensibilidad al % de etiquetas, real vs. predicción
- 2.9–2.10 Discusión y conclusiones

### Actividad 3 — Experimentación e Hiperparámetros
- 3.1 Curvas de aprendizaje (sobreajuste vs. subajuste)
- 3.2 Estabilidad estocástica con múltiples seeds
- 3.3–3.4 Grid search exhaustivo para Self-Training y Co-Training
- 3.5 Análisis granular de sensibilidad al % de etiquetas
- 3.6 Significancia estadística (prueba de Wilcoxon)
- 3.7 Resumen experimental

### Actividad 4 — Visualización y Análisis Gráfico
- 4.1 Matrices de confusión comparativas
- 4.2 Curvas ROC y AUC
- 4.3 Curvas Precisión–Recall
- 4.4 Distribución de probabilidades predichas
- 4.5 Evolución del error de Self-Training por iteración
- 4.6 Desempeño vs. % de etiquetas (cuatro métricas)
- 4.7 Heatmap comparativo de métricas × modelos
- 4.8 Comparación real vs. predicción a nivel de muestra
- 4.9 Resumen visual

---

## Archivos del proyecto

| Archivo | Descripción |
|---------|-------------|
| [markdown-lab10.Rmd](markdown-lab10.Rmd) | Informe principal en R Markdown con todo el análisis |
| [markdown-lab10.pdf](markdown-lab10.pdf) | Versión renderizada en PDF |
| [adult_incomeDATA.csv](adult_incomeDATA.csv) | Dataset Adult Income |
| [adult_income_confi.R](adult_income_confi.R) | Script auxiliar de configuración |
| [Laboratorio 10 - Semisupervisado.docx](Laboratorio%2010%20-%20Semisupervisado.docx) | Enunciado del laboratorio |

---

## Requisitos

- **R** ≥ 4.0
- **RStudio** (recomendado para renderizar el `.Rmd`)
- Paquetes:
  - `tidyverse`, `scales`
  - `randomForest`, `e1071`, `caret`
  - `pROC`, `ggplot2`, `reshape2` (para visualizaciones de la Actividad 4)

Instalación rápida:

```r
install.packages(c("tidyverse", "scales", "randomForest", "e1071",
                   "caret", "pROC", "reshape2"))
```

---

## Cómo reproducir

1. Clonar el repositorio y abrir el proyecto en RStudio.
2. Verificar que `adult_incomeDATA.csv` esté en el directorio raíz.
3. Abrir `markdown-lab10.Rmd` y ejecutar **Knit** (HTML o PDF).
   - Para PDF se requiere una distribución LaTeX (ej. TinyTeX) con `xelatex`.

---

## Resultados esperados

El informe compara tres modelos —Random Forest supervisado, Self-Training y Co-Training— bajo distintos porcentajes de datos etiquetados, evaluando Accuracy, Precision, Recall, F1 y AUC. Las conclusiones discuten cuándo los métodos semi-supervisados aportan valor sobre el baseline supervisado y bajo qué condiciones tienden a degradarse.
