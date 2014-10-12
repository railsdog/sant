class CreateOrderSelections < ActiveRecord::Migration
  def change
    create_table :order_selections do |t|
      t.integer :order_id
      t.integer :product_id

      t.timestamps
    end
  end
end