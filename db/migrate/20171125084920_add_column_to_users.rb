class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change

	add_column :users, :dob, :datetime  
	add_column :users, :gender, :string  


  end
end
