class CreateCrawlers < ActiveRecord::Migration[7.0]
  def change
    create_table :crawlers do |t|
      t.string :keywords

      t.timestamps
    end
  end
end
