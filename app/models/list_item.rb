class ListItem < ApplicationRecord
  belongs_to :shopping_list
  has_one :product
  validates_uniqueness_of :product_id, scope: :shopping_list_id
end
