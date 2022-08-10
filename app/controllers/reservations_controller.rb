class ReservationsController < ApplicationController
  before_action :authenticate_user!
  def confirm
    @reservation = Reservation.new(reservation_params)
    binding.pry
    render :new if @reservaion.invalid?
  end

  def create
    reservaion = Reservaion.new(reservaion_params)
    reservaion.user_id = current_user.id
    reservaion.room_id = params[:id]
    binding.pry
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
        params.permit(:check_in_day, :check_out_day, :number_of_people)
      end
end
