FrigMonitor::Application.routes.draw do
  resources :beers, only: [:new, :create, :show]
  resources :users, only: [:new, :create]
  resources :sessions, only: [:create]

  match '/signin' => 'sessions#new'

  root :to => 'beverages#index'
end
