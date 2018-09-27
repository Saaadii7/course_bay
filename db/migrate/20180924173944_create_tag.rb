class CreateTag < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
    	t.string :name
    	 t.timestamps
    end
    
    create_table :sub_categories_tags do |t|
    	t.integer :tag_id
    	t.integer :sub_category_id
    	t.timestamps
    end
    
    create_table :categories_sub_categories do |t|
    	t.integer :category_id
    	t.integer :sub_category_id
    	t.timestamps
	end
	remove_column :sub_categories, :category_id, :integer
  end
end
