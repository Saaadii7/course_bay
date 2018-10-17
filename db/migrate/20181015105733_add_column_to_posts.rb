class AddColumnToPosts < ActiveRecord::Migration[5.1]
  def change
  	add_column :posts, :status, :boolean, :default => true
  end
end
