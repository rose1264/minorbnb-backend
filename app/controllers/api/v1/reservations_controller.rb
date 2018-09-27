class Api::V1::ReservationsController < ApplicationController
  skip_before_action :authorized, only: [:index, :create]

  def index
    @reservations = Reservation.all
    render json: @reservations
  end

  def create
    @reservation = Reservation.create(reservation_params)
    render json: @reservation
  end

  private

  def reservation_params
    params.permit(:check_in, :check_out, :guest_number, :guest_id, :listing_id, :file)
  end
end
