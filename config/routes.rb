Rails.application.routes.draw do

  root :to => 'pages#home'
  get '/impressum', :to => 'pages#impressum', :as => 'impressum'
  get '/notes', :to => 'pages#notes', :as => 'notes'

  devise_for :admins
  resources :houses do
      resources :pictures
      resources :bookings
  end

  get '/list', :to => 'houses#f_index', :as => 'houses_list'


  get '/places', :to => 'places#edit', :as => 'edit_place'
  patch '/places', :to => 'places#update'
  put '/places', :to => 'places#update'

  get '/page_config', :to => 'page_configs#edit', :as => 'edit_page_config'
  patch '/page_config', :to => 'page_configs#update'
  put '/page_config', :to => 'page_configs#update'

end
