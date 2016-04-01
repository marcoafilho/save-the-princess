class CreateWorlds < ActiveRecord::Migration
  def change
    create_table :worlds do |t|
      t.references :account, unique: true, null: false
      t.string :name, index: true, null: false
      t.text :description
      t.string :map_path, null: false

      t.timestamps null: false
    end

    add_index :worlds, [:account_id, :name], unique: true
  end
end
