class CreateTableForBrandsCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :brands_categories do |t|
    t.integer :brand_id
    t.integer :category_id
    end
  end
end
