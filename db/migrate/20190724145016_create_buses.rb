class CreateBuses < ActiveRecord::Migration[5.2]
  def change
    create_table :buses do |t|
      t.string :name
      t.integer :armchair
      t.string :license_plate

      t.timestamps
    end
  end
end
