Doorsnwindows::Application.routes.draw do
  get "activities/index"
  resources :leads
	resources :users
  resources :activities
	resources :sessions, only: [:new, :create, :destroy]

  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

	match '/about',   to: 'static_pages#about',   via: 'get'

  root to: 'static_pages#home'

  #sidekiq
  # require 'sidekiq/web'
  # mount Sidekiq::Web => '/sidekiq'
end
