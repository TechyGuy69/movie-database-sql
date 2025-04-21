# movie-database-sql
"A collection of SQL scripts to create and manage movie database, including table creation and data insertion."



# Movie Database SQL Scripts

This repository contains SQL scripts to create and manage a movie database, including table creation, data insertion, and recommendations.

## Tables

- Genre
- Movie
- Mood
- Mood-Genre Mapping

## Instructions

1. Run the `movie_recommendation.sql` file to create the schema and insert data into the database.
2. Use the queries provided in the script for recommendations and data retrieval.





ER Diagram:


[User]             [Mood]               [Genre]
 user_id (PK)       mood_id (PK)         genre_id (PK)
 name               mood_name            genre_name
 email                                   -
 preferred_genre (FK) <------------------

         |                             ^
         |                             |
         v                             |
[WatchHistory]                 [MoodGenreMap]
 user_id (FK) ----------------> mood_id (FK)
 movie_id (FK) ---------------> genre_id (FK)
 watched_on

         |
         v
     [Movie]
     movie_id (PK)
     title
     release_year
     genre_id (FK)
     rating
     description

