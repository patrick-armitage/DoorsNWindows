Doorsnwindows::Application.routes.draw do

  resources :leads
  resources :landing_leads
	resources :users
  resources :activities
	resources :sessions, only: [:new, :create, :destroy]
  resources :inquiries, only: [:new, :create]

  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

	match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'

  match '/savings/doors',   to: 'landing_leads#doors',    via: 'get'
  match '/savings/windows', to: 'landing_leads#windows',  via: 'get'

  root to: 'static_pages#home'

  #sidekiq
  # require 'sidekiq/web'
  # mount Sidekiq::Web => '/sidekiq'
end
