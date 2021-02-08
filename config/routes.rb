Rails.application.routes.draw do
  root to: 'main#index'
  
  get '/about', to: 'about#index'
  
  get '/sign_up', to: 'registrations#new'
  post '/sign_up', to: 'registrations#create'
  
  delete '/logout', to: 'sessions#destroy'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/password', to: 'passwords#edit', as: :edit_password
  patch '/password', to: 'passwords#update'

  get '/password/reset', to: 'password_resets#new'
  post '/password/reset', to: 'password_resets#create'
  get '/password/reset/edit', to: 'password_resets#edit'
  patch '/password/reset/edit', to: 'password_resets#update'

  get 'auth/twitter/callback', to: "omniauth_callbacks#twitter"

  post 'auth/twitter', as: 'connect_twitter_account'

  resources :twitter_accounts
  resources :tweets
end
