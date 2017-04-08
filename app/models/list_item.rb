class ListItem < ApplicationRecord
  belongs_to :shopping_list
  belongs_to :product
  validates_uniqueness_of :product_id, scope: :shopping_list_id
end
