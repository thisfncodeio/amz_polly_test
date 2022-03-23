Rails.application.routes.draw do
  get "/interventions" => "interventions#new"
  resources :interventions
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
 
get 'get_buildings_by_customer/:customer_id', to: 'buildings#get_buildings_by_customer'
get 'get_batteries_by_building/:building_id', to: 'batteries#get_batteries_by_building'
get 'get_columns_by_battery/:battery_id', to: 'columns#get_columns_by_battery'
get 'get_elevators_by_column/:column_id', to: 'elevators#get_elevators_by_column'

get "home/login"
get "/" => "home#index", :as => "root"
post "/" , to: "home#create"
get "residential" => "home#residential"
get "commercial" => "home#commercial"
get "quote" => "home#quote"
get "transcription" => "home#transcription"
get "transcribe" => "home#transcribe"
post "transcribe" => "voice#transcribe"

post "getData" => "quote#getData"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
