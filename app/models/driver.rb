class Driver < ApplicationRecord
  has_and_belongs_to_many :crawlers

  validates :name, presence: true
end
