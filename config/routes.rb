FrigMonitor::Application.routes.draw do
  resources :users, only: [:create]
  match '/signup' => 'users#new'

  resources :sessions, only: [:create]
  match '/signin' => 'sessions#new'
  match '/signout' => 'sessions#destroy'

  resources :friges, only: [:new, :create, :show] do
    resources :beers, only: [:new, :create, :show]
  end

  match '/kitchen' => 'friges#index'

  root :to => redirect('/signup')
end
