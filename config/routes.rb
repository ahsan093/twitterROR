Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :tweets
  resources :likes, only: :create
  post '/retweet/:id', to: 'tweets#retweet', as: 'retweet'
  root "tweets#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
