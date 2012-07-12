class Categorie < ActiveRecord::Base
  has_many :products
   def to_s
    categorie_name
  end
end
