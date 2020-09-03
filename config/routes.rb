Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get 'welcome/index'
  post '/search', to: 'users#search'
  post '/users/:user_slug/posts/:post_id/likes', to: 'posts#add_like', as: 'likes_route'
  post '/users/:user_slug/wallposts/:wallpost_id/likes', to: 'wallposts#add_like', as: 'wallpost_likes_route'

  resources :users, param: :slug do
    resources :posts do
      resources :postcomments
    end
    resources :wallposts do
      resources :wallpostcomments
    end
  end

  root 'welcome#index'
end
