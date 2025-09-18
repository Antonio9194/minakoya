Rails.application.routes.draw do
  devise_for :users

  # Rooms & bookings (guest side)
  resources :rooms, only: [:index, :show] do
    resources :bookings, only: [:new, :create]
  end

  #Guests' booking
  resources :guests, only: [:show] do
    resources :bookings, only: [:index, :show]
  end


  # Admin only
  namespace :admin do
    resources :rooms
    resources :bookings, only: [:index, :show]
    resources :contact_messages, only: [:index, :show, :destroy]
  end

  # Contact messages (guest side)
  resources :contact_messages, only: [:new, :create]

  get "about_us", to: "pages#about_us"
  get "faqs", to: "pages#faqs"

  root "pages#home"
end