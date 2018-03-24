Rails.application.routes.draw do
  get 'invitations/create'

  get 'invitations/destroy'

  root 'sessions#new'
  resources :users
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  resources :events do 
    resources :event_attendances
    resources :invitations
  end
end
