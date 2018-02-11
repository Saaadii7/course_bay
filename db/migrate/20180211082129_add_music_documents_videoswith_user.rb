class AddMusicDocumentsVideoswithUser < ActiveRecord::Migration[5.1]
  def change
  	
  	add_column :images, :approved, :boolean ,:default => false 

  	# create_table :videos do |t|
   #    t.string :video
   #    t.boolean :approved
   #    t.timestamps null: false
   #  end


  	# create_table :users_videos do |t|
   #    t.integer :video_id
   #    t.integer :user_id
   #    t.timestamps null: false
   #  end

    create_table :sounds do |t|
      t.string :sound
      t.boolean :approved, :default => false
      t.timestamps null: false
    end


  	create_table :sounds_users do |t|
      t.integer :sound_id
      t.integer :user_id
      t.timestamps null: false
    end

    create_table :documents do |t|
      t.string :document
      t.boolean :approved, :default => false
      t.timestamps null: false
    end


  	create_table :documents_users do |t|
      t.integer :document_id
      t.integer :user_id
      t.timestamps null: false
    end

  end
end
