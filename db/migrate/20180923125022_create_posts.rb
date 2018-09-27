class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
	  t.string  :name
      t.string  :description
      t.string  :price
      t.integer :ptype
      t.integer :category_id
      t.integer :sub_category_id
      t.integer :brand_id
      t.integer :user_id
      t.string  :photo
      t.integer :starting_bid 
      t.timestamps
    end
  end
end
