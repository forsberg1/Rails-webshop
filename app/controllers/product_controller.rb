class ProductController < ApplicationController

  def index
    @product = Product.find(:all)
  end

  def show
     @product = Product.find(params[:id])
  end

  def remove
    @cart = CartItem.find(params[:id])
    if request.xhr?
      @item = @cart.remove(params[:id])
      flash.now[:cart_notice] = "Removed 1 <em>#{@item.product.name}</em>"
      render :action => "remove_with_ajax" 
    elsif request.post?
      @item = @cart.remove(params[:id])
      flash[:cart_notice] = "Removed 1 <em>#{@item.product.name}</em>" 
      redirect_to :controller => "cart"
    else
      #render
    end
  end
  
end
