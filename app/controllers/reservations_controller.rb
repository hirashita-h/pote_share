class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  before_action :authenticate_user!

  def create
    reservaion = reservaion.new(reservaion_params)
    reservaion.user_id = current_user.id
    reservaion.room_id = params[:id]
    if reservaion.save
      #flash[:notice] = ""
      redirect_to reservaion
    else
      render "new"
    end
  end

  def show
  end


    private
      def reservation_params
        params.require(:reservation).permit(:check_in_day, :check_out_day, :number_of_people)
      end
end
