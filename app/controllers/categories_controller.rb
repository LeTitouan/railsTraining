# frozen_string_literal: true

class CategoriesController < ApplicationController

  def index
    @categories = Categorie.all

    respond_to do |format|
      format.html
      format.json { render json: @categories }
    end
  end

  def show
    @categorie = Categorie.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @categorie }
    end
  end

  private

  def post_params
    params.require(:categorie).permit(
      :name,
    )
  end

end
