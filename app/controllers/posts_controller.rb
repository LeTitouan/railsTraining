# frozen_string_literal: true

class PostsController < ApplicationController

  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.includes(:user).all

    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @post }
    end
  end

  def new
    @post = Post.new
    @users = User.all
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save(post_params)
        format.html { redirect_to @post, notice: "post was successfully created." }
        format.json { render json: @post }
      else
        format.html { render action: :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @post.update(post_params)

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "post was successfully updated." }
        format.json { render json: @post }
      else
        format.html { render action: :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.json { render json: @post }
    end
  end

  def destroy
    @post.destroy

    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(
      :title, :content, :opened, :user_id
    )
  end

end
