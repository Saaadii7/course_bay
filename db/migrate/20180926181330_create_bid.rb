class CreateBid < ActiveRecord::Migration[5.1]
  def change
    create_table :bids do |t|
    	t.integer :post_id
    	t.integer :user_id
    	t.integer :current_price
    	t.timestamps
    end
  end
end
