USE codeup_test_db;
SELECT * FROM albums WHERE release_date >= 1991;
SELECT * FROM albums WHERE genre >= 'Disco';
SELECT * FROM albums WHERE artist <= 'Pink Floyd';

DELETE FROM  albums WHERE release_date >= 1991;
DELETE FROM  albums WHERE genre >= 'Disco';
DELETE FROM  albums WHERE artist LIKE 'Pink Floyd';