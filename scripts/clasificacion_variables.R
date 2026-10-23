# clasificacion_variables.R — Parte A: clasificación de las variables de clientes.csv.
#
# El archivo data/clientes.csv tiene 12 clientes y 7 variables (más el id).
# El objetivo: clasificar cada variable (numérica continua/discreta, categórica
# binaria/ordinal/nominal) y verificar la clasificación en código.
#
# Regla del capítulo 3: el tipo que infiere el lenguaje es una pista, no la
# clasificación — el criterio (¿tiene sentido la mitad del valor? ¿hay orden
# entre las categorías?) decide.
#
# Uso (desde la raíz del repositorio):  Rscript scripts/clasificacion_variables.R


clientes <- read.csv("data/clientes.csv", stringsAsFactors = FALSE)

# ---------------------------------------------------------------------------
# 1. Estructura del archivo
# ---------------------------------------------------------------------------
cat(sprintf("Dimensiones: %d filas × %d columnas", nrow(clientes), ncol(clientes)))
cat("\n")
print(clientes)

# ---------------------------------------------------------------------------
# 2. Tipos inferidos (str) — la pista que da el lenguaje
# ---------------------------------------------------------------------------
cat("Tipos inferidos en R:")
cat("\n")
str(clientes)

# TODO 1: ¿qué columnas llegan como número (int) y cuáles como texto
#         (character)? Anótalo para el informe. Ojo con satisfaccion: llega
#         como número y es ordinal ("4 no es el doble de 2") — la justificación
#         va en el informe.

# ---------------------------------------------------------------------------
# 3. Valores únicos — ¿cuántas categorías hay y cuáles son?
# ---------------------------------------------------------------------------
# TODO 2: completa el bucle para imprimir, por columna, cuántos valores únicos
#         hay y cuáles son. Pista: for (columna in names(clientes)) { ... } con
#         unique() y length(). ¿Cuántas categorías tiene genero?

cat("Valores únicos por columna:")
cat("\n")

for (columna in names(clientes)) {
  valores <- unique(clientes[[columna]])

  cat(columna, ": ", length(valores), " valores únicos", sep = "")
  cat("\n")

  cat("Valores: ")
  print(valores)
}

# ---------------------------------------------------------------------------
# 4. Declarar el orden de las variables ordinales
# ---------------------------------------------------------------------------
# Una ordinal se guarda como texto y su orden natural se pierde: alfabéticamente
# "Posgrado" iría antes que "Primaria", que no tiene sentido. En R, eso se
# declara con el factor ordenado.
#
# TODO 3: convierte nivel_educacion con factor(..., levels = c(...), ordered = TRUE).
#         Comprueba con min(): debe devolver "Primaria".
# TODO 4: haz lo mismo con satisfaccion (escala 1–5 como etiquetas ordenadas).
#         Prueba extra: ¿qué pasa si en levels escribes "Postgrado" (con t) para
#         nivel_educacion? Cuenta los faltantes con sum(is.na(...)) — la trampa
#         del typo es silenciosa.

# TODO 3

orden_educacion <- c(
  "Primaria",
  "Secundaria",
  "Universidad",
  "Posgrado"
)

clientes$nivel_educacion <- factor(
  clientes$nivel_educacion,
  levels = orden_educacion,
  ordered = TRUE
)

cat("Nivel mínimo de educación:")
cat("\n")
print(min(clientes$nivel_educacion))
cat("\n")

# TODO 4

clientes$satisfaccion <- factor(
  clientes$satisfaccion,
  levels = c(1, 2, 3, 4, 5),
  ordered = TRUE
)

cat("Satisfacción mínima:")
cat("\n")
print(min(clientes$satisfaccion))
cat("\n")

# Prueba extra

orden_incorrecto <- c(
  "Primaria",
  "Secundaria",
  "Universidad",
  "Postgrado"
)

educacion_error <- factor(
  as.character(clientes$nivel_educacion),
  levels = orden_incorrecto,
  ordered = TRUE
)

cat("Valores faltantes por error de escritura:")
cat("\n")
print(sum(is.na(educacion_error)))
cat("\n")

# ---------------------------------------------------------------------------
# 5. Resumen de la clasificación (para el informe)
# ---------------------------------------------------------------------------
# TODO 5: completa el resumen con el tipo de cada variable (el criterio que
#         justifica cada clasificación va en el informe).

clasificacion <- c(
  cliente_id         = "Categórica nominal (identificador)",
  edad               = "Numérica discreta",
  numero_hijos       = "Numérica discreta",
  genero             = "Categórica nominal",
  nivel_educacion    = "Categórica ordinal",
  ciudad             = "Categórica nominal",
  ingresos_mensuales = "Numérica continua",
  satisfaccion       = "Categórica ordinal"
)

cat("\nResumen de la clasificación (para el informe):")
cat("\n")

for (variable in names(clasificacion)) {
  cat(sprintf("  %-18s %s", variable, clasificacion[[variable]]))
  cat("\n")
}
