Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'welcome#index'
  get '/about',  to: 'about#index'

  resources :pictures, only: [:index, :new, :create]
  get '/pictures/landscape_pictures', to: 'landscape_pictures#index'
  get '/pictures/animal_pictures', to: 'animal_pictures#index'
  get '/pictures/animal_pictures/:id', to: 'animal_pictures#show'
  
end
