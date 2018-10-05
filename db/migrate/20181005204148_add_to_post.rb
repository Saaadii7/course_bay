class AddToPost < ActiveRecord::Migration[5.1]
   def change
  	add_column :posts, :quantity,		 	:integer,	:default => 1
  	add_column :posts, :percentage_off, 	:integer,   :default => 0
  end

end
