Rails.application.routes.draw do

  get 'homes/top'
  root to: "homes#top"

  resources :posts do
    resources :replys, only:[:create, :destroy]
  end
  resources :users
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
