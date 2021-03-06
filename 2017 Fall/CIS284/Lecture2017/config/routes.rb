Rails.application.routes.draw do
  resources :blog_comments
  resources :blogs
  resources :product_reviews
  resources :articles
  devise_for :users
  resources :products
  resources :reviews
  resources :restaurants do
    resources :reviews
  end
  get 'page/contact_us'

  get 'page/products'

  get 'page/preferences'

  get 'page/blog'

  get 'page/articles'

  get 'page/login'

  get 'calendar((/:month)/:year)', to: 'page#calendar', as: 'calendar'

  root 'page#articles'

  resources :movies

  resources :stores
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  # adding puzzle routes

  get 'puzzles/new'
  post 'puzzles/new', to: 'puzzles#create'
  get 'puzzles/show'
end
