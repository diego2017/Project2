class CreateListItems < ActiveRecord::Migration[5.0]
  def change
    create_table :list_items do |t|
      t.integer :shopping_list_id
      t.integer :product_id
      t.integer :quantity

      t.timestamps
    end
  end
end
