class ProductController < ActionController::Base
  def index
    @product = Product.find(:all)
  end

  def show
     @product = Product.find(params[:id])
  end
end
