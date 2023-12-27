Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'welcome#index'

  get '/about',  to: 'about#index'
  get '/portfolio', to: 'portfolio#index'
  get '/porfolio/new', to: 'pictures#new'
end
