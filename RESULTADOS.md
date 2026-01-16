# 📊 Análisis de Consultas SQL


## 📈 Resumen
✅ 17 correctas de 26 queries

## ✅ Query 1: Correcto

⏱ Tiempo: 0.47 ms
🔍 No se usó ningún índice en esta consulta.

---

## ✅ Query 2: Correcto

⏱ Tiempo: 0.32 ms
🔍 No se usó ningún índice en esta consulta.

---

## ✅ Query 3: Correcto

⏱ Tiempo: 0.31 ms
🔍 No se usó ningún índice en esta consulta.

---

## ✅ Query 4: Correcto

⏱ Tiempo: 0.30 ms
🔍 No se usó ningún índice en esta consulta.

---

## ✅ Query 5: Correcto

⏱ Tiempo: 0.37 ms
✅ Se usó índice(s) en la consulta: id_grado

---

## ✅ Query 6: Correcto

⏱ Tiempo: 0.40 ms
✅ Se usó índice(s) en la consulta: PRIMARY,id_departamento, PRIMARY

---

## ✅ Query 7: Correcto

⏱ Tiempo: 0.61 ms
✅ Se usó índice(s) en la consulta: PRIMARY,id_asignatura,id_curso_escolar, PRIMARY,nif, PRIMARY

---

## ✅ Query 8: Correcto

⏱ Tiempo: 0.48 ms
✅ Se usó índice(s) en la consulta: PRIMARY,id_departamento, id_profesor,id_grado, PRIMARY

---

## ✅ Query 9: Correcto

⏱ Tiempo: 0.38 ms
✅ Se usó índice(s) en la consulta: PRIMARY,id_curso_escolar, PRIMARY

---

## ❌ Query 10: Incorrecto
```diff
--- 
+++ 
@@ -1,13 +1,13 @@
 departamento | apellido1 | apellido2 | nombre
-Agronomía | Monahan | Murray | Micaela
-Economía y Empresa | Fahey | Considine | Antonio
+Informática | Ramirez | Gea | Zoe
+Matemáticas | Schmidt | Fisher | David
 Economía y Empresa | Lemke | Rutherford | Cristina
-Educación | Ruecker | Upton | Guillermo
 Educación | Spencer | Lakin | Esther
 Educación | Streich | Hirthe | Carmen
+Química y Física | Stiedemann | Morissette | Alfredo
 Informática | Hamill | Kozey | Manolo
-Informática | Ramirez | Gea | Zoe
 Matemáticas | Kohler | Schoen | Alejandro
-Matemáticas | Schmidt | Fisher | David
+Economía y Empresa | Fahey | Considine | Antonio
+Educación | Ruecker | Upton | Guillermo
+Agronomía | Monahan | Murray | Micaela
 Química y Física | Schowalter | Muller | Francesca
-Química y Física | Stiedemann | Morissette | Alfredo
```

⏱ Tiempo: 0.41 ms
✅ Se usó índice(s) en la consulta: PRIMARY

---

## ✅ Query 11: Correcto

⏱ Tiempo: 0.32 ms
✅ Se usó índice(s) en la consulta: PRIMARY

---

## ✅ Query 12: Correcto

⏱ Tiempo: 0.31 ms
✅ Se usó índice(s) en la consulta: id_departamento

---

## ❌ Query 13: Incorrecto
```diff
--- 
+++ 
@@ -1,11 +1,11 @@
 apellido1 | apellido2 | nombre
 Schmidt | Fisher | David
-Kohler | Schoen | Alejandro
 Lemke | Rutherford | Cristina
-Fahey | Considine | Antonio
 Spencer | Lakin | Esther
 Streich | Hirthe | Carmen
+Stiedemann | Morissette | Alfredo
+Kohler | Schoen | Alejandro
+Fahey | Considine | Antonio
 Ruecker | Upton | Guillermo
 Monahan | Murray | Micaela
-Stiedemann | Morissette | Alfredo
 Schowalter | Muller | Francesca
```

⏱ Tiempo: 0.35 ms
✅ Se usó índice(s) en la consulta: id_profesor

---

## ✅ Query 14: Correcto

⏱ Tiempo: 0.33 ms
✅ Se usó índice(s) en la consulta: PRIMARY

---

## ❌ Query 15: Incorrecto
```diff
--- 
+++ 
@@ -1,5 +1,4 @@
 nombre
-Informática
 Matemáticas
 Economía y Empresa
 Educación
```

⏱ Tiempo: 0.34 ms
✅ Se usó índice(s) en la consulta: id_departamento, id_profesor

---

## ✅ Query 16: Correcto

⏱ Tiempo: 0.30 ms
🔍 No se usó ningún índice en esta consulta.

---

## ✅ Query 17: Correcto

⏱ Tiempo: 0.33 ms
🔍 No se usó ningún índice en esta consulta.

---

## ❌ Query 18: Error
- **Descripción**: 1054 (42S22): Unknown column 'professors_count' in 'order clause'


## ❌ Query 19: Error
- **Descripción**: 1054 (42S22): Unknown column 'professors_count' in 'order clause'


## ❌ Query 20: Error
- **Descripción**: 1054 (42S22): Unknown column 'degree_name' in 'group statement'


## ❌ Query 21: Error
- **Descripción**: 1054 (42S22): Unknown column 'degree_name' in 'group statement'


## ❌ Query 22: Error
- **Descripción**: 1054 (42S22): Unknown column 'degree' in 'group statement'


## ✅ Query 23: Correcto

⏱ Tiempo: 0.37 ms
✅ Se usó índice(s) en la consulta: PRIMARY, id_curso_escolar

---

## ❌ Query 24: Error
- **Descripción**: 1054 (42S22): Unknown column 'first_name' in 'group statement'


## ✅ Query 25: Correcto

⏱ Tiempo: 0.35 ms
🔍 No se usó ningún índice en esta consulta.

🚨 **Problemas detectados:**
⚠️ Evitar `SELECT *`. Usar solo las columnas necesarias.

---

## ✅ Query 26: Correcto

⏱ Tiempo: 0.35 ms
✅ Se usó índice(s) en la consulta: id_profesor, PRIMARY

---
