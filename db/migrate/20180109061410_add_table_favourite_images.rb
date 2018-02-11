class AddTableFavouriteImages < ActiveRecord::Migration[5.1]
  def change
  	create_table :images_users do |t|
      t.integer :image_id
      t.integer :user_id

      t.timestamps null: false
    end

  end
end
