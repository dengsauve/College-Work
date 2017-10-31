class Restaurant < ApplicationRecord
  has_many :reviews

  # Ensures there's a name in the form
  validates_presence_of :name

  # Ensures that the price ranges are present and numbers and range
  validates_numericality_of :low_price_range
  validates_numericality_of :high_price_range, :greater_than => 1

  # Using the newer method
  validates :high_price_range, numericality: true, presence: true

end
