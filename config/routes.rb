Rails.application.routes.draw do
  root 'tasks#index'
  get '/search', to: "tasks#search", as: "search_tasks"
  resources :tasks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
