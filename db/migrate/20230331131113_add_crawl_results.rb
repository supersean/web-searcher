class AddCrawlResults < ActiveRecord::Migration[7.0]
  def change
    create_table :crawl_results do |t|
      t.string :html
      t.timestamps
    end

    add_reference :crawl_results, :crawler, null: false, foreign_key: true
  end

  def self.down
    remove_reference :crawl_results, :crawler, null: false, foreign_key: true
    drop_table :crawl_results
  end
end
