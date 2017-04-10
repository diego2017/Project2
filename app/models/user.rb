class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :email, :name
  validates_format_of  :email, :with => /.+@.+\..+/i
  has_many :shopping_lists
end
