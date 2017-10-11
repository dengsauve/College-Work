class PageController < ApplicationController
  def contact_us

    @name = params['name']

    @email = params['email']

    @phone_number = params['phone_number']

    @question = params['question']

    @newsletter = params['newsletter']
    @subscribed = @newsletter == 'subscribed'# ? true : false

    @youtube = params['youtube']
    @watching = @youtube == 'watching'

    @contact_method = params['contact_method']

    @products = [
        "Snow Skiis",
        "Snow boards",
        "Snow books",
        "Mittens",
        "Gloves",
        "Hats"
    ]
    @selected_product = params['products']


    if @name != nil && @name.to_s.strip == ''
      flash.now[:name_error] = "Name is Required!"
    end

    if @email != nil && @email.to_s.strip == ''
      flash.now[:email_error] = "Email is Required!"
    end

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
