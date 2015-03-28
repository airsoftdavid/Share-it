Rails.application.routes.draw do

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      get     '/users',     to: 'users#index'
      post    '/users',     to: 'users#create'
      get     '/users/:id', to: 'users#show'
      delete  '/users/:id', to: 'users#destroy'
    end
end
  root             'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'sessions/new'

  get 'signup' => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users
end