class PageController < ApplicationController
  def contact_us
    @a = [1, 2, 3, 4, 5, 6]

    @now = DateTime.now

    @first_name = params['first_name']
    @last_name = params['last_name']

    @error = ''
    if @first_name.to_s.strip == ''
      @error = "First Name is Required!"
    end

    @phone_number = params['phone_number']

    @question = params['question']

    @newsletter = params['newsletter']
    @subscribed = @newsletter == 'subscribed' ? true : false

    @gender = params['gender']

    @restaurants = [
        "Red Dragon Chinese",
        "McDonalds",
        "Taco Bell"
    ]
    @selected_restaurant = params['restaurants']

  end

  def products
    @products = {
        "Snow Skiis" => "$200.00",
        "Snow boards" => "$150.00",
        "Snow books" => "$100.00",
        "Mittens" => "$9.00",
        "Gloves" => "$15.00",
        "Hats" => "$20.00"
    }
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
