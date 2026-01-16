-- 1. Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
SELECT p.apellido1, p.apellido2, p.nombre
FROM persona p
WHERE p.tipo = 'alumno'
ORDER BY p.nombre, p.apellido1, p.apellido2 ASC;

-- 2. Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades. (nombre, apellido1, apellido2)
SELECT p.nombre, p.apellido1, p.apellido2
FROM persona p
WHERE p.tipo = 'alumno' AND p.telefono IS NULL
ORDER BY p.nombre, p.apellido1, p.apellido2 ASC;

-- 3. Retorna el llistat dels alumnes que van néixer en 1999. (id, nombre, apellido1, apellido2, fecha_nacimiento)
SELECT p.nif as id, p.nombre, p.apellido1, p.apellido2, p.fecha_nacimiento
FROM persona p
WHERE YEAR(p.fecha_nacimiento) = 1999 AND p.tipo = 'alumno';

-- 4. Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K. (nombre, apellido1, apellido2, nif)
SELECT p.nombre, p.apellido1, p.apellido2, p.nif
FROM persona p
WHERE p.telefono IS NULL
    AND p.nif LIKE '%K'
    AND p.tipo = 'profesor';

-- 5. Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7. (id, nombre, cuatrimestre, curso, id_grado)
SELECT a.id as id, a.nombre, a.cuatrimestre, a.curso, a.id_grado
FROM asignatura a
WHERE a.cuatrimestre = 1 AND a.curso = 3 AND a.id_grado = 7;

-- 6. Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom. (apellido1, apellido2, nombre, departamento)
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre as departmento
FROM persona p JOIN profesor pr ON p.id = pr.id_profesor JOIN departamento d ON pr.id_departamento = d.id
ORDER BY p.apellido1, p.apellido2, p.nombre ASC;

-- 7. Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M. (nombre, anyo_inicio, anyo_fin)
SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin
FROM persona p JOIN alumno_se_matricula_asignatura asma ON p.id = asma.id_alumno
        JOIN curso_escolar ce ON asma.id_curso_escolar = ce.id
        JOIN asignatura a ON asma.id_asignatura = a.id
WHERE p.nif LIKE '26902806M';

-- 8. Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015). (nombre)
SELECT d.nombre
FROM departamento d JOIN profesor p ON d.id = p.id_departamento
WHERE EXISTS(SELECT a.id_profesor
             FROM grado g JOIN asignatura a ON g.id = a.id_grado
             WHERE g.nombre LIKE '%Ingeniería Informática%'
                    AND p.id_profesor = a.id_profesor);

-- 9. Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019. (nombre, apellido1, apellido2)
SELECT DISTINCT p.nombre, p.apellido1, p.apellido2
FROM persona p JOIN alumno_se_matricula_asignatura asma ON p.id = asma.id_alumno
               JOIN curso_escolar ce ON asma.id_curso_escolar = ce.id
WHERE ce.anyo_inicio = 2018;

-- Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.
-- 10. Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom. (departamento, apellido1, apellido2, nombre)
SELECT d.nombre as departmento, p.apellido1, p.apellido2, p.nombre
FROM persona p LEFT JOIN profesor prof ON p.id = prof.id_profesor
               LEFT JOIN departamento d ON prof.id_departamento = d.id
WHERE p.tipo = 'profesor';

-- 11. Retorna un llistat amb els professors/es que no estan associats a un departament. (apellido1, apellido2, nombre)
SELECT p.apellido1, p.apellido2, p.nombre
FROM persona p LEFT JOIN profesor p1 ON p.id = p1.id_profesor
WHERE p1.id_departamento IS NULL AND p.tipo = 'profesor';

-- 12. Retorna un llistat amb els departaments que no tenen professors/es associats. (nombre)
SELECT d.nombre
FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento
WHERE p.id_profesor IS NULL;

-- 13. Retorna un llistat amb els professors/es que no imparteixen cap assignatura. (apellido1, apellido2, nombre)
SELECT p.apellido1, p.apellido2, p.nombre
FROM persona p LEFT JOIN asignatura a ON p.id = a.id_profesor
WHERE a.id IS NULL AND p.tipo = 'profesor';

-- 14. Retorna un llistat amb les assignatures que no tenen un professor/a assignat. (id, nombre)
SELECT a.id, a.nombre
FROM asignatura a LEFT JOIN profesor p ON a.id_profesor = p.id_profesor
WHERE p.id_profesor IS NULL;

-- 15. Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar. (nombre)
SELECT DISTINCT d.nombre
FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento
                    LEFT JOIN asignatura a ON p.id_profesor = a.id_profesor
WHERE a.id IS NULL;

-- 16. Retorna el nombre total d'alumnes que hi ha. (total)
SELECT count(*) as total
FROM persona p
WHERE p.tipo = 'alumno';

-- 17. Calcula quants alumnes van néixer en 1999. (total)
SELECT COUNT(*) as total
FROM persona p
WHERE p.tipo = 'alumno' AND YEAR(p.fecha_nacimiento) = 1999;

-- 18. Calcula quants professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es. (departamento, total)
SELECT d.nombre as departmento, COUNT(p.id_profesor) as total
FROM departamento d JOIN profesor p ON d.id = p.id_departamento
GROUP BY d.nombre
ORDER BY professors_count DESC;

-- 19. Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors/es associats. Aquests departaments també han d'aparèixer en el llistat. (departamento, total)
SELECT d.nombre as departmento, COUNT(p.id_profesor) as total
FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento
GROUP BY d.nombre
ORDER BY professors_count DESC;

-- 20. Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingues en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures. (grau, total)
SELECT g.nombre as grau, count(a.id) as total
FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado
GROUP BY degree_name
ORDER BY subject_count DESC;

-- 21. Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades. (grau, total)
SELECT g.nombre as grau, count(a.id) as total
FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado
GROUP BY degree_name
HAVING subject_count >= 40
ORDER BY subject_count DESC;

-- 22. Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus. (grau, tipus, total_creditos)
SELECT g.nombre as grau, a.tipo as tipo, count(a.creditos) as total_creditos
FROM grado g JOIN asignatura a ON g.id = a.id_grado
GROUP BY degree, subject_type;

-- 23. Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats. (anyo_inicio, total)
SELECT ce.anyo_inicio, count(distinct asma.id_alumno) as total
FROM alumno_se_matricula_asignatura asma JOIN curso_escolar ce ON asma.id_curso_escolar = ce.id
GROUP BY ce.anyo_inicio;

-- 24. Retorna un llistat amb el nombre d'assignatures que imparteix cada professor/a. El llistat ha de tenir en compte aquells professors/es que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures. (id, nombre, apellido1, apellido2, total)
SELECT p.id as id, p.nombre, p.apellido1, p.apellido2, count(a.id) as total
FROM persona p JOIN profesor p1 ON p.id = p1.id_profesor
          LEFT JOIN asignatura a ON p1.id_profesor = a.id_profesor
GROUP BY id, first_name, last_name1, last_name2
ORDER BY subjects_count DESC;

-- 25. Retorna totes les dades de l'alumne/a més jove. (*)
SELECT * 
FROM persona p
WHERE p.fecha_nacimiento = (SELECT max(p.fecha_nacimiento)
                                   FROM persona p
                                   WHERE p.tipo = 'alumno')
      AND p.tipo = 'alumno';

-- 26. Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura. (apellido1, apellido2, nombre)
SELECT p.apellido1, p.apellido2, p.nombre
FROM persona p JOIN profesor p1 ON p.id = p1.id_profesor
               LEFT JOIN asignatura a ON p1.id_profesor = a.id_profesor
WHERE a.id IS NULL;
