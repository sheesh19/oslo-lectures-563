# SQL REVIEW

# What are relational databases?
- database full of tables connected together via foreign_keys

# What relationships do we know?
- 1:N & N:N
- N:N -> we need a join table
- has_many && belongs_to


# FOR OUR RESTAURANTS => SQL RECAP

# CREATE
- INSERT INTO restaurants (name, address)
- VALUES ('Hutong', 'Melbourne')

# READ ALL
- SELECT * FROM restaurants;

# READ ONE
- SELECT * FROM restaurants WHERE id = 1;

# DELETE
- DELETE FROM restaurants WHERE id = 1;

# UPDATE
- UPDATE restaurants SET name = 'Pita Pockit' WHERE id = 1;

# ADVANCED
- COUNT(*)
- JOIN
- GROUP BY
- ORDER BY
- LIMIT


