class Product < ApplicationRecord
  belongs_to_many :list_items
end
