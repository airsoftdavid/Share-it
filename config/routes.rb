Rails.application.routes.draw do
  resources :users
  resources :admins

  root                    to: 'sessions#new'

  match '/signup',        to: 'admins#new',             via: :get
  match '/adminsignin',   to: 'sessions#admin_signin',  via: :get
  match '/usersignin',    to: 'sessions#user_signin',   via: :get
  match '/adminsignin',   to: 'sessions#admin_create',  via: :post
  match '/usersignin',    to: 'sessions#user_create',   via: :post
  match '/admins.json',   to: 'admins#index.json',      via: :get
  match '/users.json',    to: 'users#index.json',       via: :get
  match '/signin',        to: 'sessions#new',           via: :post
  match '/signin',        to: 'sessions#new',           via: :get
  match '/signout',       to: 'sessions#destroy',       via: :delete

  match '/help',          to: 'static_pages#help',      via: :get
  match '/about',         to: 'static_pages#about',     via: :get
  match '/contact',       to: 'static_pages#contact',   via: :get
  match '/rooms',         to: 'admins#show',            via: :get
  match '/home',          to: 'static_pages#home',      via: :get

end
