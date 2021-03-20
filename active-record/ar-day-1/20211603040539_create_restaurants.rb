class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string    :name
      t.string    :address
      t.timestamps # add 2 columns, `created_at` and `updated_at`
    end
  end

  # Migrations => create / update our schema

  # Steps to change a column?
  # 1. create a migration file
  # 2. fill out our migration

  # def change
  #   add_column :restaurants, :manager, :string
  # ends
end
