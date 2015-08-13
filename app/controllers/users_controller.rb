class UsersController < ApplicationController

  def create
    @user = User.new(name: params[:name], email: params[:email])

    if @user.save
      render json: @user
    end
  end

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: {user: @user, skateparks: @user.skateparks}
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render nothing: true
  end

  def favorites
    @user = User.find(params[:id])
    render json: @user.skateparks
  end

  def authenticate
    @user = User.where(uid: params[:google][:id]).first

    p '*' * 100
    p @user
    p '*' * 100
    
    if @user
      render json: @user
    else
      save_user
    end
  end

  def attend_park
    @user = User.find(params[:id])
    @skatepark = Skatepark.find(params[:skatepark_id])

    @user.update_attributes(current_park: @skatepark.id)
    # render nothing: true
    render json: @skatepark
  end

  def leave_park
    # FUQBOI
    @user = User.find(params[:id]).update_attributes(current_park: nil)
  end




  private

    def save_user

      @new_user = User.new(
        uid: params[:google][:id],
        name: params[:google][:displayName])

      if @new_user.save
        render json: @new_user
      else
        render json: {error: 'something went wrong with user'}
      end
    end



end
