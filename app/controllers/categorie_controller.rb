class CategorieController < ApplicationController
  def index
    @categories = Categorie.find(:all)
  end
  def show
    @category = Categorie.find(params[:id])
  end
end
