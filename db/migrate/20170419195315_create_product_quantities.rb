class CreateProductQuantities < ActiveRecord::Migration[5.0]
  def change
    create_table :product_quantities do |t|
      t.references :product, index: true
      t.references :order, index: true
      t.integer :quantity
      t.timestamps
    end
  end
end
