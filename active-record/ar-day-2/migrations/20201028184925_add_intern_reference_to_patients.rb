class AddInternReferenceToPatients < ActiveRecord::Migration[6.0]
  def change
    add_reference :patients, :intern, foreign_key: true
  end
end

# How do we add an new column to an existing table?

def change
  add_column :patients, :email, :string
  add_column :patients, :age, :integer
end

## add_reference => create foreign in the table


## create a migration

-- create our migration file
-- define the class && inherit
-- write our change method
-- create_table vs. add_reference vs. add_column
-- run it in our terminal vs rake db:migrate


-- rake console
--> Animal.all
