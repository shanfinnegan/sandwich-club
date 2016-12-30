Rails.application.routes.draw do
  root :to => 'static#index'
  resources :comments, except: [:destroy, :update]
  resources :eaters, except: [:destroy, :update]
  resources :sandwiches, except: [:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
