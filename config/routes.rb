Ami::Application.routes.draw do
  
  resources :sections

  resources :emails

  resources :faqs

  resources :descriptions

  resources :startups

  resources :password_resets

  resources :sessions

  resources :users

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"

  get "about" => "sections#about", :as => "about"

  get "editSection" => "sections#edit", :as => "editSection"

  get "admin" => "users#admin", :as => "admin"

  match '/emails/add_email' => 'emails#add_email'

  root :to => "users#home"

  match '/:startup_usersname' => 'startups#show'

  #Catch all for routing errors, needs to be at the bottom of the routes file
  match '*a', :to => 'application#routingError' 
end
