class AddColumnToAddresses < ActiveRecord::Migration[5.1]
  def change
  	 add_column :addresses, :province_id, :integer
  	 add_column :addresses, :city_id, :integer
  end
end
