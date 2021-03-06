class CartController < ApplicationController
   def index
      @in_cart = CartItem.find_all_by_cart_id(session[:cart_id], include: [:product])
   end
   def checkout
    if user_signed_in?
      #Magic here
      @in_cart = CartItem.find_all_by_cart_id(session[:cart_id], include: [:product])
      @user    = User.find(current_user.id)
    else 
      redirect_to :controller => "user"
    end
      
   end
   def add
    #@product = Product.find(params[:id])
    if request.post?
      @item = @cart.add(params[:id], session[:cart_id], params[:qty])
      #flash[:cart_notice] = "Added <em>#{@item.product.name}</em>" 
      redirect_to :controller => "cart"
    else
     # render
    end
  end
  def remove
    #@product = Product.find(params[:id])
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
