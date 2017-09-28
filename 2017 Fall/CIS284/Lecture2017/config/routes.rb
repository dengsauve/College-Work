Rails.application.routes.draw do
  get 'page/contact_us'

  get 'page/products'

  get 'page/preferences'

  get 'page/blog'

  get 'page/calendar'

  get 'page/articles'

  get 'page/login'

  resources :movies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
