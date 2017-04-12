class Product < ApplicationRecord
  include ActionView::Helpers
  belongs_to :category
  has_many :list_items

  def full_url
    asset_path img_src
  end
end
