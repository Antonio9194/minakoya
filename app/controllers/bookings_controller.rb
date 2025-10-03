class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_room, only: [:create]
  def index
  end

  def show
  end

  def create
    unless current_user
      redirect_to new_user_session_path, alert: "You must be signed in to make a booking!"
      return
    end

    if params[:booking][:start_date].blank?
      redirect_to room_path(@room), alert: "Please select a date before booking"
      return
    end
    
    dates_range = params[:booking][:start_date].split(" to ")
    @booking = Booking.new(
      start_date: dates_range.first,
      end_date: dates_range.last,
      total_price: @room.price_per_night * (dates_range.last.to_date - dates_range.first.to_date).to_i,
      user: current_user,
      room: @room
    )
    if @booking.save
      redirect_to guest_path(User.find(@booking.user_id)), notice: "Booking made successfully!"
      # Should redirect to payment page instead but I have it redirect to guest show page for now.
    else
      render "rooms/show", status: :unprocessable_entity, notice: "Failed to make a booking, try again!"
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

end
