class CreateWorlds < ActiveRecord::Migration
  def change
    create_table :worlds do |t|
      t.references :user, unique: true
      t.string :name, index: true, null: false
      t.text :description, null: false

      t.timestamps null: false
    end

    add_index :worlds, [:user_id, :name], unique: true
  end
end
