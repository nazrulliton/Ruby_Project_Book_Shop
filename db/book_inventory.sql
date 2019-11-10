DROP TABLE stock;
DROP TABLE suppliers;
DROP TABLE books;

CREATE TABLE suppliers(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  address VARCHAR(255)
);

CREATE TABLE books(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  description VARCHAR(255),
  genre VARCHAR(255)
);

CREATE TABLE stock(
  id SERIAL4 PRIMARY KEY,
  quantity INT2,
  buying_cost NUMERIC,
  selling_price NUMERIC,
  book_id INT2 REFERENCES books(id),
  supplier_id INT2 REFERENCES suppliers(id)
);
