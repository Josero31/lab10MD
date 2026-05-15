# =============================================================
# Lab 10 – Aprendizaje Semi-Supervisado
# Dataset: Adult Income (Census UCI)
# =============================================================

# --- 1. Cargar librerías necesarias --------------------------
# install.packages(c("tidyverse", "caret", "MASS"))
library(tidyverse)

# --- 2. Cargar el dataset ------------------------------------
df <- read.csv("adult_incomeDATA.csv", stringsAsFactors = TRUE, na.strings = c("NA", ""))

cat("Dimensiones:", nrow(df), "x", ncol(df), "\n")
cat("Columnas:", paste(names(df), collapse = ", "), "\n\n")

# --- 3. Vista general ----------------------------------------
str(df)
summary(df)

# --- 4. Verificar NAs ----------------------------------------
cat("\nValores faltantes por columna:\n")
print(colSums(is.na(df)))

# --- 5. Limpieza básica --------------------------------------
# Eliminar filas con NA (opcional: también se puede imputar)
df_clean <- na.omit(df)
cat("\nFilas tras eliminar NAs:", nrow(df_clean), "\n")

# Convertir target a factor binario 0/1
df_clean$income <- ifelse(df_clean$income == ">50K", 1L, 0L)
df_clean$income <- as.factor(df_clean$income)

# Eliminar fnlwgt (peso censal, no relevante para predicción)
df_clean$fnlwgt <- NULL

cat("\nDistribución del target:\n")
print(table(df_clean$income))
cat("Proporción:\n")
print(prop.table(table(df_clean$income)))

# --- 6. Preparar escenario semi-supervisado ------------------
set.seed(42)

# Separar test (20% del total, siempre etiquetado)
test_idx  <- sample(seq_len(nrow(df_clean)), size = 0.2 * nrow(df_clean))
test_set  <- df_clean[test_idx, ]
train_all <- df_clean[-test_idx, ]

# De los datos de entrenamiento, etiquetar solo un 10%
label_frac  <- 0.10
labeled_idx <- sample(seq_len(nrow(train_all)), size = label_frac * nrow(train_all))

labeled_set   <- train_all[labeled_idx, ]          # Con etiqueta
unlabeled_set <- train_all[-labeled_idx, ]          # Sin etiqueta (NA en income)
unlabeled_set$income <- NA

cat("\nTamaño del conjunto etiquetado  :", nrow(labeled_set))
cat("\nTamaño del conjunto no etiquetado:", nrow(unlabeled_set))
cat("\nTamaño del conjunto de prueba    :", nrow(test_set), "\n")

# --- 7. Guardar subconjuntos (opcional) ----------------------
# write.csv(labeled_set,   "labeled_set.csv",   row.names = FALSE)
# write.csv(unlabeled_set, "unlabeled_set.csv", row.names = FALSE)
# write.csv(test_set,      "test_set.csv",      row.names = FALSE)

cat("\n¡Dataset listo para el Lab 10!\n")
