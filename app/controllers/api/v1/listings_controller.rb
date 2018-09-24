class Api::V1::ListingsController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def index
    byebug
    @listings = Listing.all
    render json: @listings
  end

  def create
    @listing = Listing.create(listing_params)
    render json: @listing
  end

  private

  def listing_params
    params.require(:listing).permit(:name, :price, :address, :description, :host_id, :neighbourhood_id)
  end
end
