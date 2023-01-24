-- Game class table
CREATE TABLE game (
  id SERIAL PRIMARY KEY ,
  item_id INT FOREIGN KEY REFERENCES item(id),
  multiplayer VARCHAR,
  last_played_at DATE,
  publish_date DATE,
);

-- Author class table
CREATE TABLE author (
  id SERIAL PRIMARY KEY,
  item_id INT FOREIGN KEY REFERENCES item(id),
  first_name VARCHAR,
  last_name VARCHAR
);
