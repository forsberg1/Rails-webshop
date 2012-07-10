class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string   :categorie_name
      t.text     :description
      t.timestamps
    end
  end
end
