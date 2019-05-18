# frozen_string_literal: true

class CommentsController < ApplicationController

  def index
    @comments = Comment.includes(:user).all

    respond_to do |format|
      format.html
      format.json { render json: @comments }
    end
  end

  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @comment }
    end
  end

  def new
    @comment = Comment.new
    @users = User.all
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save

    respond_to do |format|
      if @comment.save(comment_params)
        format.html { redirect_to @comment, notice: "comment was successfully created." }
        format.json { render json: @comment }
      else
        format.html { render action: :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to comments_path
  end

  private

  def comment_params
    params.require(:comment).permit(
      :message, :user_id
    )
  end

end
