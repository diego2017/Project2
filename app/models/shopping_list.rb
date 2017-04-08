class ShoppingList < ApplicationRecord
  belongs_to :user
  has_many :list_items
  has_many :products, through: :list_items
end
