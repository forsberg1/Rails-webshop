class CartController < ApplicationController
    before_filter :initialize_cart, :only => [:index, :show]
  private
  def initialize_cart
    # do the magic
  end
  def add
    @product = Product.find(params[:id])

    if request.post?
      @item = @cart.add(params[:id])
      flash[:cart_notice] = "Added <em>#{@item.product.title}</em>" 
      redirect_to :controller => "product"
    else
      render
    end
  end
end
