class AddRowsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :f_adress, :string
    add_column :users, :f_postnumber, :string
    add_column :users, :f_county, :string
    add_column :users, :l_adress, :string
    add_column :users, :l_postnumber, :integer
    add_column :users, :l_county, :string
    add_column :users, :name, :string
    add_column :users, :aftername, :string
    add_column :users, :phone, :string
  end
end
