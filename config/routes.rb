Rails.application.routes.draw do
  root 'pages#home'
  resources :products, only: [:index]
  get "orders/history" => "orders#history", as: "order_history"
  resources :orders, only: [:new, :create, :show]
  namespace :admin do
    get "dashboard" => "dashboard#index", as: "dashboard"
    post "products" => "dashboard#create", as: "admin_dashboard_create"
    delete "products/:id" => "dashboard#destroy", as: "admin_dashboard_destroy"
  end
end
