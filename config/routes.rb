FrigMonitor::Application.routes.draw do
  resources :beers, only: [:new, :create, :show]
  resources :users, only: [:new, :create]
  root :to => 'beverages#index'
end
