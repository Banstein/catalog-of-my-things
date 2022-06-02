CREATE TABLE game (
  id INT GENERATED AS ALWAYS AS IDENTITY,
  publish_date DATE,
  archived BOOLEAN,
  multiplayer BOOLEAN,
  last_played_at DATE,
  PRIMARY KEY(id)
);