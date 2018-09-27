class CreateColumnInTags < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_tags do |t|
    	t.integer :tag_id
    	t.integer :category_id
    end
    
    create_table :brands_tags do|t|
    	t.integer :tag_id
    	t.integer :brand_id
    end
  end
end
