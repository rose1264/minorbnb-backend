class Api::V1::NeighbourhoodsController < ApplicationController
  def index
    @neighbourhoods = Neighbourhood.all
    render json: @neighbourhoods
  end
end
