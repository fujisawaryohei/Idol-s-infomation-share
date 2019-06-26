Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only:[:new, :create, :update, :destroy]
  get '/users/result', to: 'users#user_result'
  get '/users/:hash_id', to: 'users#show'
  get '/users/:hash_id/edit', to: 'users#edit'
  patch '/users/:hash_id/edit', to: 'users#update'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :posts, only: [:index, :new, :create]
  get '/posts/:hash_id', to: 'posts#show'
  patch '/posts/:hash_id', to: 'posts#update'
  delete '/posts/:hash_id', to: 'posts#destroy'

  resources :threaders, only: [:index, :new, :create, :destroy]
  get '/threaders/:hash_id', to: 'threaders#show'

  post '/threaders/:id/threadcomment', to: 'threadcomments#create'
  delete '/threaders/:id/threadcomment/:hash_id', to: 'threadcomments#destroy'
end
