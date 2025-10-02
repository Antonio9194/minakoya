class BookingsController < ApplicationController
  before_action :set_room, only: %i[create]
  def index
  end

  def show
  end

  def create
    dates_range = params[:booking][:start_date].split(" to ")
    @booking = Booking.new(
      start_date: dates_range.first,
      end_date: dates_range.last,
      total_price: @room.price_per_night * (dates_range.last.to_date - dates_range.first.to_date).to_i,
      user_id: params[:booking][:user_id],
      room_id: @room.id
    )
    if @booking.save
      redirect_to guest_path(User.find(@booking.user_id)), notice: "Booking made successfully!"
      # Should redirect to payment page instead but I have it redirect to guest show page for now.
    else
      render "rooms/show", status: :unprocessable_entity, notice: "Failed to make a booking. You dumb shiet hehe!"
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

end
