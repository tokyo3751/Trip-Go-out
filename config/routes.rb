Rails.application.routes.draw do

  get 'homes/top'
  get 'favorites/index'
  root to: "homes#top"

  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
}
  namespace :admins do
    resources :users, only: [:index, :show, :edit, :update, :destroy]
  end

  devise_for :users

  resources :posts do
    resource :favorites, only: [:create, :destroy]
    resources :replys, only:[:create, :destroy]
  end

  resources :users do
    resources :relationships, only: [:create, :destroy]
    member do
    get :favorites
   end
 end

 get "search" => "searches#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
