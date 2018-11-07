Rails.application.routes.draw do
  root to: 'home#index'
  resources :boats, only: [:index, :show, :new, :create, :delete] do
    resources :bookings, only: [:show, :create, :edit, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
