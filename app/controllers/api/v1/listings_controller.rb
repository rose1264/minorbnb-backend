class Api::V1::ListingsController < ApplicationController
  skip_before_action :authorized, only: [:create, :index]

  def index
    @listings = Listing.page(params[:page] || 1).per(6)
    render json: @listings
  end

  def create
    @listing = Listing.create(listing_params)
    render json: @listing
  end

  private

  def listing_params
    params.permit(:name, :price, :address, :description, :host_id, :neighbourhood_id, {avatars: []}, :lat, :lng)
  end
end
