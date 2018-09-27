class RemoveFromBids < ActiveRecord::Migration[5.1]
    def up
    remove_column :bids, :current_price
  end

end
