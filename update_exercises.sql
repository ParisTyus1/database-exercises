USE codeup_test_db;
SELECT album_name FROM albums;
SELECT * FROM albums WHERE release_date <= 1980;
SELECT * FROM albums WHERE artist <= 'Michael Jackson';

UPDATE albums SET total_certified_copies = total_certified_copies * 10;

UPDATE albums SET release_date = CAST(release_date AS SIGNED) - 100
WHERE release_date <= 1980;

UPDATE albums SET artist = 'Peter Jackson'
WHERE artist = 'Michael Jackson';

