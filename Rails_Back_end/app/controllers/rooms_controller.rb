class RoomsController < ApplicationController
  def index
  	@rooms = Room.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def delete
  end

  private
  def room_parmans
  	params.require(:room).permit(:name,:thumburl)
  end
end
