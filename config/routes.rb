Doorsnwindows::Application.routes.draw do
  match '/about', to: 'static_pages#about', via: 'get'

  root to: 'static_pages#home'
end
