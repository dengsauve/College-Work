class PageController < ApplicationController
  def contact_us
    @a = [1, 2, 3, 4, 5, 6]
    @now = DateTime.now
    @products = {
        "Watermelon" => "Green",
        "Cantelope" => "Tan",
        "Lemon" => "Yellow"
    }
    @first_name = params['first_name']
    @last_name = params['last_name']
    @phone_number = params['phone_number']
    @question = params['question']
    @newsletter = params['newsletter']
    @subscribed = @newsletter == 'subscribed' ? true : false
    @gender = params['gender']
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
