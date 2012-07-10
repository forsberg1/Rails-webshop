class CategorieController < ApplicationController
  def index
    @categorie = Categorie.find(:all)
  end
end
