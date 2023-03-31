class CreateDrivers < ActiveRecord::Migration[7.0]
  def change
    create_table :drivers do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :drivers
  end
end
