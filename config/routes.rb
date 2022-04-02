Rails.application.routes.draw do
  # get 'user/:user_id/posts' => 'posts#index', as: 'user_posts'
  # get 'users/:user_id/posts/:id' => 'posts#show', as: 'user_post'
  # get 'users' => 'users#index', as: 'users'
  # get 'users/:id' => 'users#show', as: 'user'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  root 'users#index'
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create]
  end

  resources :posts do
    resources :comments, only: %i[create new]
    resources :likes, only: [:create]
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
