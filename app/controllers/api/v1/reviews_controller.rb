class Api::V1::ReviewsController < ApplicationController
  skip_before_action :authorized, only: [:index]

  def index
    @reviews = Review.all
    render json: @reviews
  end

  def create
    @review = Review.create(review_params)
    render json: @review
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description, :guest_id, :reservation_id)
  end
end
