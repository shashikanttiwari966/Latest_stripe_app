class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.integer :sales_count
      t.string :stripe_product_id
      t.string :stripe_price_id
      t.string :currency, default: "usd"
    

      t.timestamps
    end
  end
end
