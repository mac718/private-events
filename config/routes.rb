Rails.application.routes.draw do
  resources :users
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  resources :events do 
    resources :event_attendances
  end
end
