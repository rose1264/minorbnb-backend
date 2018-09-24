class Api::V1::NeighbourhoodsController < ApplicationController
  skip_before_action :authorized, only: [:index]

  def index
    @neighbourhoods = Neighbourhood.all
    render json: @neighbourhoods
  end
end
