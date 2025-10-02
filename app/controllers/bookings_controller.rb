class BookingsController < ApplicationController
  before_action :set_room
  def index
  end

  def show
  end

  def create
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

end
