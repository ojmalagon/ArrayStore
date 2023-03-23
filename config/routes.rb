Rails.application.routes.draw do
  get 'array_manager/getarray/:lenght', to: 'array_manager#getarray'
  post 'array_manager/getrange', to: 'array_manager#getrange'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
