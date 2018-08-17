class CreateCategoriesProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :categories_products do |t|
      t.references :product, index: true
      t.references :category, index: true
      t.timestamps
    end
  end
end
