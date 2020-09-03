Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get 'welcome/index'

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
