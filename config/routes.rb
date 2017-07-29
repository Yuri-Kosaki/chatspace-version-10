Rails.application.routes.draw do
  devise_for :users
  root to: "groups#index"
  resources :groups, except: [:show] do
    resources :messages, except: [:destroy]
  end

  resources :users, only: [:edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
