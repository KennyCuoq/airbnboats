Rails.application.routes.draw do
  get 'boats/index'
  get 'boats/show'
  get 'boats/new'
  get 'boats/create'
  get 'boats/destroy'
  devise_for :users
  root to: 'pages#home'
  resources :boats, only: [:index, :show, :new, :create, :delete] do
    resources :bookings, only: [:show, :create, :edit, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
