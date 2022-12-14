Rails.application.routes.draw do
  resources :images
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'welcome#index'
  post '/payments/create-intent', to: 'payments#create_intent'
  get 'my_images', action: :my_images, controller: 'images'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
