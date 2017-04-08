class User < ApplicationRecord
  has_many :shopping_lists
  validates_uniqueness_of :email
  has_secure_password
  validates_format_of  :email, :with => /.+@.+\..+/i
end
