Rails.application.routes.draw do
  resources :users
  resources :admins

#   get 'sessions/new'
#   root             'static_pages#home'
#   get 'help'    => 'static_pages#help'
#   get 'about'   => 'static_pages#about'
#   get 'contact' => 'static_pages#contact'
#   get 'signup'  => 'admins#new'
#   get    'login'   => 'sessions#new'
#   post   'login'   => 'sessions#create'
#   delete 'logout'  => 'sessions#destroy'
# end


  # root to: 'static_pages#home'
  root               to: 'sessions#new'

  match '/signup',   to: 'admins#new',            via: :get
  match '/signin',   to: 'sessions#new',          via: :get
  match '/signin',   to: 'sessions#create',       via: :post
  match '/signout',  to: 'sessions#destroy',      via: :delete

  match '/help',     to: 'static_pages#help',      via: :get
  match '/about',    to: 'static_pages#about',     via: :get
  match '/contact',  to: 'static_pages#contact',   via: :get
  match '/rooms',    to: 'admins#show',            via: :get
  match '/home',     to: 'static_pages#home',      via: :get
  
end