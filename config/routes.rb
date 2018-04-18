Rails.application.routes.draw do
  root 'sessions#new'
  resources :users, only: [:new, :create, :show]
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'
  resources :events, only: [:new, :create, :show, :index] do 
    resources :event_attendances, only: [:create]
    resources :invitations , only: [:create]
    resources :invitation_requests, only: [:create]
  end
end
