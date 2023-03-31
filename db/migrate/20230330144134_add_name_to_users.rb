class AddNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
  end

  def self.down
    drop_column :users, :name
  end
end
