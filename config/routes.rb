Rails.application.routes.draw do
  resources :comments
  resources :eaters
  resources :sandwiches
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
