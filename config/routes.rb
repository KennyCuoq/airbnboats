Rails.application.routes.draw do
  get 'dashboard/user_profile'
  devise_for :users
  root to: 'boats#index'
  get 'dashboard', to: 'dashboard#user_profile'
  resources :boats, only: [:index, :show, :new, :create, :destroy] do
    resources :bookings, only: [:show, :create, :edit, :update]
  end

  get 'test', to: 'pages#test'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end



