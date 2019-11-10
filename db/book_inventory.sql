DROP TABLE stock;
DROP TABLE book;
DROP TABLE supplier;

CREATE TABLE supplier(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  address VARCHAR(255)
);

CREATE TABLE book(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  desription VARCHAR(255),
  genre VARCHAR(255)
);

CREATE TABLE stock(
  id SERIAL4 PRIMARY KEY,
  quantity INT2,
  buying_cost NUMERIC,
  selling_price NUMERIC,
  book_id INT2 REFERENCES book(id),
  supplier_id INT2 REFERENCES supplier(id)
);
