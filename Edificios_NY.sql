
-- CREAMOS LA NUEVA BASE DE DATOS

CREATE DATABASE Edificio;

-- UNA VEZ CREADA, NOS POSICIONAMOS EN ELLA

USE Edificio;

-- LLAMAMOS TODA LA BASE DE DATOS PARA COMPROBAR QUE SE IMPORTÓ CORRECTAMENTE

SELECT * FROM nyc; 

-- EXPLORAMOS LAS COLUMNAS

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'nyc'; 



----------------------------------------------------------------------------------------------



-- EXTRACCION DE INFORMACION A TRAVÉS DE CONSULTAS SQL

-- PREGUNTAS OBJETIVO

-- 1. ¿Cuál es el número total de propiedades registradas en el conjunto de datos?

SELECT COUNT(*) AS Total FROM nyc;

-- 2. ¿Cuál es el año de construcción más común entre las propiedades registradas?

SELECT AÃ‘O_CONSTRUCCION, COUNT(AÃ‘O_CONSTRUCCION) AS AnoConstruccion FROM nyc
GROUP BY AÃ‘O_CONSTRUCCION
ORDER BY AnoConstruccion DESC;


-- 3. ¿Cuál es el sector con mayor cantidad de propiedades en el conjunto de datos?

SELECT SECTOR, COUNT(SECTOR) AS Numero_Propiedades FROM nyc
GROUP BY SECTOR
ORDER BY Numero_Propiedades DESC;

-- 4. ¿Cuál es el barrio con la mayor cantidad de propiedades registradas?

SELECT BARRIO, COUNT(BARRIO) AS Numero_Propiedades FROM nyc
GROUP BY BARRIO
ORDER BY Numero_Propiedades DESC;

-- 5. ¿Cuál es el precio de venta promedio de las propiedades en el conjunto de datos?

SELECT AVG(PRECIO_VENTA_USD) AS Precio_Promedio FROM nyc;

-- 6. ¿Cuál es el barrio con la mayor cantidad de propiedades en venta?

SELECT BARRIO, COUNT(BARRIO) AS Propiedades_Venta FROM nyc
GROUP BY BARRIO
ORDER BY Propiedades_Venta DESC;

-- 7. ¿Cuántas propiedades se vendieron en cada año?

SELECT AÃ‘O_VENTA, COUNT(AÃ‘O_VENTA) AS Ano_Venta FROM nyc
GROUP BY AÃ‘O_VENTA
ORDER BY Ano_Venta DESC; 

-- 8. ¿Cuál es el sector con el mayor promedio de áreas totales de las propiedades?

SELECT SECTOR, AVG(TOTAL_AREAS) AS Areas_Totales FROM nyc
GROUP BY SECTOR
ORDER BY Areas_Totales DESC;

-- 9. ¿Cuál es la propiedad con el precio de venta más alto registrado en dólares?

SELECT * FROM nyc
ORDER BY PRECIO_VENTA_USD DESC
LIMIT 1;

-- 10. ¿Cuál es la propiedad con el precio de venta más bajo registrado en dólares?

SELECT * FROM nyc
ORDER BY PRECIO_VENTA_USD ASC
LIMIT 1;

-- 11. ¿Cuántas propiedades tienen una suma total de áreas residenciales y comerciales superior a 10?	

SELECT COUNT(*) AS Total_Propiedades
FROM nyc
WHERE (TOTAL_AREAS) > 10;

-- 12. ¿Cuántas propiedades tienen un área total superior a 500 metros cuadrados?

SELECT COUNT(*) AS Prop_sup_500 FROM nyc
WHERE (METROS_CUADRADOS_TERRENO) > 500; 

-- 13. ¿Cuál es la media de la superficie en metros cuadrados de los edificios?

SELECT AVG(METROS_CUADRADOS_TERRENO) AS Sup_prom FROM nyc;

-- 14. ¿Cuál es el precio de venta promedio por metro cuadrado de terreno?

SELECT SUM(PRECIO_VENTA_USD) / SUM(METROS_CUADRADOS_TERRENO) AS Precio_Venta_Promedio_Por_Metro_Cuadrado
FROM nyc
WHERE metros_cuadrados_terreno > 0;

-- 15. ¿Cuál es la propiedad más antigua?

SELECT * FROM nyc
ORDER BY AÃ‘O_CONSTRUCCION ASC
LIMIT 1;

-- 16. ¿Cuál es la propiedad más nueva?

SELECT * FROM nyc
ORDER BY AÃ‘O_CONSTRUCCION DESC
LIMIT 1;

