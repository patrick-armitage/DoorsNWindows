Doorsnwindows::Application.routes.draw do
  resources :leads
	resources :users
	resources :sessions, only: [:new, :create, :destroy]

  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

	match '/about',   to: 'static_pages#about',   via: 'get'

  root to: 'static_pages#home'
end
