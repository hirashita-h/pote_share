class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def confirm
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    render :new if @room.invalid?
  end

  def create
    @room = Room.new(room_params)
    if params[:back] || !@room.save
      render :new
    else
      redirect_to rooms_url
    end
  end

  def index
  end

  def show
  end

  private
  def room_params
    params.require(:room).permit(:name, :introduction, :price, :address, :image, :image_cache, :user_id)
  end
end
