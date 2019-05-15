# frozen_string_literal: true

class UsersController < ApplicationController

  def index
    @users = User.all

    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
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
