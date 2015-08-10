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
    p '*' * 100
    p params
    p '*' * 100
    @user = User.where(uid: params[:uid]).first

    # if @user
    #   render json: @user
    # else
    #   @new_user = User.new(
    #     uid: params[:uid],
    #     name: params[:name],
    #     email: params[:email])

    #   @new_user.save ? (render json: @new_user) : (render json: {error: 'internal-server-error'}, status: 500})
    # end
    save_or_render_error
  end




  private

    def save_or_render_error
      @new_user = User.new(
        uid: params[:uid],
        name: params[:name],
        email: params[:email])

      if @new_user.save
        render json: @new_user
      else
        # render json: {error: 'internal-server-error', status: 500})
        render json: {error: 'something went wrong with user'}
      end
    end



end
