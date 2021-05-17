Rails.application.routes.draw do
  devise_for :users
  resources :relationships, only: [:create, :destroy]
  root to: 'lives#index'
  resources :lives, only: [:index, :new, :create, :show] do
    collection do
      get 'search'
    end
    resources :likes, only: [:create, :destroy]
    resources :yells, only: [:index, :create]
  end

  get '/private', to:'lives#private'
  get '/family', to:'lives#family'
  get '/work', to:'lives#work'
  get '/school', to:'lives#school'
  get '/other', to:'lives#other'
  get '/help', to:'lives#help'
  get '/about', to:'lives#about'
  get '/caution', to:'lives#caution'

  resources :users, only: :show
end
