SQL> CREATE TABLE Genre (
  2      genre_id NUMBER PRIMARY KEY,
  3      genre_name VARCHAR2(50)
  4  );

Table created.

SQL> CREATE TABLE Mood (
  2      mood_id NUMBER PRIMARY KEY,
  3      mood_name VARCHAR2(30)
  4  );

Table created.

SQL> CREATE TABLE Movie (
  2      movie_id NUMBER PRIMARY KEY,
  3      title VARCHAR2(100),
  4      release_year NUMBER(4),
  5      genre_id NUMBER,
  6      rating NUMBER(3,1),
  7      description VARCHAR2(200),
  8      CONSTRAINT fk_movie_genre FOREIGN KEY (genre_id) REFERENCES Genre(genre_id)
  9  );

Table created.

SQL> CREATE TABLE MoodGenreMap (
  2      mood_id NUMBER,
  3      genre_id NUMBER,
  4      PRIMARY KEY (mood_id, genre_id),
  5      CONSTRAINT fk_mood_map FOREIGN KEY (mood_id) REFERENCES Mood(mood_id),
  6      CONSTRAINT fk_genre_map FOREIGN KEY (genre_id) REFERENCES Genre(genre_id)
  7  );

Table created.

SQL> CREATE TABLE Users (
  2      user_id NUMBER PRIMARY KEY,
  3      name VARCHAR2(50),
  4      email VARCHAR2(100),
  5      preferred_genre NUMBER,
  6      CONSTRAINT fk_users_genre FOREIGN KEY (preferred_genre) REFERENCES Genre(genre_id)
  7  );

Table created.

SQL> CREATE TABLE WatchHistory (
  2      user_id NUMBER,
  3      movie_id NUMBER,
  4      watched_on DATE,
  5      PRIMARY KEY (user_id, movie_id),
  6      CONSTRAINT fk_watch_user FOREIGN KEY (user_id) REFERENCES Users(user_id),
  7      CONSTRAINT fk_watch_movie FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
  8  );

Table created.

SQL> INSERT INTO Genre VALUES (1, 'Comedy');

1 row created.

SQL> INSERT INTO Genre VALUES (2, 'Drama');

1 row created.

SQL> INSERT INTO Genre VALUES (3, 'Action');

1 row created.

SQL> INSERT INTO Genre VALUES (4, 'Horror');

1 row created.

SQL> INSERT INTO Genre VALUES (5, 'Romance');

1 row created.

SQL> INSERT INTO Genre VALUES (6, 'Sci-Fi');

1 row created.

SQL> INSERT INTO Genre VALUES (7, 'Adventure');

1 row created.

SQL> INSERT INTO Genre VALUES (8, 'Thriller');

1 row created.

SQL> INSERT INTO Genre VALUES (9, 'Animation');

1 row created.

SQL> INSERT INTO Mood VALUES (1, 'Happy');

1 row created.

SQL> INSERT INTO Mood VALUES (2, 'Sad');

1 row created.

SQL> INSERT INTO Mood VALUES (3, 'Bored');

1 row created.

SQL> INSERT INTO Mood VALUES (4, 'Angry');

1 row created.

SQL> INSERT INTO Mood VALUES (5, 'Romantic');

1 row created.

SQL> INSERT INTO Movie VALUES (206, '3 Idiots', 2009, 1, 8.4, 'Comedy-drama about friendship and education');

1 row created.

SQL> INSERT INTO Movie VALUES (207, 'Lagaan', 2001, 2, 8.1, 'Drama about cricket and British rule in India');

1 row created.

SQL> INSERT INTO Movie VALUES (208, 'Dilwale Dulhania Le Jayenge', 1995, 5, 8.1, 'Romantic drama set in Europe and India');

1 row created.

SQL> INSERT INTO Movie VALUES (209, 'Kabhi Khushi Kabhie Gham', 2001, 2, 7.4, 'Family drama about love and relationships');

1 row created.

SQL> INSERT INTO Movie VALUES (210, 'Sholay', 1975, 3, 8.2, 'Classic action film about two criminals');

1 row created.

SQL> INSERT INTO Movie VALUES (211, 'The Dark Knight', 2008, 3, 9.0, 'Action film featuring Batman vs Joker');

1 row created.

SQL> INSERT INTO Movie VALUES (212, 'Titanic', 1997, 5, 7.8, 'Romantic drama set aboard the doomed RMS Titanic');

1 row created.

SQL> INSERT INTO Movie VALUES (213, 'The Shawshank Redemption', 1994, 2, 9.3, 'Drama about a man’s journey through prison');

1 row created.

SQL> INSERT INTO Movie VALUES (214, 'Inception', 2010, 3, 8.8, 'Sci-fi thriller about dreams within dreams');

1 row created.

SQL> INSERT INTO Movie VALUES (215, 'Forrest Gump', 1994, 5, 8.8, 'The life story of an extraordinary man with a low IQ');

1 row created.

SQL> INSERT INTO MoodGenreMap VALUES (1, 1);

1 row created.

SQL> INSERT INTO MoodGenreMap VALUES (2, 2);

1 row created.

SQL> INSERT INTO MoodGenreMap VALUES (3, 3);

1 row created.

SQL> INSERT INTO MoodGenreMap VALUES (4, 4);

1 row created.

SQL> INSERT INTO MoodGenreMap VALUES (5, 5);

1 row created.

SQL> INSERT INTO MoodGenreMap VALUES (3, 6);

1 row created.

SQL> INSERT INTO MoodGenreMap VALUES (1, 7);

1 row created.

SQL> INSERT INTO MoodGenreMap VALUES (2, 8);

1 row created.

SQL> INSERT INTO MoodGenreMap VALUES (1, 9);

1 row created.

SQL> INSERT INTO Users VALUES (101, 'Usnish', 'usb123@email.com', 1);

1 row created.

SQL> INSERT INTO Users VALUES (102, 'Debasmita', 'dsb987@email.com', 2);

1 row created.

SQL> INSERT INTO WatchHistory VALUES (101, 206, TO_DATE('2025-04-01', 'YYYY-MM-DD'));

1 row created.

SQL> INSERT INTO WatchHistory VALUES (102, 212, TO_DATE('2025-04-02', 'YYYY-MM-DD'));

1 row created.

SQL> SELECT m.title, m.release_year, g.genre_name, m.rating
  2  FROM Movie m
  3  JOIN Genre g ON m.genre_id = g.genre_id
  4  JOIN MoodGenreMap mgm ON g.genre_id = mgm.genre_id
  5  JOIN Mood mo ON mgm.mood_id = mo.mood_id
  6  WHERE mo.mood_name = 'Happy';

TITLE                                                                           
--------------------------------------------------------------------------------
RELEASE_YEAR GENRE_NAME                                             RATING      
------------ -------------------------------------------------- ----------      
3 Idiots                                                                        
        2009 Comedy                                                    8.4      
                                                                                

SQL> SPOOL OFF;
