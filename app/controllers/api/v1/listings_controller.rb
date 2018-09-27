class Api::V1::ListingsController < ApplicationController
  skip_before_action :authorized, only: [:create, :index]

  def index
    @listings = Listing.all
    render json: @listings
  end

  def create
    @listing = Listing.create(listing_params)
    render json: @listing
  end

  private

  def listing_params
    params.permit(:name, :price, :address, :description, :host_id, :neighbourhood_id, {avatars: []})
  end
end
