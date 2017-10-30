json.extract! restaurant, :id, :name, :location, :cuisine, :low_price_range, :high_price_range, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
