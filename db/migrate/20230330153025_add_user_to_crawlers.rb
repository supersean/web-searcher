class AddUserToCrawlers < ActiveRecord::Migration[7.0]
  def change
    add_reference :crawlers, :user, null: false, foreign_key: true
  end
end
