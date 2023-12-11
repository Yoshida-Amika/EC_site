class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
    
      t.references :customer, foreign_key: true
      
      t.integer :pay_method ,null: false
      t.string :postal_code ,null: false
      t.string :address ,null: false
      t.string :addressee ,null: false
      t.integer :payment_amount ,null: false
      t.integer :postage ,null: false
      
      t.timestamps
    end
  end
end
