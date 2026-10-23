# Informe — Clasificación de variables y población vs. muestra

**Para:** Gerencia de RetailAndina S.A. · **De:** Equipo de Business Intelligence
**Fecha:** ___/___/2026 · **Asunto:** Base de fidelización: tipos de variables y estimación por muestreo

---

## Resumen ejecutivo

En esta práctica analicé la base de fidelización de RetailAndina S.A. para identificar y clasificar correctamente las variables de sus clientes. Utilicé Python y R para verificar los tipos de datos, reconocer las variables ordinales y comprobar su orden. Además, el laboratorio permitió estudiar la estimación del ingreso mensual promedio mediante tres métodos de muestreo: por conveniencia, aleatorio simple y estratificado. El objetivo fue comprender cómo la selección de una muestra puede afectar la confiabilidad de los resultados y las decisiones de la empresa.

## Parte A — Clasificación de las variables

*Completa la tabla usando el **criterio** (¿tiene sentido la mitad del valor? ¿hay orden entre las categorías?), no el ejemplo. En «verificación» anota qué mostró el código: dtype, número de valores únicos y, si declaraste el orden, cómo lo comprobaste.*

| Variable | Tipo | Justificación (criterio) | Verificación en código |
|---|---|---|---|
| `cliente_id` |Categórica nominal |Identifica al cliente, contiene números y letras. |str/chr |
| `edad` |Numérica discreta |Se registró como años enteros, no con meses ni días. |int64/int |
| `numero_hijos` |Numérica discreta |Se registró como años enteros, no con meses ni días. |int64/int |
| `genero` |Categórica nominal |Las categorías no tienen orden que sea indispensable. No es binomial porque existe la opción Otro. |str/chr |
| `nivel_educacion` |Categórica ordinal |Los niveles de educación tienen un orden. |str/chr |
| `ciudad` |Categórica ordinal |Puede haber varios registros de distintas ciudades. |str/chr |
| `ingresos_mensuales` |Numérica continua |Una cantidad de dinero puede tener valores decimales y/o enteros. |int64/int |
| `satisfaccion` |Categórica ordinal |Es una escala de 1-5, tiene un orden específico. |int64/int |

**P1.** ¿Qué te dijo el dtype de `satisfaccion` y por qué no basta para clasificarla? ¿Qué pasa si una ordinal queda como texto sin declarar el orden?

## Parte B — Población vs. muestra

### La población y su parámetro

| Concepto | Valor |
|---|---|
| Población (N) | |
| Variable de interés | |
| Parámetro poblacional (media) | |

*¿Por qué se muestrea si aquí el parámetro existe y se calculó?*

### Los tres diseños

*Corre tu script y registra las salidas. La composición por ciudad es la que delata el sesgo: anótala tal como salió.*

| Diseño | n | Media estimada | Composición por ciudad | Diferencia vs. parámetro |
|---|---|---|---|---|
| Conveniencia (`head`) | | | | |
| Aleatorio simple (`sample`) | | | | |
| Estratificado (`groupby` + 5 %) | | | | |

*Anota también las medias de 5 sorteos distintos del aleatorio simple (semillas 1 a 5):*

| Semilla | 1 | 2 | 3 | 4 | 5 |
|---|---|---|---|---|---|
| Media | | | | | |

**P2.** ¿Cuánto vale el parámetro poblacional y cuánto estimó cada diseño? ¿Cuál quedó más cerca y por qué eso **no** alcanza para declarar un ganador?

**P3.** La muestra por conveniencia también tiene 20 filas. ¿Qué defecto tiene y cómo lo delatas en la composición por ciudad? ¿Se corrige tomando más filas?

**P4.** El sorteo aleatorio dio un número distinto en cada semilla. ¿Qué implica esa variabilidad para una empresa que va a decidir con un solo estudio?

**P5.** ¿Cuándo usarías cada diseño en la práctica? Relaciona cada uno con un uso real (piloto, subgrupos que deben aparecer, conclusión sobre toda la población).

## Conclusiones

*Escribe 2–3 conclusiones con tus palabras: qué aprendiste sobre el diseño del muestreo y qué le recomendarías a la gerencia antes de aceptar (o pedir) un análisis basado en muestras.*
