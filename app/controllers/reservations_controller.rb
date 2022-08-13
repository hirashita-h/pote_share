class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  before_action :authenticate_user!

  def confirm
    # binding.pry
    @reservation = Reservation.new(reservation_params)
    session[:reservation] = @reservation
    @stay_days = ((@reservation.check_out_day - @reservation.check_in_day) / 24 / 60 / 60).to_i
    @number_of_people = @reservation.number_of_people
    @room = Room.find(@reservation.room_id)
    @price = @room.price
    @total_price = @stay_days * @number_of_people * @price
    # render :new if @reservaion.invalid?
  end

  def create
    @reservation = Reservation.new(session[:reservation])
    if @reservation.save
      redirect_to room_path(@reservation.room_id), notice: "予約が完了しました"
    else
      render "confirm"
    end
  end

  private

  def reservation_params
    params.permit(:check_in_day, :check_out_day, :number_of_people).merge(user_id: current_user.id, room_id: params[:id])
  end
end
