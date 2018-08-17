class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.float :total_price
      t.integer :ip
      t.string :express_token
      t.integer :express_payer_id
      t.boolean :payed
      t.timestamps
    end
  end
end
