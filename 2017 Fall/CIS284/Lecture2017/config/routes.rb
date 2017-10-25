Rails.application.routes.draw do
  get 'page/contact_us'

  get 'page/products'

  get 'page/preferences'

  get 'page/blog'

  get 'page/articles'

  get 'page/login'

  get 'page/calendar((/:month)/:year)', to: 'page#calendar', as: 'calendar'



  resources :movies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
