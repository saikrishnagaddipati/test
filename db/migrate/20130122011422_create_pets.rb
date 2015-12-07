class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.references :person
      t.string :name, limit: 35
      t.string :pet_type
      t.string :breed, limit: 35
      t.integer :age
      t.float   :weight
      t.date    :last_visit
      t.timestamps
    end
  end
end
