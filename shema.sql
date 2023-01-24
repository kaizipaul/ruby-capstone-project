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
