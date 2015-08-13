class SkateparksController < ApplicationController

  def index
    @skateparks = Skatepark.all
    render json: @skateparks
  end

  def show
    @skatepark = Skatepark.find(params[:id])
    render json: @skatepark
  end

  def attendee_count
  	render json: User.where(current_park: params[:id]).count
  end


end
