Rails.application.routes.draw do
  devise_for :users
  
  # Rooms & bookings
  resources :rooms do
    resources :bookings, only: [:new, :create, :index]
  end

  # Contact messages
  resources :contact_messages, only: [:new, :create, :index, :show, :destroy]

  #About Us
  resources :abouts, only: [:index], path: "about_us"

  #FAQ
  resources :faqs, only: [:index], path: "FAQs"

  root "pages#home"
end