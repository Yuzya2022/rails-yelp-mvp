Rails.application.routes.draw do
  root "restaurants#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :restaurants do
    # * Nested routes with relation to reviews -> /restaurants/:restaurants_id/new
    resources :reviews, only: %i[index new create]
  end

  # * /reviews/:id
  resources :reviews, only: %i[show edit update destroy]
end
