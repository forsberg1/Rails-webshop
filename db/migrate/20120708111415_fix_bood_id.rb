class FixBoodId < ActiveRecord::Migration
  def change
    rename_column :cart_items, :book_id, :product_id
  end
end
