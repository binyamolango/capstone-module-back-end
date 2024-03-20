class Api::V1::ReservationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @reservations = Reservation.includes(:doctor).all
    render json: @reservations.to_json(include: :doctor)
  end

  def show
    @reservation = Reservation.includes(:doctor).find(params[:id])
    render json: @reservation.to_json(include: :doctor)
  end

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    render json: { message: 'reservation deleted successfully.' }
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date_of_reservation, :user_id, :doctor_id)
  end
end
