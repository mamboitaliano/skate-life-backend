class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.create(
      skatepark_id: params[:skatepark_id],
      user_id: params[:id])

    @skatepark = Skatepark.find(params[:skatepark_id])
    @skatepark.increment!(:fav_count)

    render nothing: true
  end

  def attend
  	@favorite = Favorite.where(
  		skatepark_id: params[:skatepark_id],
  		user_id: params[:id]).first

  	if @favorite
  		@favorite.update_attributes(attending: true)
  	else
  		Favorite.create(
  			skatepark_id: params[:skatepark_id],
  			user_id: params[:id],
  			attending: true)
  	end

  	render nothing: true

  end


  def unattend
  	@favorite = Favorite.where(
  		skatepark_id: params[:skatepark_id],
  		user_id: params[:id]).first

 		@favorite.update_attributes(attending: false) if @favorite

 		render nothing: true
  end
end
