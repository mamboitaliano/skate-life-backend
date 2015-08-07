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
    render json: @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render nothing: true
  end



end