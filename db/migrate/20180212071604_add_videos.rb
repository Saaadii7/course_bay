class AddVideos < ActiveRecord::Migration[5.1]
  def change
  	create_table :videos do |t|
      t.string :video
      t.boolean :approved, :default => false
      t.timestamps null: false
    end


  	create_table :users_videos do |t|
      t.integer :video_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
