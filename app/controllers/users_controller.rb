# frozen_string_literal: true

class UsersController < ApplicationController

  def home; end

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

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render json: @user }
      else
        format.html { render action: :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @user = User.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def user_params
    params.require(:user).permit(
      :username, :email, :password, :password_comfirmation
    )
  end

end
