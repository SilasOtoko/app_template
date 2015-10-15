Rails.application.routes.draw do
  root "pages#welcome"
  
  get '/log_in', to: 'sessions#new'
  post '/log_in', to: 'sessions#create'
  get '/register', to: 'users#new'
  get '/log_out', to: 'sessions#destroy'
  get '/dashboard', to: 'pages#dashboard'
  
  resources :users, only: [:new, :create, :edit, :show]
end
