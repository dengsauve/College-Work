class PageController < ApplicationController
  def contact_us
    @a = [1, 2, 3, 4, 5, 6]
    @now = DateTime.now
    @products = {
        "Watermelon" => "Green",
        "Cantelope" => "Tan",
        "Lemon" => "Yellow"
    }
  end

  def products
  end

  def preferences
  end

  def blog
  end

  def calendar
  end

  def articles
  end

  def login
  end
end
