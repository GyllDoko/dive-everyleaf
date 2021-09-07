Rails.application.routes.draw do
  root to: "sessions#new"
  get '/search', to: "tasks#search", as: "search_tasks"
  resources :tasks
  
  resources :sessions, only: [:new, :create, :destroy]
  namespace :admin do
    resources :users, except: %i[:show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
