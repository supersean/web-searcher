class Crawler < ApplicationRecord
  has_and_belongs_to_many :drivers
  belongs_to :user

  validates :drivers, presence: true

end
