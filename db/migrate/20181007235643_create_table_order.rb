class CreateTableOrder < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
    	t.integer :user_id
    	t.integer :cart_id
    	t.integer :address_id
    	t.timestamps
    end
    create_table :order_items do |t|
    	t.integer :order_id
    	t.integer :post_id
    	t.timestamps
    end
  end
end
