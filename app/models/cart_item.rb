class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product 
  def total
    cart.inject(0) {|sum, n| n.price * n.amount + sum}
  end
end
