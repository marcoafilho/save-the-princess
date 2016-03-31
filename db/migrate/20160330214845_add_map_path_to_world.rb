class AddMapPathToWorld < ActiveRecord::Migration
  def change
    add_column :worlds, :map_path, :string
  end
end
