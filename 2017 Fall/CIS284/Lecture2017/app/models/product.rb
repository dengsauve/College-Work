class Product < ApplicationRecord
  has_many :product_reviews, dependent: :destroy

  # Ensure name
  validates :name, presence: true

  # Ensure description
  validates :description, presence: true

  # Ensure qty on hand, ensure is_numeric, ensure no integer
  validates :quantity_on_hand, numericality: {greater_than_or_equal_to: 0}, presence: true

  # Ensure selling price, ensure is_numeric
  # allow_blank in case a sale price hasn't been decided upon
  validates :selling_price, numericality: {greater_than_or_equal_to: 0}, allow_blank: true

  # Ensure Cost, ensure is_numeric
  validates :cost, numericality: true, presence: true

  # Ensure shipping weight, ensure is_numeric
  validates :shipping_weight, numericality: true

  # Validates images URLS using 'valid_url' gem.
  # allow_blank in case there's no image to be had.
  validates :image_thumbnail, :allow_blank => true, url: true
  validates :image_full, :allow_blank => true, url: true

end
