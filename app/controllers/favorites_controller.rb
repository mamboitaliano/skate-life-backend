class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.create(
      skatepark_id: params[:skatepark_id],
      user_id: params[:id])

    @skatepark = Skatepark.find(params[:skatepark_id])
    @skatepark.increment!(:fav_count)

    render nothing: true
  end

end
