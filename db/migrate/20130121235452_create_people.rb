class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, limit: 35
      t.string :person_type
      t.string :degree_from_school
      t.integer :years_in_practice
      t.timestamps
    end
  end
end
