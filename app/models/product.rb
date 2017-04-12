class Product < ApplicationRecord
  belongs_to :category
  has_many :list_items

  def full_img_path
    '/assets/' + img_src
  end
end
