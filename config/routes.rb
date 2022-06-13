Rails.application.routes.draw do

  get 'homes/top'
  get 'favorites/index'
  root to: "homes#top"
  devise_for :users

  resources :posts do
    resource :favorites, only: [:create, :destroy]
    resources :replys, only:[:create, :destroy]
  end
  
  resources :users do
    member do
    get :favorites
   end
 end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
