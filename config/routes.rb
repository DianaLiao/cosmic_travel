Rails.application.routes.draw do
  resources :missions, only: [:show, :new, :create]
  resources :scientists
  # resources :planets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
