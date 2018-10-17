class AddColumnToBid < ActiveRecord::Migration[5.1]
  def change
  	add_column :bids, :price, :integer
  end
end
