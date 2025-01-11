Rails.application.routes.draw do
  root 'pages#home'
  resources :products, only: [:index]
  get "orders/history" => "orders#history", as: "order_history"
  resources :orders, only: [:new, :create, :show]
  namespace :admin do
    get 'login' => 'sessions#new'
    post 'login' => 'sessions#create'
    delete 'logout' => "sessions#destroy"

    root "dashboard#index"
    get "dashboard" => "dashboard#index", as: "dashboard"
    post "products" => "dashboard#create", as: "dashboard_create"
    delete "products/:id" => "dashboard#destroy", as: "dashboard_destroy"
  end
end
