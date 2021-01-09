Rails.application.routes.draw do
  
  resources :submissions, only:[:index]
  resources :menus, only:[:index, :show]
  resources :menu_items
  resources :line_items
  resources :orders
  resources :carts
  scope path: '/carts/alt', controller: :carts do
    get 'carts-alt', to: 'carts#alt_show'
  end
  root to: 'pages#home'
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
