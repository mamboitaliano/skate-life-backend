class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new(
      skatepark_id: params[:skatepark_id],
      user_id: params[:user_id])

    @skatepark = Skatepark.find(params[:skatepark_id])
    @skatepark.increment!(:fav_count)

    render nothing: true
  end

end
