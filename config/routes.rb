Rails.application.routes.draw do

  root to: 'listen#index'

  get '/profile', to: 'admin/users#profile'

  get 'login', to: 'sessions#new'
  get 'signout', to: 'sessions#destroy'
  resources :sessions, only: [:create]
  
  resources :listen, only: [:index, :show]

  resources :broadcast, only: [:index, :show]

  namespace :admin do
    
    resources :channels, except: [:show]

    resources :users, except: [:show]
    
  end

end
