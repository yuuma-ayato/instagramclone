Rails.application.routes.draw do
  root 'pictures#index'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :favorites, only: [:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]
  get '/favorite_index_user', to: 'users#favorite_index'
  resources :pictures do
    collection do
      post :confirm
    end
  end
end
