class UsersController < ApplicationController
  protect_from_forgery
  skip_before_action :verify_authenticity_token

  def index
    render json:  @users = User.all
  end

  def show
    render json: @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.save
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  def user_params
    params.require(:user).permit(
      :username, :email, :encrypted_password
    )
  end

end
