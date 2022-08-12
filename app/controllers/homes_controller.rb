class HomesController < ApplicationController
  def top
    @rooms = @rooms.where("address LIKE ?", "%#{params[:search]}%") if params[:search].present?  #この行を追記
  end
end
