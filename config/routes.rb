Rails.application.routes.draw do
	
  devise_for :users

  resources :users, only: [:show, :index]

  resources :friendships, only: [:create, :destroy] do
  	member do
  		put :accept
  	end
  end

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
