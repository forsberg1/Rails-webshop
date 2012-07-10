class AddRowsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :belongs_to, :integer
  end
end
