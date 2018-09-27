class RemovesubCategoryIdFrombrands < ActiveRecord::Migration[5.1]
  def up
      remove_column :brands, :sub_category_id
    end
  
end
