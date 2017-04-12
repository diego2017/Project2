class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :email, :name
  validates_format_of  :email, :with => /.+@.+\..+/i
  has_many :shopping_lists
  has_many :list_items, through: :shopping_lists
  has_many :products, through: :list_items
end
