class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :pet, :person
      t.datetime :date_of_visit
      t.boolean  :reminder_required
      t.string   :reason_for_visit
      t.timestamps
    end
  end
end
