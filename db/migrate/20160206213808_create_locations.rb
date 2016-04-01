class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.references :world, index: true, null: false
      t.string :name, index: true
      t.text :description
      t.float :latitude, null: false
      t.float :longitude, null: false

      t.timestamps null: false
    end

    add_index :locations, [:world_id, :latitude, :longitude], unique: true
  end
end
