class RoomsController < ApplicationController
  def index
    @rooms = Room.all
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
