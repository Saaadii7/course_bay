class AddColumnToBrands < ActiveRecord::Migration[5.1]
  def change
  add_column :brands, :photo, :string
  end
end
