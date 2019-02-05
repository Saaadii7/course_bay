class Addjsontoservice < ActiveRecord::Migration[5.1]
  def change
  	add_column :services, :image, :json
  end
end
