class Cart < ActiveRecord::Base
  has_many :cart_items
  has_many :products, through: :cart_items
  def add(product_id, shopper_id, qty=1)
    item    = cart_items.find_by_cart_id_and_product_id(shopper_id, product_id)
    product = Product.find(product_id)

    if item.nil?
      ci = cart_items.create(product_id: product_id,
                             amount:     qty,
                             cart_id:    shopper_id,
                             price:      product.price)
    else  
      c = CartItem.find(item.id)
      c.amount = qty.to_i
      c.save
    end
  end
  def remove(product_id)
    ci = cart_items.find_by_id(product_id)

    if ci.amount > 1  
      ci.update_attribute(:amount, ci.amount - 1)
    else 
      CartItem.destroy(ci.id)
    end
    return ci
  end

  def total
    cart_items.inject(0) {|sum, n| n.price * n.amount + sum}
  end
end
