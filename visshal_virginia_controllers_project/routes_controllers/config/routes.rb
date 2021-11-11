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

  resources :artworks do
    member do
      post :favorite
      post :remove_favorite
    end
  end

  resources :artwork_shares, only: [:create, :destroy]

  resources :artwork_shares do
    member do
      post :favorite 
      post :remove_favorite
    end
  end

  resources :comments, only: [:create, :destroy, :index]

  resources :comments do
    resources :likes, only: [:index]
  end

  resources :likes, only: [:create, :destroy, :index]

  resources :collections, only:[:create, :destroy, :index, :update, :show]

  resources :collections do
    resources :artworks do
      resources :collection_assignments, only: [:create]
    end
  end

  resources :collection_assignments, only: [:destroy]

end
