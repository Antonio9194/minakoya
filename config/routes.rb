Rails.application.routes.draw do
  devise_for :users

  # Rooms & bookings (guest side)
  resources :rooms, only: [:index, :show] do
    resources :bookings, only: [:new, :create]
  end

  #Guests's booking
  resources :guests do
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

  # About Us
  resources :abouts, only: [:index], path: "about_us"

  # FAQ
  resources :faqs, only: [:index], path: "faqs"

  root "pages#home"
end