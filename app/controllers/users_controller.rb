class UsersController < ApplicationController

  def index
   render json: @users = User.all
  end

  def show
   render json: @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    render html: @user.save
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  def user_params
    params.require(:user).permit(
      :username, :email, :password, :password_comfirmation
    )
  end

end
