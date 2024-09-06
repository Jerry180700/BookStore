Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  root to: "books#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :books
  get 'books_buy/:id/buy', to: 'orders#buy_book', as: :buy_book
  get 'confirmar_orders', to: 'orders#confirmar_orders', as: :confirmar_orders

  # get "home", to:"pages#home"
  resources :orders
  # Delete
  delete "orders/:id", to: "orders#destroy"
end
