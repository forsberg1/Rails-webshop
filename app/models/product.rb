class Product < ActiveRecord::Base
  has_many :cart_items
  has_many :carts, through: :cart_items
  belongs_to :categorie
  def add(product_id, shopper_id, qty)
    items = cart_items.find_all_by_cart_id(shopper_id)
    product = Product.find(product_id)

    if items.size < 1
      ci = cart_items.create(product_id: product_id,
                             amount:     1,
                             cart_id:    shopper_id,
                             price:      product.price)
    else
      ci = items.first
      if qty.nil?
        ci.update_attribute(:amount, ci.amount + 1)
      else 
        ci.update_attribute(:amount, qty) 
      end
    end
    ci
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
