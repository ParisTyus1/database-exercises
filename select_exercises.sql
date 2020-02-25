USE codeup_test_db;
SELECT * FROM albums WHERE artist = 'Pink Floyd';
SELECT release_date FROM albums WHERE artist = 'Sgt. Pepper''s Lonely Hearts Club Band';
SELECT genre FROM albums WHERE album_name = 'NeverMind';
SELECT * FROM albums WHERE release_date >= 1990;
SELECT * FROM albums WHERE total_certified_copies >= 20;
SELECT * FROM albums WHERE UPPER(genre) <= 'Rock';
DESCRIBE albums;