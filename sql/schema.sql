CREATE DATABASE catalog_of_things

CREATE TABLE genre (
  id INT GENERATED ALWAYS AS IDENTITY
  name VARCHAR(200)
  PRIMARY KEY(id)
)

CREATE TABLE music_album (
  id INT GENERATED ALWAYS AS IDENTITY
  publish_date DATE
  on_spotify BOOLEAN
  archived BOOLEAN
  genre_id INT references genre(id)
  PRIMARY KEY(id)
)

