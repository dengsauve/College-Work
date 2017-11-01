class Product < ApplicationRecord

  # Ensure name
  validates :name, presence: true

  # Ensure description
  validates :description, presence: true

  # Ensure qty on hand, ensure is_numeric, ensure no integer
  validates :quantity_on_hand, numericality: true, presence: true

  # Ensure selling price, ensure is_numeric
  validates :selling_price, numericality: true

  # Ensure Cost, ensure is_numeric
  validates :cost, numericality: true, presence: true

  # Ensure shipping weight, ensure is_numeric
  validates :shipping_weight, numericality: true

  # Validates images URLS using 'valid_url' gem
  validates :image_thumbnail, url: true, presence: false
  validates :image_full, url: true, presence: false





end
