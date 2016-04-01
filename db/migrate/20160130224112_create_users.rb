class CreateUsers < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :username, unique: true, null: false
      t.string :email, unique: true, null: false
      t.string :password_digest, null: false
      t.boolean :admin, default: false

      t.timestamps null: false
    end
  end
end
