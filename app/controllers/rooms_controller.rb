class RoomsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @rooms = Room.all

    # Keyword search
    if params[:query].present?
      @rooms = @rooms.where("name ILIKE ?", "%#{params[:query]}%")
    end

    # Guest count 
    if params[:guests].present?
      @rooms = @rooms.where("capacity >= ?", params[:guests].to_i)
    end

    # Availability
    if params[:check_in].present? && params[:check_out].present?
      check_in = Date.parse(params[:check_in])
      check_out = Date.parse(params[:check_out])

      # Find rooms that have overlapping bookings
      booked_room_ids = Booking.where("start_date < ? AND end_date > ?", check_out, check_in).pluck(:room_id)

      # Exclude those rooms
      @rooms = @rooms.where.not(id: booked_room_ids)
    end
  end

  def show
    set_room
  end

  private

  def room_params
    params.require(:room).permit(:name, :description, :price_per_night, :size, :beds, :capacity, :amenities)
  end

  def set_room
    @room = Room.find(params[:id])
  end
end