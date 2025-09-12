Rails.application.routes.draw do
  devise_for :users
  
  # Rooms & bookings
  resources :rooms do
    resources :bookings, only: [:new, :create, :index]
  end

  # Contact messages
  resources :contact_messages, only: [:new, :create, :index, :show, :destroy]

  # Static pages
  get "about", to: "pages#about"
  get "faq", to: "pages#faq"
  get "contact", to: "contact_messages#new"

  root "pages#home"
end