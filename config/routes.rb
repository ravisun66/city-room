Rails.application.routes.draw do
  get 'sessions/new'

	get 'welcome/home'
  root 'welcome#home'
  get  '/signup',  to: 'users#new'
  resources :users
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/get_available_rooms/:check_in_date/:check_out_date(/:room_type)', to: 'welcome#get_rooms', as: 'get_rooms'
  get    '/booking',   to: 'welcome#new', :as => :bookings
  post   '/booking',   to: 'welcome#booking'
end
