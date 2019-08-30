Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :superheroes, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: :create
  end

  resources :users, only: [:index, :show, :new, :create]

  if Rails.env.development?
    get 'kitchensink', to: 'pages#kitchensink'
    get 'kitchensinkgael', to: 'pages#kitchensinkgael'
  end
end
