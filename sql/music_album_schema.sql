CREATE TABLE music_album (
  id INT GENERATED ALWAYS AS IDENTITY
  publish_date DATE
  on_spotify BOOLEAN
  archived BOOLEAN
  genre_id INT REFERENCES genre (id),
  author_id INT REFERENCES author (id),
  label_id INT REFERENCES label (id),
  PRIMARY KEY(id)
)

