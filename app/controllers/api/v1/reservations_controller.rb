class Api::V1::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    render json: @reservations
  end

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    render json: @reservation
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    render json: { message: 'reservation deleted successfully.' }
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date_of_reservation)
  end
end
