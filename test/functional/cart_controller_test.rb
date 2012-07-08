require 'test_helper'

class CartControllerTest < ActionController::TestCase
  def test_adding
    assert_difference(CartItem, :count) do 
      post :add, :id => 4
    end
    assert_response :redirect 
    assert_redirected_to :controller => "product"
    assert_equal 1, Cart.find(@request.session[:cart_id]).cart_items.size
end
