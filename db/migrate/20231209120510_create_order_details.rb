class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|

      t.references :item, foreign_key: true
      t.references :order, foreign_key: true

      t.integer :amount ,null: false
      t.integer :purchase_price ,null: false

      t.timestamps
    end
  end
end
