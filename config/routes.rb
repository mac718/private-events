Rails.application.routes.draw do
  root 'sessions#new'
  resources :users
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'
  resources :events do 
    resources :event_attendances
    resources :invitations
  end
end
