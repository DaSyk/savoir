Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  root :to => 'pages#home'

  get '/impressum', :to => 'pages#impressum', :as => 'impressum'
  get '/notes', :to => 'pages#notes', :as => 'notes'

  devise_for :admins
  resources :houses do
      resources :pictures
      resources :bookings
  end

  put '/houses', :to => 'houses#activate'
  put '/houses/:house_id/pictures', :to => 'pictures#set_default'
  put '/houses/:house_id/bookings', :to => 'bookings#change_accepted'

  get '/list', :to => 'houses#f_index', :as => 'houses_list'

  get '/config/places', :to => 'places#edit', :as => 'edit_place'
  patch '/config/places', :to => 'places#update'
  put '/config/places', :to => 'places#update'

  get '/config/details', :to => 'details#edit', :as => 'edit_details'
  patch '/config/details', :to => 'details#update'
  put '/config/details', :to => 'details#update'

  get '/config/pages', :to => 'page_configs#edit', :as => 'edit_page_config'
  patch '/config/pages', :to => 'page_configs#update'
  put '/config/pages', :to => 'page_configs#update'

end
