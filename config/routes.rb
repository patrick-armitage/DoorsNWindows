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

  match '/about_us/story',      to: 'static_pages#about_story',    via: 'get'
  match '/about_us/services',   to: 'static_pages#about_services', via: 'get'
  match '/about_us/guarantee',  to: 'static_pages#about_guarantee',via: 'get'
  match '/products/windows',    to: 'static_pages#products_windows',via: 'get'
  match '/products/doors',      to: 'static_pages#products_doors', via: 'get'
  match '/products/hardware',   to: 'static_pages#products_hardware',via: 'get'
  match '/manufacturers/choosing',to: 'static_pages#mfg_choose',   via: 'get'
  match '/info/how',            to: 'static_pages#info_how',       via: 'get'
  match '/info/faqs',           to: 'static_pages#info_faqs',      via: 'get'
  match '/info/installs',       to: 'static_pages#info_installs',  via: 'get'
  match '/info/mfgs',           to: 'static_pages#info_mfgs',      via: 'get'
  match '/info/historic',       to: 'static_pages#info_historic',  via: 'get'

  match '/contact/email',       to: 'static_pages#contact_email',  via: 'get'
  match '/contact/info',        to: 'static_pages#contact_info',   via: 'get'

  match '/savings/doors',       to: 'landing_leads#doors',    via: 'get'
  match '/savings/windows',     to: 'landing_leads#windows',  via: 'get'

  root to: 'static_pages#home'

  #sidekiq
  # require 'sidekiq/web'
  # mount Sidekiq::Web => '/sidekiq'
end
