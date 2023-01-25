-- Create Item class table
CREATE TABLE item (
  id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  genre text,
  author text,
  label text,
  publish_date date,
  archived boolean,
);

-- Create Music Album class table
CREATE TABLE music_album (
  id SERIAL PRIMARY KEY,
  item_id int FOREIGN KEY REFERENCES item(id),
  on_spotify boolean,
  publish_date date,
  archived boolean,
);

-- Create a Genre class table
CREATE TABLE genre (
  id SERIAL PRIMARY KEY,
  item_id int FOREIGN KEY REFERENCES item(id),
  name varchar
);


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
