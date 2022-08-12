class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  before_action :authenticate_user!

  def confirm
    # binding.pry
    @reservation = Reservation.new(reservation_params)
    session[:reservation] = @reservation
    # render :new if @reservaion.invalid?
  end

  def create
    @reservation = Reservation.new(session[:reservation])
    if @reservation.save
      redirect_to rooms_path, notice: "予約が完了しました"
    else
      render "confirm"
    end
  end

  private

  def reservation_params
    params.permit(:check_in_day, :check_out_day, :number_of_people).merge(user_id: current_user.id, room_id: params[:id])
  end
end
