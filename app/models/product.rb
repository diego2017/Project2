class Product < ApplicationRecord
  belongs_to :category
  has_many :list_items
end
