CREATE DATABASE record_company; 
USE record_company;
CREATE TABLE bands (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
    PRIMARY KEY(ID)
);

CREATE TABLE albums (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
	release_year INT,
    band_id INT NOT NULL, 
    PRIMARY KEY (id),
    FOREIGN KEY (band_id) REFERENCES bands(id)
);

INSERT INTO bands (name)
VALUES ('Iron Maiden');

INSERT INTO bands (name)
VALUES ('Deuce'), ('Avenged Sevenfold'), ('Ankor');

SELECT * FROM bands; 

SELECT * from bands LIMIT 2;

SELECT name FROM bands;

SELECT id AS 'ID', name as 'BAND NAME'
FROM bands;

SELECT * FROM bands ORDER BY name DESC;

INSERT INTO albums (name, release_year, band_id)
VALUES ('The Number of the Beast', 1985, 1),
	('Power Slave', 1984, 1),
    ('Nightmare', 2018, 2),
    ('Nightmare', 2010, 3),
    ('Test Album', Null , 3);
    
SELECT * from albums;

SELECT DISTINCT name FROM albums;

UPDATE albums
SET release_year = 1982
WHERE id = 1; 

-- Select years less than 2000 
SELECT * FROM albums 
WHERE release_year < 2000;

-- % equates any amounf of letters REGEX
SELECT * FROM albums 
WHERE name LIKE '%er%' OR band_id = 2;

SELECT * FROM albums
WHERE release_year = 1984 AND band_id = 1;

SELECT * FROM albums 
WHERE release_year BETWEEN 2000 AND 2018;

SELECT * FROM albums 
WHERE release_year IS NULL;

DELETE FROM albums
WHERE id = 5;

-- Inner join table written first is on left
SELECT * FROM bands 
INNER JOIN albums ON bands.id = albums.band_id;

-- Left join everything from the left side 
SELECT * FROM bands 
LEFT JOIN albums ON bands.id = albums.band_id;

-- right join everything from the left side 
SELECT * FROM albums
RIGHT JOIN bands ON bands.id = albums.band_id;

-- aggregate functions
SELECT AVG(release_year) FROM albums;

SELECT SUM(release_year) FROM albums;

-- Count and groupby. Aggregate works on the whole

SELECT band_id, COUNT(band_id) from albums
GROUP BY band_id; 


-- Talk about column we want to select
SELECT b.name AS band_name, COUNT(a.id) as num_albums
FROM bands AS b 
LEFT JOIN albums AS a ON b.id = a.band_id
GROUP by b.id;


-- Select when num_albums = 1 Having happens after Groupby
SELECT b.name AS band_name, COUNT(a.id) as num_albums
FROM bands AS b 
LEFT JOIN albums AS a ON b.id = a.band_id
WHERE b.name = 'Deuce'
GROUP by b.id
HAVING num_albums = 1;

















