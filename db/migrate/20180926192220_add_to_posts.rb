class AddToPosts < ActiveRecord::Migration[5.1]
 
  def change
  	add_column :posts, :start_datetime, 	:datetime
  	add_column :posts, :end_datetime, 		:datetime
  	add_column :posts, :current_bid, 		:integer
  end

end
