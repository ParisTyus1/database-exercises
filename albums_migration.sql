CREATE DATABASE IF NOT EXISTS codeup_test_db;
USE codeup_test_db;
DROP TABLE IF EXISTS albums;
CREATE TABLE albums (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    artist VARCHAR(50) DEFAULT 'NONE',
    album_name  VARCHAR(100) NOT NULL,
    release_date  CHAR(4),
    sales  FLOAT NOT NULL,
    genre VARCHAR (80) NOT NULL,
    total_certified_copies FLOAT NOT NULL,
    refs VARCHAR(4),
    PRIMARY KEY (id),
    CONSTRAINT uc_albums UNIQUE (artist, album_name)
);


-- add a row of data
# INSERT INTO albums(artist, album_name, release_date, sales,total_certified_copies, genre, refs)
# values ('Do or Die', 'Po pimpin', '1996',1000000,10,'Rap', 4);