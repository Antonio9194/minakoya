class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:new, :create]

  def new
    # Logic to display the payment form
  end

  def create
    # Logic to create a payment
  end

  private

  def set_booking
    @booking = current_user.bookings.find(params[:id])
  end
end
