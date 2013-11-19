Doorsnwindows::Application.routes.draw do
	resources :users

  match '/about', to: 'static_pages#about', via: 'get'

  root to: 'static_pages#home'
end
