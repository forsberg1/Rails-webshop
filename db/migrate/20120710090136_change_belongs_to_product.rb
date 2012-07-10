class ChangeBelongsToProduct < ActiveRecord::Migration
 def change
    rename_column :products, :belongs_to, :categorie_id
  end
end
