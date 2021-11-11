Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :destroy, :update, :show]

  resources :users do
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
    resources :likes, only: [:index]
  end

  resources :artworks, only: [:create, :destroy, :index, :update, :show]

  resources :artworks do
    resources :comments, only: [:index]
    resources :likes, only: [:index]
  end

  resources :artwork_shares, only: [:create, :destroy]

  resources :comments, only: [:create, :destroy, :index]

  resources :comments do
    resources :likes, only: [:index]
  end

  resources :likes, only: [:create, :destroy, :index]

end
