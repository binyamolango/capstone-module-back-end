Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :destroy]
      resources :doctors, only: [:index, :show, :create, :destroy]
      resources :reservations, only: [:index, :create, :show, :destroy]
    end
  end
end