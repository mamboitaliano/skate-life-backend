class SkateparksController < ApplicationController

  def index
    @skateparks = Skatepark.all
    render json: @skateparks
  end


end
