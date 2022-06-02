CREATE TABLE game (
  id INT GENERATED AS ALWAYS AS IDENTITY,
  publish_date DATE,
  archived BOOLEAN,
  multiplayer BOOLEAN,
  last_played_at DATE,
  genre_id INT references genre(id)
  author_id INT references author(id)
  label_id INT references label(id)
  PRIMARY KEY(id)
);