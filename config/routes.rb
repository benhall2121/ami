Ami::Application.routes.draw do
  
  resources :password_resets

  resources :sessions

  resources :users

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"

  root :to => "users#home"

  #Catch all for routing errors, needs to be at the bottom of the routes file
  match '*a', :to => 'application#routingError' 
end
