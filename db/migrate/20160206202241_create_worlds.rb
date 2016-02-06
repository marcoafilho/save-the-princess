class CreateWorlds < ActiveRecord::Migration
  def change
    create_table :worlds do |t|
      t.references :user, unique: true, null: false
      t.string :name, index: true, null: false
      t.text :description

      t.timestamps null: false
    end

    add_index :worlds, [:user_id, :name], unique: true
  end
end
