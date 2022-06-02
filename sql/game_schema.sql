CREATE TABLE game (
  id INT GENERATED AS ALWAYS AS IDENTITY,
  publish_date DATE,
  archived BOOLEAN,
  multiplayer BOOLEAN,
  last_played_at DATE,
  genre_id INT references genre(id)
  PRIMARY KEY(id)
);