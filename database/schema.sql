CREATE TABLE items(
  id                INT GENERATED ALWAYS AS IDENTITY,
  publish_date      DATE,
  genre             VARCHAR,
  author            VARCHAR,
  source            VARCHAR,
  label             VARCHAR,
  archived          BOOLEAN,
  genre_id          INT REFERENCES genres(id) ON DELETE CASCADE,
  author_id         INT REFERENCES authors(id) ON DELETE CASCADE,
  source_id         INT REFERENCES sources(id) ON DELETE CASCADE,
  label_id          INT REFERENCES labels(id) ON DELETE CASCADE,
  PRIMARY KEY (id)
);

CREATE TABLE labels(
  id                INT GENERATED ALWAYS AS IDENTITY,
  title             VARCHAR,
  color             VARCHAR,
  PRIMARY KEY (id)
);

CREATE TABLE books(
  id                INT GENERATED ALWAYS AS IDENTITY,
  publish_date      DATE,
  publisher         VARCHAR,
  cover_state       VARCHAR,
  title             VARCHAR,
  author            VARCHAR,
  source            VARCHAR,
  label             VARCHAR,
  archived          BOOLEAN,
  author_id         INT REFERENCES authors(id) ON DELETE CASCADE,
  source_id         INT REFERENCES sources(id) ON DELETE CASCADE,
  label_id          INT REFERENCES labels(id) ON DELETE CASCADE,
  PRIMARY KEY (id)
);