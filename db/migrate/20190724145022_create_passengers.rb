class CreatePassengers < ActiveRecord::Migration[5.2]
  def change
    create_table :passengers do |t|
      t.string :name
      t.datetime :birthdate
      t.string :national_registry_code
      t.string :email
      t.timestamps
    end
    add_reference :passengers, :bus, foreign_key: true
  end
end
