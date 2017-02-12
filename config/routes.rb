Rails.application.routes.draw do
  root :to => 'static#index'
  resources :eaters, except: [:destroy, :update]
  resources :sandwiches, except: [:destroy]
  resources :comments, except: [:destroy, :update]
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
