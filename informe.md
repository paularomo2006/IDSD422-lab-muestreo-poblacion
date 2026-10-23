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

El tipo de dato indicó que la variable satisfaccion era numérica (int64/int), pero esto no significa que sea una variable cuantitativa. En realidad, es ordinal porque sus valores representan niveles de satisfacción o una escala, donde 4 no necesariamente significa el doble de satisfacción que 2, eso depende de cómo se definido cada nivel. Si una variable ordinal queda almacenada como texto sin declarar su orden, el programa puede organizar sus categorías alfabéticamente en lugar de seguir su jerarquía real. Por eso declaré el orden de sus categorías en Python y R.

## Parte B — Población vs. muestra

### La población y su parámetro

| Concepto | Valor |
|---|---|
| Población (N) |400 clientes |
| Variable de interés |ingresos_mensuales |
| Parámetro poblacional (media) |1330.72 USD |

*¿Por qué se muestrea si aquí el parámetro existe y se calculó?*

Porque no siempre se podrá calcular el parámetro de toda la población, entonces en la mayoría de los casos es necesario tomar una muestra para poder calcularlo. Para lo que se debe aplicar el método de muestreo que más se adecúe a la situación. En este caso se conoce toda la población y se puede obtener la media, que sirve como un valor de referencia.

### Los tres diseños

*Corre tu script y registra las salidas. La composición por ciudad es la que delata el sesgo: anótala tal como salió.*

*Python*

| Diseño | n | Media estimada | Composición por ciudad | Diferencia vs. parámetro |
|---|---|---|---|---|
| Conveniencia (`head`) |20 |1348.50 |UIO=20 |+17.78 |
| Aleatorio simple (`sample`) |20 |1336.00 |Cuenca = 8, UIO = 8, GYQ = 4 |+5.28 |
| Estratificado (`groupby` + 5 %) |20 |1287.50 |Cuenca = 4, UIO = 10, GYQ = 6 |-43.22 |

*R*
| Diseño | n | Media estimada | Composición por ciudad | Diferencia vs. parámetro |
|---|---|---|---|---|
| Conveniencia (`head`) |20 |1348.50 |UIO=20 |+17.78 |
| Aleatorio simple (`sample`) |20 |1318.00 |Cuenca = 5, UIO = 8, GYQ = 7 |-12.72 |
| Estratificado (`groupby` + 5 %) |20 |1226.00 |Cuenca = 4, UIO = 10, GYQ = 6 |-104.72 |



*Anota también las medias de 5 sorteos distintos del aleatorio simple (semillas 1 a 5):*

*Python*

| Semilla | 1 | 2 | 3 | 4 | 5 |
|---|---|---|---|---|---|
| Media |1336.00 |1405.00 |1235.00 |1491.50 |1288.00 |

*R*
| Semilla | 1 | 2 | 3 | 4 | 5 |
|---|---|---|---|---|---|
| Media |1318.00 |1287.00 |1233.00 |1385.50 |1283.00 |

**P2.** ¿Cuánto vale el parámetro poblacional y cuánto estimó cada diseño? ¿Cuál quedó más cerca y por qué eso **no** alcanza para declarar un ganador?

**P3.** La muestra por conveniencia también tiene 20 filas. ¿Qué defecto tiene y cómo lo delatas en la composición por ciudad? ¿Se corrige tomando más filas?

**P4.** El sorteo aleatorio dio un número distinto en cada semilla. ¿Qué implica esa variabilidad para una empresa que va a decidir con un solo estudio?

**P5.** ¿Cuándo usarías cada diseño en la práctica? Relaciona cada uno con un uso real (piloto, subgrupos que deben aparecer, conclusión sobre toda la población).

## Conclusiones

*Escribe 2–3 conclusiones con tus palabras: qué aprendiste sobre el diseño del muestreo y qué le recomendarías a la gerencia antes de aceptar (o pedir) un análisis basado en muestras.*
