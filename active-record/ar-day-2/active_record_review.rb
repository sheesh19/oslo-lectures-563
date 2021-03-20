# REVIEW

- Relational databases: why do we use them? What are they?
-- Databases store data for us.
-- Linked together through foreign keys

- Relationships
-- 1:N
-- N:N => JOIN TABLE (hasboth foreign_keys)
-- belongs_to && has_many

- What is SQL?
-- the language we use to interact with our database

SQL RECAP

- READ ALL
-- SELECT * FROM
- READ ONE
-- SELECT * FROM ... WHERE id = ?
- CREATE
-- INSERT INTO
- UPDATE
-- UPDATE SET
- DELETE
-- DELETE FROM ... WHERE id = ?
- FILTERS
-- COUNT(*)
-- ORDER BY
-- GROUP BY
-- LIMIT
- JOIN
-- enables us to fetch queries & data from several tables at once
# patients && consultations
-- JOIN table_name ON column_one.id = column_two.column_one_id
-- JOIN patients ON patients.id = consultations.patient_id

RAKE TASKS
- rake db:drop
- rake db:create
- rake db:migrate
- rake db:seed
- rake console

ACTIVE RECORD RECAP

- Active Record
-- enables to update our data via RUBY (not SQL)
-- we can inherit from the ActiveRecord Base in our model
-- relates one record in our database to one instance in our Ruby memory
-- gem

- What are migrations?
-- change to our db structure

## Animal

- READ ALL
-- Animal.all

- READ ONE
-- Animal.find(1)
-- Animal.find_by(name: 'Dolphin')

- CREATE
-- Animal.create(name: 'Dolphin')

-- animal = Animal.new(name: 'Dolphin')
-- animal.save

- UPDATE
-- animal = Animal.find(1)
-- animal.name = 'Tiger'
-- animal.save

- DELETE
-- animal = Animal.find(1)
-- animal.destroy

- ADVANCED
-- Animal.first
-- Animal.last
-- Animal.where(habitat: 'Ocean')
-- Animal.first(5)
-- Animal.count


- What are validations?
-- validations ensure our database receives the clean & correct data

- What are some examples?
-- uniqueness: true
-- presence: true


