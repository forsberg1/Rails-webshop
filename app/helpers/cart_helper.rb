module CartHelper
  def total_sum(object)
    object.inject(0) {|sum, n| n.price * n.amount + sum}
  end
  def total_products(object)
    object.size
  end
end
