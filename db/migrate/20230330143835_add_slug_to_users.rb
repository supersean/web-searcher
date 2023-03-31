class AddSlugToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :slug, :string
    add_index :users, :slug, unique: true
  end
  
  def self.down
    drop_column :users, :slug
    remove_index :users, :slug, unique: true
  end
end
