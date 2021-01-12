Rails.application.routes.draw do
  
  resources :line_items, except: [:index]
  resources :submissions, only:[:index]
  resources :menus, only:[:index, :show]
  resources :menu_items
  resources :orders, except: [:new, :show]
  root to: 'pages#home'
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations'}
  resources :carts  do
    resource :orders, only: [:new, :show]
  end

 


  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
