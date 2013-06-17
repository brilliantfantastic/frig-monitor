FrigMonitor::Application.routes.draw do
  resources :beers, only: [:new, :create, :show]
  root :to => 'beverages#index'
end
