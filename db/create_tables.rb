require 'sqlite3'

db = SQLite3::Database.new "db/address_bloc.sqlite"

db.execute("DROP TABLE address_bloc;")
db.execute("DROP TABLE entry;")

sql = <<-SQL
  CREATE TABLE address_book (
    id INTEGER PRIMARY KEY,
    name VARCHAR(30)
  );
SQL

db.execute sql

sql = <<-SQL
  CREATE TABLE entry (
    id INTEGER PRIMARY KEY,
    address_book_id INTEGER,
    name VARCHAR(30),
    phone_number VARCHAR(30),
    email VARCHAR(30),
    FOREIGN KEY (address_book_id) REFERENCES address_book(id)
  );
SQL