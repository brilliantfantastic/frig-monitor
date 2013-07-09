FrigMonitor::Application.routes.draw do
  resources :users, only: [:new, :create]
  resources :sessions, only: [:create]

  match '/signin' => 'sessions#new'
  match '/signout' => 'sessions#destroy'

  resources :friges, only: [:new, :create, :show] do
    resources :beers, only: [:new, :create, :show]
  end

  root :to => 'beverages#index'
end
