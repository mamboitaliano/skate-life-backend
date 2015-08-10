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
    # render json: @user
    render json: {user: @user, skateparks: @user.skateparks}
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render nothing: true
  end

  # def favorites
  #   @user = User.find(params[:id])
  #   render json: @user.skateparks
  # end

  def authenticate
    @user = User.where(uid: params[:google][:uid]).first

    if @user
      render json: @user
    else
      save_user
    end
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
