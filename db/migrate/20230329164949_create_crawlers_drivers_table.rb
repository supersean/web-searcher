class CreateCrawlersDriversTable < ActiveRecord::Migration[7.0]
  def change
    create_table :crawlers_drivers, :id => false do |t|
      t.references :driver
      t.references :crawler
      t.timestamps
    end
  end

  def self.down 
    drop_table :crawlers_drivers
  end
end
