Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only:[:new, :create, :update, :destroy]
  get '/users/:hash_id', to: 'users#show'
  get '/users/:hash_id/edit', to: 'users#edit'
  patch '/users/:hash_id/edit', to: 'users#update'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :posts
end
