class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def create
    room = Room.new(room_params)
    room.user_id = current_user.id
    if room.save
      #flash[:notice] = ""
      redirect_to room_path(room)
    else
      render "new"
    end
  end

  def index
    @rooms = Room.where("address like ?", "%#{params[:address]}%")
    @rooms = Room.where("name like ? or introduction like ? or address like ?", "%#{params[:content]}%", "%#{params[:content]}%", "%#{params[:content]}%")
  end

  def show
    session.delete(:reservation)
    @reservaion = Reservation.new
  end

  private

  def room_params
    params.require(:room).permit(:name, :introduction, :price, :address, :image, :image_cache)
  end
end
