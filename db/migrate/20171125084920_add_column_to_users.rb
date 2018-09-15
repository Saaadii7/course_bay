class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
	add_column :users, :username, :string
	add_column :users, :dob, :datetime
	add_column :users, :gender, :string
  add_column :users, :phone_number, :string
  add_column :users, :address, :string
  add_column :users, :country, :string
  add_column :users, :postal_code, :string
  add_column :users, :cnic, :string


  end
end
