Veterinary::Application.routes.draw do

  resources :appointments, only: [:new, :create, :show]
  resources :pets, only: [:new, :create]

  get "doctors/index"

end
